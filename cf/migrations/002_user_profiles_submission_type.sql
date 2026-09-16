-- Migration: user profiles + submission type
-- Run once against an existing deployment:
--   wrangler d1 execute amarkobita --remote --file=cf/migrations/002_user_profiles_submission_type.sql
-- (Fresh installs already include these columns via cf/schema.sql)

ALTER TABLE users ADD COLUMN display_name TEXT;
ALTER TABLE users ADD COLUMN birth_date TEXT;
ALTER TABLE users ADD COLUMN country TEXT;
ALTER TABLE users ADD COLUMN language TEXT DEFAULT 'english';
ALTER TABLE users ADD COLUMN short_bio TEXT;
ALTER TABLE users ADD COLUMN portrait TEXT;

ALTER TABLE submissions ADD COLUMN type TEXT DEFAULT 'poetry';
ALTER TABLE submissions ADD COLUMN updated_at DATETIME;