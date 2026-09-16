import { all, one, run, batch } from '../db.js';
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

function cleanStr(value) {
  if (typeof value !== 'string') return null;
  const trimmed = value.trim();
  return trimmed || null;
}

function toProfile(user) {
  return {
    id: user.id,
    username: user.username,
    display_name: user.display_name || null,
    email: user.email || null,
    birth_date: user.birth_date || null,
    country: user.country || null,
    language: user.language || 'english',
    short_bio: user.short_bio || null,
    portrait: user.portrait || null,
    created_at: user.created_at || null,
  };
}

async function syncAuthorFromUser(db, user) {
  let author = await one(db, 'SELECT id FROM authors WHERE user_id = ?', [user.id]);
  if (!author) {
    author = await one(
      db,
      'SELECT id FROM authors WHERE name = ? ORDER BY (CASE WHEN user_id IS NOT NULL THEN 0 ELSE 1 END), id LIMIT 1',
      [user.display_name || user.username]
    );
  }
  if (!author) return;
  await run(
    db,
    `UPDATE authors SET user_id = ?, name = ?, country = COALESCE(?, country), primary_language = COALESCE(?, primary_language),
     birth_date = COALESCE(?, birth_date), short_bio = COALESCE(?, short_bio), portrait = COALESCE(?, portrait),
     updated_at = CURRENT_TIMESTAMP WHERE id = ?`,
    [
      user.id,
      user.display_name || user.username,
      user.country, user.language, user.birth_date, user.short_bio, user.portrait,
      author.id,
    ]
  );
}

async function findAuthorByUser(db, user) {
  const author = await one(db, 'SELECT slug FROM authors WHERE user_id = ?', [user.id]);
  if (author) return author;
  return one(
    db,
    'SELECT slug FROM authors WHERE name = ? ORDER BY (CASE WHEN user_id IS NULL THEN 0 ELSE 1 END), id LIMIT 1',
    [user.display_name || user.username]
  );
}

export const routes = [
  {
    method: 'POST',
    path: '/api/user-auth/register',
    handler: async (ctx) => {
      const { db, env } = ctx;
      const body = await readBody(ctx.request);
      try {
        const { username, email, password, display_name, birth_date, country, language, short_bio, portrait } = body || {};
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
          `INSERT INTO users (username, email, password_hash, display_name, birth_date, country, language, short_bio, portrait)
           VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)`,
          [
            name,
            email ? email.trim() : null,
            hash,
            cleanStr(display_name),
            cleanStr(birth_date),
            cleanStr(country),
            cleanStr(language) || 'english',
            cleanStr(short_bio),
            cleanStr(portrait),
          ]
        );

        const user = await one(db, 'SELECT * FROM users WHERE id = ?', [result.lastInsertRowid]);
        const token = await signToken({ id: user.id, username: user.username }, secret(env));
        return ok({ user: toProfile(user) }, 201, userCookie(env, token));
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
          { user: toProfile(user) },
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
      const user = await one(db, 'SELECT * FROM users WHERE id = ?', [siteUser.id]);
      if (!user) return fail('User not found', 401);
      const author = await findAuthorByUser(db, user);
      const profile = toProfile(user);
      if (author) {
        profile.author_slug = author.slug;
        profile.has_author = true;
      }
      return ok({ user: profile });
    },
  },
  {
    method: 'PUT',
    path: '/api/user-auth/profile',
    userAuth: true,
    handler: async (ctx) => {
      const { db, siteUser } = ctx;
      const body = await readBody(ctx.request);
      try {
        const user = await one(db, 'SELECT * FROM users WHERE id = ?', [siteUser.id]);
        if (!user) return fail('User not found', 401);

        const email = cleanStr(body.email);
        const display_name = cleanStr(body.display_name);
        const birth_date = cleanStr(body.birth_date);
        const country = cleanStr(body.country);
        const language = cleanStr(body.language);
        const short_bio = cleanStr(body.short_bio);
        const portrait = cleanStr(body.portrait);

        if (email) {
          const existingEmail = await one(
            db,
            'SELECT id FROM users WHERE LOWER(email) = LOWER(?) AND id != ?',
            [email, user.id]
          );
          if (existingEmail) return fail('Email already registered', 409);
        }

        await run(
          db,
          `UPDATE users SET email = ?, display_name = ?, birth_date = ?, country = ?, language = ?, short_bio = ?, portrait = ?
           WHERE id = ?`,
          [
            email, display_name, birth_date, country, language || 'english', short_bio, portrait,
            user.id,
          ]
        );

        const updated = await one(db, 'SELECT * FROM users WHERE id = ?', [user.id]);
        await syncAuthorFromUser(db, updated);

        const author = await findAuthorByUser(db, updated);
        const profile = toProfile(updated);
        if (author) {
          profile.author_slug = author.slug;
          profile.has_author = true;
        }
        return ok({ user: profile });
      } catch {
        return fail('Failed to update profile', 500);
      }
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
             OR CAST(id AS TEXT) = ?
             ORDER BY username COLLATE NOCASE
             LIMIT 50`,
            [`%${search}%`, `%${search}%`, search]
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
    method: 'DELETE',
    path: '/api/user-auth/admin/users/:id',
    admin: true,
    handler: async (ctx) => {
      const { db, params } = ctx;
      try {
        const user = await one(db, 'SELECT * FROM users WHERE id = ?', [params.id]);
        if (!user) return fail('User not found', 404);

        // Find the linked author (exact via user_id, fallback by name for legacy rows)
        let author = await one(db, 'SELECT id, name FROM authors WHERE user_id = ?', [user.id]);
        if (!author) {
          author = await one(
            db,
            'SELECT id, name FROM authors WHERE name = ? ORDER BY (CASE WHEN user_id IS NOT NULL THEN 0 ELSE 1 END), id LIMIT 1',
            [user.display_name || user.username]
          );
        }

        const statements = [];

        let deletedWritings = 0;
        let authorDeleted = false;
        if (author) {
          const writings = await all(db, 'SELECT id, slug FROM writings WHERE author_id = ?', [author.id]);
          deletedWritings = writings.length;

          // Delete all writings (cascades to writing_categories, collection_writings, daily_words)
          if (writings.length) {
            statements.push(['DELETE FROM writings WHERE author_id = ?', [author.id]]);
          }
          // Delete the linked author
          statements.push(['DELETE FROM authors WHERE id = ?', [author.id]]);
          authorDeleted = true;
        }

        // Delete the user (cascades to submissions + password_reset_tokens)
        statements.push(['DELETE FROM users WHERE id = ?', [user.id]]);

        if (statements.length) await batch(db, statements);

        return ok({
          message: 'User and all related content deleted',
          user: { id: user.id, username: user.username },
          authorDeleted,
          author: author ? { id: author.id, name: author.name } : null,
          deletedWritings,
        });
      } catch {
        return fail('Failed to delete user', 500);
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