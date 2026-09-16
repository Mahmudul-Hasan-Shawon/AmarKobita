-- Migration: link authors to users via user_id
-- Run once against an existing deployment:
--   wrangler d1 execute amarkobita --remote --file=cf/migrations/003_author_user_id.sql
-- (Fresh installs already include this column via cf/schema.sql)

ALTER TABLE authors ADD COLUMN user_id INTEGER REFERENCES users(id) ON DELETE SET NULL;

-- Backfill user_id for existing community authors created before the column existed
UPDATE authors SET user_id = (
  SELECT u.id FROM users u
  WHERE u.username = authors.name OR u.display_name = authors.name
  ORDER BY u.id
  LIMIT 1
)
WHERE user_id IS NULL;