import { all, one, run } from '../db.js';
import { ok, fail, readBody } from '../util.js';
import { bcrypt, signToken, serializeCookie } from '../auth.js';

const COOKIE_NAME = 'user_token';

function secret(env) {
  return env.JWT_SECRET || 'amarkobita-secret-key-change-in-production';
}

function userCookie(env, token) {
  return serializeCookie(COOKIE_NAME, token, { httpOnly: true, maxAge: 604800, sameSite: env.COOKIE_SAMESITE || 'lax' });
}

function generateResetToken() {
  const bytes = new Uint8Array(9);
  crypto.getRandomValues(bytes);
  const hex = Array.from(bytes, (b) => b.toString(16).padStart(2, '0')).join('');
  return hex.match(/.{1,6}/g).join('-');
}

async function hashToken(token) {
  const data = new TextEncoder().encode(token);
  const digest = await crypto.subtle.digest('SHA-256', data);
  return Array.from(new Uint8Array(digest), (b) => b.toString(16).padStart(2, '0')).join('');
}

function utcNowString() {
  return new Date().toISOString().slice(0, 19).replace('T', ' ');
}

export const routes = [
  {
    method: 'POST',
    path: '/api/user-auth/register',
    handler: async (ctx) => {
      const { db, env } = ctx;
      const body = await readBody(ctx.request);
      try {
        const { username, email, password } = body || {};
        if (typeof username !== 'string' || username.trim().length < 3) {
          return fail('Username must be at least 3 characters', 400);
        }
        if (typeof password !== 'string' || password.length < 6) {
          return fail('Password must be at least 6 characters', 400);
        }

        const name = username.trim();
        const existing = await one(db, 'SELECT id FROM users WHERE username = ?', [name]);
        if (existing) return fail('Username already taken', 409);

        if (email) {
          const existingEmail = await one(db, 'SELECT id FROM users WHERE LOWER(email) = LOWER(?)', [email]);
          if (existingEmail) return fail('Email already registered', 409);
        }

        const hash = bcrypt.hashSync(password, 10);
        const result = await run(
          db,
          'INSERT INTO users (username, email, password_hash) VALUES (?, ?, ?)',
          [name, email ? email.trim() : null, hash]
        );

        const user = await one(db, 'SELECT id, username, email FROM users WHERE id = ?', [result.lastInsertRowid]);
        const token = await signToken({ id: user.id, username: user.username }, secret(env));
        return ok({ user }, 201, userCookie(env, token));
      } catch {
        return fail('Registration failed', 500);
      }
    },
  },
  {
    method: 'POST',
    path: '/api/user-auth/login',
    handler: async (ctx) => {
      const { db, env } = ctx;
      const body = await readBody(ctx.request);
      try {
        const { username, password } = body;
        if (!username || !password) return fail('Username and password required', 400);

        const user = await one(db, 'SELECT * FROM users WHERE username = ?', [username]);
        if (!user || !bcrypt.compareSync(password, user.password_hash)) {
          return fail('Invalid credentials', 401);
        }

        const token = await signToken({ id: user.id, username: user.username }, secret(env));
        return ok(
          { user: { id: user.id, username: user.username, email: user.email } },
          200,
          userCookie(env, token)
        );
      } catch {
        return fail('Login failed', 500);
      }
    },
  },
  {
    method: 'POST',
    path: '/api/user-auth/logout',
    handler: async () => {
      return ok({ message: 'Logged out' }, 200, serializeCookie(COOKIE_NAME, '', { httpOnly: true, maxAge: 0 }));
    },
  },
  {
    method: 'GET',
    path: '/api/user-auth/me',
    userAuth: true,
    handler: async (ctx) => {
      const { db, siteUser } = ctx;
      const user = await one(db, 'SELECT id, username, email FROM users WHERE id = ?', [siteUser.id]);
      if (!user) return fail('User not found', 401);
      return ok({ user });
    },
  },
  {
    method: 'GET',
    path: '/api/user-auth/admin/users',
    admin: true,
    handler: async (ctx) => {
      const { db } = ctx;
      try {
        const search = String(ctx.query.search || '').trim();
        let rows;
        if (search) {
          rows = await all(
            db,
            `SELECT id, username, email, created_at FROM users
             WHERE LOWER(username) LIKE LOWER(?) OR LOWER(COALESCE(email, '')) LIKE LOWER(?)
             ORDER BY username COLLATE NOCASE
             LIMIT 50`,
            [`%${search}%`, `%${search}%`]
          );
        } else {
          rows = await all(
            db,
            'SELECT id, username, email, created_at FROM users ORDER BY id DESC LIMIT 100'
          );
        }
        return ok({ users: rows });
      } catch {
        return fail('Failed to load users', 500);
      }
    },
  },
  {
    method: 'POST',
    path: '/api/user-auth/admin/reset-token',
    admin: true,
    handler: async (ctx) => {
      const { db } = ctx;
      const body = await readBody(ctx.request);
      try {
        const { username } = body || {};
        if (typeof username !== 'string' || !username.trim()) {
          return fail('Username is required', 400);
        }

        const user = await one(
          db,
          'SELECT id, username, email FROM users WHERE LOWER(username) = LOWER(?)',
          [username.trim()]
        );
        if (!user) return fail('User not found', 404);

        await run(
          db,
          `DELETE FROM password_reset_tokens
           WHERE user_id = ? AND used_at IS NULL AND expires_at > datetime('now')`,
          [user.id]
        );

        const token = generateResetToken();
        const expires = new Date(Date.now() + 24 * 60 * 60 * 1000).toISOString().slice(0, 19).replace('T', ' ');

        await run(
          db,
          'INSERT INTO password_reset_tokens (user_id, token_hash, expires_at) VALUES (?, ?, ?)',
          [user.id, await hashToken(token), expires]
        );

        return ok({
          message: 'Reset token generated',
          username: user.username,
          token,
          expires_at: expires,
          expires_in_hours: 24,
        });
      } catch {
        return fail('Failed to generate reset token', 500);
      }
    },
  },
  {
    method: 'POST',
    path: '/api/user-auth/reset-password',
    handler: async (ctx) => {
      const { db } = ctx;
      const body = await readBody(ctx.request);
      try {
        const { username, token, new_password } = body || {};
        if (typeof username !== 'string' || !username.trim()) {
          return fail('Username is required', 400);
        }
        if (typeof token !== 'string' || !token.trim()) {
          return fail('Reset token is required', 400);
        }
        if (typeof new_password !== 'string' || new_password.length < 6) {
          return fail('Password must be at least 6 characters', 400);
        }
        if (new_password === token.trim()) {
          return fail('Password cannot be the same as the reset token', 400);
        }

        const user = await one(
          db,
          'SELECT id, username FROM users WHERE LOWER(username) = LOWER(?)',
          [username.trim()]
        );
        if (!user) return fail('Invalid or expired reset token', 400);

        const record = await one(
          db,
          `SELECT * FROM password_reset_tokens
           WHERE user_id = ? AND token_hash = ? AND used_at IS NULL AND expires_at > datetime('now')
           ORDER BY id DESC LIMIT 1`,
          [user.id, await hashToken(token.trim())]
        );
        if (!record) return fail('Invalid or expired reset token', 400);

        const hash = bcrypt.hashSync(new_password, 10);
        await run(db, 'UPDATE users SET password_hash = ? WHERE id = ?', [hash, user.id]);
        await run(db, 'UPDATE password_reset_tokens SET used_at = ? WHERE id = ?', [utcNowString(), record.id]);

        return ok({ message: 'Password reset successfully. You can now sign in.' });
      } catch {
        return fail('Password reset failed', 500);
      }
    },
  },
];

export default routes;