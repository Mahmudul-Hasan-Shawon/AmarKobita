import { Router } from 'express';
import { getDb } from '../db/index.js';
import { authMiddleware, userAuthMiddleware } from '../middleware/auth.js';
import { slugify, generateUniqueSlug } from './writings.js';

const router = Router();

function enrichSubmission(db, submission) {
  if (!submission) return null;
  const user = db.prepare('SELECT id, username, email FROM users WHERE id = ?').get(submission.user_id);
  const category = submission.category_id
    ? db.prepare('SELECT id, name, slug FROM categories WHERE id = ?').get(submission.category_id)
    : null;
  const writing = submission.writing_id
    ? db.prepare('SELECT id, title, slug, status FROM writings WHERE id = ?').get(submission.writing_id)
    : null;
  return { ...submission, user, category, writing };
}

// User: create submission
router.post('/', userAuthMiddleware, (req, res) => {
  try {
    const { title, text, original_text, language, category_id } = req.body;
    if (!text || !text.trim()) return res.status(400).json({ error: 'Text is required' });

    const db = getDb();
    const result = db.prepare(`
      INSERT INTO submissions (user_id, title, text, original_text, language, category_id)
      VALUES (?, ?, ?, ?, ?, ?)
    `).run(
      req.user.id,
      title || null,
      text.trim(),
      original_text || null,
      language || 'english',
      category_id || null
    );

    const submission = db.prepare('SELECT * FROM submissions WHERE id = ?').get(result.lastInsertRowid);
    res.status(201).json(enrichSubmission(db, submission));
  } catch (err) {
    res.status(500).json({ error: 'Failed to submit writing' });
  }
});

// User: list own submissions
router.get('/mine', userAuthMiddleware, (req, res) => {
  try {
    const db = getDb();
    const submissions = db.prepare(`
      SELECT * FROM submissions WHERE user_id = ? ORDER BY created_at DESC
    `).all(req.user.id);
    res.json(submissions.map(s => enrichSubmission(db, s)));
  } catch (err) {
    res.status(500).json({ error: 'Failed to fetch submissions' });
  }
});

// User: get single own submission
router.get('/mine/:id', userAuthMiddleware, (req, res) => {
  try {
    const db = getDb();
    const submission = db.prepare('SELECT * FROM submissions WHERE id = ? AND user_id = ?').get(req.params.id, req.user.id);
    if (!submission) return res.status(404).json({ error: 'Submission not found' });
    res.json(enrichSubmission(db, submission));
  } catch (err) {
    res.status(500).json({ error: 'Failed to fetch submission' });
  }
});

// User: delete own pending submission
router.delete('/mine/:id', userAuthMiddleware, (req, res) => {
  try {
    const db = getDb();
    const submission = db.prepare('SELECT * FROM submissions WHERE id = ? AND user_id = ?').get(req.params.id, req.user.id);
    if (!submission) return res.status(404).json({ error: 'Submission not found' });
    if (submission.status !== 'pending') {
      return res.status(400).json({ error: 'Only pending submissions can be deleted' });
    }
    db.prepare('DELETE FROM submissions WHERE id = ?').run(req.params.id);
    res.json({ message: 'Submission deleted' });
  } catch (err) {
    res.status(500).json({ error: 'Failed to delete submission' });
  }
});

// Admin: list submissions
router.get('/admin/list', authMiddleware, (req, res) => {
  try {
    const db = getDb();
    const { status, page = 1, limit = 20 } = req.query;
    const offset = (parseInt(page) - 1) * parseInt(limit);

    let where = [];
    let params = [];
    if (status) {
      where.push('s.status = ?');
      params.push(status);
    }
    const whereClause = where.length ? `WHERE ${where.join(' AND ')}` : '';

    const total = db.prepare(`
      SELECT COUNT(*) as total FROM submissions s ${whereClause}
    `).get(...params).total;

    const submissions = db.prepare(`
      SELECT s.*, u.username as user_name, u.email as user_email
      FROM submissions s
      LEFT JOIN users u ON u.id = s.user_id
      ${whereClause}
      ORDER BY CASE s.status WHEN 'pending' THEN 0 ELSE 1 END, s.created_at DESC
      LIMIT ? OFFSET ?
    `).all(...params, parseInt(limit), offset);

    res.json({
      submissions,
      pagination: {
        page: parseInt(page),
        limit: parseInt(limit),
        total,
        pages: Math.ceil(total / parseInt(limit)),
      },
    });
  } catch (err) {
    res.status(500).json({ error: 'Failed to fetch submissions' });
  }
});

