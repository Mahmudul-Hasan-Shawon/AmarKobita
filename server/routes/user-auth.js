import { Router } from 'express';
import crypto from 'crypto';
import bcrypt from 'bcryptjs';
import { getDb } from '../db/index.js';
import { generateToken, userAuthMiddleware, authMiddleware } from '../middleware/auth.js';

const router = Router();

function hashToken(token) {
  return crypto.createHash('sha256').update(token).digest('hex');
}

function generateResetToken() {
  const raw = crypto.randomBytes(9).toString('hex');
  return raw.match(/.{1,6}/g).join('-');
}

function utcNowString() {
  return new Date().toISOString().slice(0, 19).replace('T', ' ');
}

router.post('/register', (req, res) => {
  try {
    const { username, email, password } = req.body || {};
    if (typeof username !== 'string' || username.trim().length < 3) {
      return res.status(400).json({ error: 'Username must be at least 3 characters' });
    }
    if (typeof password !== 'string' || password.length < 6) {
      return res.status(400).json({ error: 'Password must be at least 6 characters' });
    }

    const db = getDb();
    const existing = db.prepare('SELECT id FROM users WHERE username = ?').get(username.trim());
    if (existing) {
      return res.status(409).json({ error: 'Username already taken' });
    }

    if (email) {
      const existingEmail = db.prepare('SELECT id FROM users WHERE LOWER(email) = LOWER(?)').get(email);
      if (existingEmail) {
        return res.status(409).json({ error: 'Email already registered' });
      }
    }

    const hash = bcrypt.hashSync(password, 10);
    const result = db
      .prepare('INSERT INTO users (username, email, password_hash) VALUES (?, ?, ?)')
      .run(username.trim(), email ? email.trim() : null, hash);

    const user = db.prepare('SELECT id, username, email FROM users WHERE id = ?').get(result.lastInsertRowid);
    const token = generateToken(user);
    const sameSite = process.env.COOKIE_SAMESITE || 'lax';
    res.cookie('user_token', token, {
      httpOnly: true,
      secure: process.env.NODE_ENV === 'production' || sameSite === 'none',
      sameSite,
      maxAge: 7 * 24 * 60 * 60 * 1000,
    });

    res.status(201).json({ user });
  } catch (err) {
    res.status(500).json({ error: 'Registration failed' });
  }
});

router.post('/login', (req, res) => {
  try {
    const { username, password } = req.body;
    if (!username || !password) {
      return res.status(400).json({ error: 'Username and password required' });
    }

    const db = getDb();
    const user = db.prepare('SELECT * FROM users WHERE username = ?').get(username);

    if (!user || !bcrypt.compareSync(password, user.password_hash)) {
      return res.status(401).json({ error: 'Invalid credentials' });
    }

    const token = generateToken(user);
    const sameSite = process.env.COOKIE_SAMESITE || 'lax';
    res.cookie('user_token', token, {
      httpOnly: true,
      secure: process.env.NODE_ENV === 'production' || sameSite === 'none',
      sameSite,
      maxAge: 7 * 24 * 60 * 60 * 1000,
    });

    res.json({ user: { id: user.id, username: user.username, email: user.email } });
  } catch (err) {
    res.status(500).json({ error: 'Login failed' });
  }
});

router.post('/logout', (req, res) => {
  res.clearCookie('user_token');
  res.json({ message: 'Logged out' });
});

router.get('/me', userAuthMiddleware, (req, res) => {
  const db = getDb();
  const user = db.prepare('SELECT id, username, email FROM users WHERE id = ?').get(req.user.id);
  if (!user) return res.status(401).json({ error: 'User not found' });
  res.json({ user });
});

router.get('/admin/users', authMiddleware, (req, res) => {
  try {
    const db = getDb();
    const search = (req.query.search || '').trim();

    let rows;
    if (search) {
      rows = db
        .prepare(`
          SELECT id, username, email, created_at FROM users
          WHERE LOWER(username) LIKE LOWER(?) OR LOWER(COALESCE(email, '')) LIKE LOWER(?)
          ORDER BY username COLLATE NOCASE
          LIMIT 50
        `)
        .all(`%${search}%`, `%${search}%`);
    } else {
      rows = db
        .prepare('SELECT id, username, email, created_at FROM users ORDER BY id DESC LIMIT 100')
        .all();
    }

    res.json({ users: rows });
  } catch (err) {
    res.status(500).json({ error: 'Failed to load users' });
  }
});

router.post('/admin/reset-token', authMiddleware, (req, res) => {
  try {
    const { username } = req.body || {};
    if (typeof username !== 'string' || !username.trim()) {
      return res.status(400).json({ error: 'Username is required' });
    }

    const db = getDb();
    const user = db
      .prepare('SELECT id, username, email FROM users WHERE LOWER(username) = LOWER(?)')
      .get(username.trim());
    if (!user) {
      return res.status(404).json({ error: 'User not found' });
    }

    db.prepare(`
      DELETE FROM password_reset_tokens
      WHERE user_id = ? AND used_at IS NULL AND expires_at > datetime('now')
    `).run(user.id);

    const token = generateResetToken();
    const expires = new Date(Date.now() + 24 * 60 * 60 * 1000).toISOString().slice(0, 19).replace('T', ' ');

    db.prepare(`
      INSERT INTO password_reset_tokens (user_id, token_hash, expires_at)
      VALUES (?, ?, ?)
    `).run(user.id, hashToken(token), expires);

    res.json({
      message: 'Reset token generated',
      username: user.username,
      token,
      expires_at: expires,
      expires_in_hours: 24,
    });
  } catch (err) {
    res.status(500).json({ error: 'Failed to generate reset token' });
  }
});

router.post('/reset-password', (req, res) => {
  try {
    const { username, token, new_password } = req.body || {};
    if (typeof username !== 'string' || !username.trim()) {
      return res.status(400).json({ error: 'Username is required' });
    }
    if (typeof token !== 'string' || !token.trim()) {
      return res.status(400).json({ error: 'Reset token is required' });
    }
    if (typeof new_password !== 'string' || new_password.length < 6) {
      return res.status(400).json({ error: 'Password must be at least 6 characters' });
    }
    if (new_password === token.trim()) {
      return res.status(400).json({ error: 'Password cannot be the same as the reset token' });
    }

    const db = getDb();
    const user = db
      .prepare('SELECT id, username FROM users WHERE LOWER(username) = LOWER(?)')
      .get(username.trim());
    if (!user) {
      return res.status(400).json({ error: 'Invalid or expired reset token' });
    }

    const record = db
      .prepare(`
        SELECT * FROM password_reset_tokens
        WHERE user_id = ? AND token_hash = ? AND used_at IS NULL AND expires_at > datetime('now')
        ORDER BY id DESC LIMIT 1
      `)
      .get(user.id, hashToken(token.trim()));

    if (!record) {
      return res.status(400).json({ error: 'Invalid or expired reset token' });
    }

    const hash = bcrypt.hashSync(new_password, 10);
    db.prepare('UPDATE users SET password_hash = ? WHERE id = ?').run(hash, user.id);
    db.prepare('UPDATE password_reset_tokens SET used_at = ? WHERE id = ?').run(utcNowString(), record.id);

    res.json({ message: 'Password reset successfully. You can now sign in.' });
  } catch (err) {
    res.status(500).json({ error: 'Password reset failed' });
  }
});

export default router;