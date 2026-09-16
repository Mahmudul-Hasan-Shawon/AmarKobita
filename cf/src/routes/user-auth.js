import { one, run } from '../db.js';
import { ok, fail, readBody } from '../util.js';
import { bcrypt, signToken, serializeCookie } from '../auth.js';

const COOKIE_NAME = 'user_token';

function secret(env) {
  return env.JWT_SECRET || 'amarkobita-secret-key-change-in-production';
}

function userCookie(env, token) {
  return serializeCookie(COOKIE_NAME, token, { httpOnly: true, maxAge: 604800, sameSite: env.COOKIE_SAMESITE || 'lax' });
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
];

export default routes;