import { all, one, run } from '../db.js';
import { ok, fail, readBody, slugify, generateUniqueSlug } from '../util.js';

async function enrichSubmission(db, submission) {
  if (!submission) return null;
  const user = await one(db, 'SELECT id, username, email FROM users WHERE id = ?', [submission.user_id]);
  const category = submission.category_id
    ? await one(db, 'SELECT id, name, slug FROM categories WHERE id = ?', [submission.category_id])
    : null;
  const writing = submission.writing_id
    ? await one(db, 'SELECT id, title, slug, status FROM writings WHERE id = ?', [submission.writing_id])
    : null;
  return { ...submission, user, category, writing };
}

export const routes = [
  {
    method: 'POST',
    path: '/api/submissions',
    userAuth: true,
    handler: async (ctx) => {
      const { db, siteUser } = ctx;
      const body = await readBody(ctx.request);
      try {
        const { title, text, original_text, language, category_id } = body;
        if (!text || !text.trim()) return fail('Text is required', 400);

        const result = await run(
          db,
          `INSERT INTO submissions (user_id, title, text, original_text, language, category_id)
           VALUES (?, ?, ?, ?, ?, ?)`,
          [
            siteUser.id,
            title || null,
            text.trim(),
            original_text || null,
            language || 'english',
            category_id || null,
          ]
        );

        const submission = await one(db, 'SELECT * FROM submissions WHERE id = ?', [result.lastInsertRowid]);
        return ok(await enrichSubmission(db, submission), 201);
      } catch {
        return fail('Failed to submit writing', 500);
      }
    },
  },
  {
    method: 'GET',
    path: '/api/submissions/mine',
    userAuth: true,
    handler: async (ctx) => {
      const { db, siteUser } = ctx;
      try {
        const submissions = await all(
          db,
          'SELECT * FROM submissions WHERE user_id = ? ORDER BY created_at DESC',
          [siteUser.id]
        );
        const out = [];
        for (const s of submissions) out.push(await enrichSubmission(db, s));
        return ok(out);
      } catch {
        return fail('Failed to fetch submissions', 500);
      }
    },
  },
  {
    method: 'GET',
    path: '/api/submissions/mine/:id',
    userAuth: true,
    handler: async (ctx) => {
      const { db, siteUser, params } = ctx;
      try {
        const submission = await one(
          db,
          'SELECT * FROM submissions WHERE id = ? AND user_id = ?',
          [params.id, siteUser.id]
        );
        if (!submission) return fail('Submission not found', 404);
        return ok(await enrichSubmission(db, submission));
      } catch {
        return fail('Failed to fetch submission', 500);
      }
    },
  },
  {
    method: 'DELETE',
    path: '/api/submissions/mine/:id',
    userAuth: true,
    handler: async (ctx) => {
      const { db, siteUser, params } = ctx;
      try {
        const submission = await one(
          db,
          'SELECT * FROM submissions WHERE id = ? AND user_id = ?',
          [params.id, siteUser.id]
        );
        if (!submission) return fail('Submission not found', 404);
        if (submission.status !== 'pending') {
          return fail('Only pending submissions can be deleted', 400);
        }
        await run(db, 'DELETE FROM submissions WHERE id = ?', [params.id]);
        return ok({ message: 'Submission deleted' });
      } catch {
        return fail('Failed to delete submission', 500);
      }
    },
  },
  {
    method: 'GET',
    path: '/api/submissions/admin/list',
    admin: true,
    handler: async (ctx) => {
      const { db, query } = ctx;
      try {
        const page = parseInt(query.page || '1');
        const limit = parseInt(query.limit || '20');
        const offset = (page - 1) * limit;

        const where = [];
        const params = [];
        if (query.status) {
          where.push('s.status = ?');
          params.push(query.status);
        }
        const whereClause = where.length ? `WHERE ${where.join(' AND ')}` : '';

        const totalRow = await one(
          db,
          `SELECT COUNT(*) as total FROM submissions s ${whereClause}`,
          params
        );
        const total = totalRow?.total ?? 0;

        const submissions = await all(
          db,
          `SELECT s.*, u.username as user_name, u.email as user_email
           FROM submissions s
           LEFT JOIN users u ON u.id = s.user_id
           ${whereClause}
           ORDER BY CASE s.status WHEN 'pending' THEN 0 ELSE 1 END, s.created_at DESC
           LIMIT ? OFFSET ?`,
          [...params, limit, offset]
        );

        return ok({
          submissions,
          pagination: { page, limit, total, pages: Math.ceil(total / limit) },
        });
      } catch {
        return fail('Failed to fetch submissions', 500);
      }
    },
  },
  {
    method: 'GET',
    path: '/api/submissions/admin/:id',
    admin: true,
    handler: async (ctx) => {
      const { db, params } = ctx;
      try {
        const submission = await one(db, 'SELECT * FROM submissions WHERE id = ?', [params.id]);
        if (!submission) return fail('Submission not found', 404);
        return ok(await enrichSubmission(db, submission));
      } catch {
        return fail('Failed to fetch submission', 500);
      }
    },
  },
  {
    method: 'POST',
    path: '/api/submissions/admin/:id/approve',
    admin: true,
    handler: async (ctx) => {
      const { db, params } = ctx;
      try {
        const id = params.id;
        const submission = await one(db, 'SELECT * FROM submissions WHERE id = ?', [id]);
        if (!submission) return fail('Submission not found', 404);
        if (submission.status !== 'pending') {
          return fail('Only pending submissions can be approved', 400);
        }

        const user = await one(db, 'SELECT id, username FROM users WHERE id = ?', [submission.user_id]);

        let author = await one(db, 'SELECT id FROM authors WHERE name = ?', [user.username]);
        if (!author) {
          const slug = await generateUniqueSlug(db, 'authors', slugify(user.username));
          const result = await run(
            db,
            'INSERT INTO authors (name, slug, short_bio) VALUES (?, ?, ?)',
            [user.username, slug, 'Community contributor. Published on AmarKobita.']
          );
          author = { id: result.lastInsertRowid };
        }

        const writingSlug = await generateUniqueSlug(
          db,
          'writings',
          slugify(submission.title || submission.text.substring(0, 80))
        );
        const rtl = ['urdu', 'arabic', 'persian'].includes((submission.language || 'english').toLowerCase());
        const writingResult = await run(
          db,
          `INSERT INTO writings (author_id, title, slug, text, original_text, type, language, direction, status, verification_status, date)
           VALUES (?, ?, ?, ?, ?, 'poetry', ?, ?, 'draft', 'unverified', ?)`,
          [
            author.id,
            submission.title || null,
            writingSlug,
            submission.text,
            submission.original_text || null,
            submission.language || 'english',
            rtl ? 'rtl' : 'ltr',
            new Date().toISOString().split('T')[0],
          ]
        );

        const writingId = writingResult.lastInsertRowid;

        if (submission.category_id) {
          await run(db, 'INSERT OR IGNORE INTO writing_categories (writing_id, category_id) VALUES (?, ?)', [writingId, submission.category_id]);
        }

        await run(
          db,
          "UPDATE submissions SET status = 'approved', writing_id = ?, reviewed_at = CURRENT_TIMESTAMP WHERE id = ?",
          [writingId, id]
        );

        const updated = await one(db, 'SELECT * FROM submissions WHERE id = ?', [id]);
        return ok(await enrichSubmission(db, updated));
      } catch {
        return fail('Failed to approve submission', 500);
      }
    },
  },
  {
    method: 'POST',
    path: '/api/submissions/admin/:id/reject',
    admin: true,
    handler: async (ctx) => {
      const { db, params } = ctx;
      const body = await readBody(ctx.request);
      try {
        const id = params.id;
        const submission = await one(db, 'SELECT * FROM submissions WHERE id = ?', [id]);
        if (!submission) return fail('Submission not found', 404);
        if (submission.status !== 'pending') {
          return fail('Only pending submissions can be rejected', 400);
        }

        const { note } = body || {};
        await run(
          db,
          "UPDATE submissions SET status = 'rejected', admin_note = ?, reviewed_at = CURRENT_TIMESTAMP WHERE id = ?",
          [note || null, id]
        );

        const updated = await one(db, 'SELECT * FROM submissions WHERE id = ?', [id]);
        return ok(await enrichSubmission(db, updated));
      } catch {
        return fail('Failed to reject submission', 500);
      }
    },
  },
  {
    method: 'DELETE',
    path: '/api/submissions/admin/:id',
    admin: true,
    handler: async (ctx) => {
      const { db, params } = ctx;
      try {
        const result = await run(db, 'DELETE FROM submissions WHERE id = ?', [params.id]);
        if (result.changes === 0) return fail('Submission not found', 404);
        return ok({ message: 'Submission deleted' });
      } catch {
        return fail('Failed to delete submission', 500);
      }
    },
  },
];

export default routes;