// Admin: get submission detail
router.get('/admin/:id', authMiddleware, (req, res) => {
  try {
    const db = getDb();
    const submission = db.prepare('SELECT * FROM submissions WHERE id = ?').get(req.params.id);
    if (!submission) return res.status(404).json({ error: 'Submission not found' });
    res.json(enrichSubmission(db, submission));
  } catch (err) {
    res.status(500).json({ error: 'Failed to fetch submission' });
  }
});

// Admin: approve submission -> creates a draft writing + ensures author exists
router.post('/admin/:id/approve', authMiddleware, (req, res) => {
  try {
    const db = getDb();
    const id = req.params.id;
    const submission = db.prepare('SELECT * FROM submissions WHERE id = ?').get(id);
    if (!submission) return res.status(404).json({ error: 'Submission not found' });
    if (submission.status !== 'pending') {
      return res.status(400).json({ error: 'Only pending submissions can be approved' });
    }

    const user = db.prepare('SELECT id, username FROM users WHERE id = ?').get(submission.user_id);

    let author = db.prepare('SELECT id FROM authors WHERE name = ?').get(user.username);
    if (!author) {
      const slug = generateUniqueSlug(db, slugify(user.username));
      const result = db.prepare(`
        INSERT INTO authors (name, slug, short_bio)
        VALUES (?, ?, ?)
      `).run(user.username, slug, 'Community contributor. Published on AmarKobita.');
      author = { id: result.lastInsertRowid };
    }

    const writingSlug = generateUniqueSlug(db, slugify(submission.title || submission.text.substring(0, 80)));
    const rtl = ['urdu', 'arabic', 'persian'].includes((submission.language || 'english').toLowerCase());
    const writingResult = db.prepare(`
      INSERT INTO writings (author_id, title, slug, text, original_text, type, language, direction, status, verification_status, date)
      VALUES (?, ?, ?, ?, ?, 'poetry', ?, ?, 'draft', 'unverified', ?)
    `).run(
      author.id,
      submission.title || null,
      writingSlug,
      submission.text,
      submission.original_text || null,
      submission.language || 'english',
      rtl ? 'rtl' : 'ltr',
      new Date().toISOString().split('T')[0]
    );

    const writingId = writingResult.lastInsertRowid;

    if (submission.category_id) {
      db.prepare('INSERT OR IGNORE INTO writing_categories (writing_id, category_id) VALUES (?, ?)')
        .run(writingId, submission.category_id);
    }

    db.prepare(`
      UPDATE submissions SET status = 'approved', writing_id = ?, reviewed_at = CURRENT_TIMESTAMP WHERE id = ?
    `).run(writingId, id);

    const updated = db.prepare('SELECT * FROM submissions WHERE id = ?').get(id);
    res.json(enrichSubmission(db, updated));
  } catch (err) {
    res.status(500).json({ error: 'Failed to approve submission' });
  }
});

// Admin: reject submission
router.post('/admin/:id/reject', authMiddleware, (req, res) => {
  try {
    const db = getDb();
    const id = req.params.id;
    const submission = db.prepare('SELECT * FROM submissions WHERE id = ?').get(id);
    if (!submission) return res.status(404).json({ error: 'Submission not found' });
    if (submission.status !== 'pending') {
      return res.status(400).json({ error: 'Only pending submissions can be rejected' });
    }

    const { note } = req.body || {};
    db.prepare(`
      UPDATE submissions SET status = 'rejected', admin_note = ?, reviewed_at = CURRENT_TIMESTAMP WHERE id = ?
    `).run(note || null, id);

    const updated = db.prepare('SELECT * FROM submissions WHERE id = ?').get(id);
    res.json(enrichSubmission(db, updated));
  } catch (err) {
    res.status(500).json({ error: 'Failed to reject submission' });
  }
});

// Admin: delete submission
router.delete('/admin/:id', authMiddleware, (req, res) => {
  try {
    const db = getDb();
    const result = db.prepare('DELETE FROM submissions WHERE id = ?').run(req.params.id);
    if (result.changes === 0) return res.status(404).json({ error: 'Submission not found' });
    res.json({ message: 'Submission deleted' });
  } catch (err) {
    res.status(500).json({ error: 'Failed to delete submission' });
  }
});

export default router;