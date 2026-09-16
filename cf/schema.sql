-- Cloudflare D1 schema for AmarKobita
-- Apply with: wrangler d1 execute amarkobita --remote --file=cf/schema.sql

CREATE TABLE IF NOT EXISTS admin (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  username TEXT UNIQUE NOT NULL,
  password_hash TEXT NOT NULL,
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE IF NOT EXISTS users (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  username TEXT UNIQUE NOT NULL,
  email TEXT,
  password_hash TEXT NOT NULL,
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE IF NOT EXISTS authors (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  name TEXT NOT NULL,
  slug TEXT UNIQUE NOT NULL,
  short_bio TEXT,
  full_bio TEXT,
  portrait TEXT,
  birth_date TEXT,
  death_date TEXT,
  country TEXT,
  primary_language TEXT,
  other_languages TEXT,
  tags TEXT,
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
  updated_at DATETIME DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE IF NOT EXISTS categories (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  name TEXT UNIQUE NOT NULL,
  slug TEXT UNIQUE NOT NULL,
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE IF NOT EXISTS writings (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  author_id INTEGER,
  title TEXT,
  slug TEXT UNIQUE NOT NULL,
  text TEXT NOT NULL,
  original_text TEXT,
  english_translation TEXT,
  bangla_translation TEXT,
  urdu_translation TEXT,
  type TEXT DEFAULT 'quote',
  language TEXT DEFAULT 'english',
  direction TEXT DEFAULT 'ltr',
  source TEXT,
  source_url TEXT,
  translator TEXT,
  source_book TEXT,
  source_chapter TEXT,
  source_page TEXT,
  source_notes TEXT,
  date TEXT,
  status TEXT DEFAULT 'draft',
  featured INTEGER DEFAULT 0,
  editors_pick INTEGER DEFAULT 0,
  verification_status TEXT DEFAULT 'attributed',
  views INTEGER DEFAULT 0,
  saves INTEGER DEFAULT 0,
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
  updated_at DATETIME DEFAULT CURRENT_TIMESTAMP,
  FOREIGN KEY (author_id) REFERENCES authors(id) ON DELETE SET NULL
);

CREATE TABLE IF NOT EXISTS submissions (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  user_id INTEGER NOT NULL,
  title TEXT,
  text TEXT NOT NULL,
  original_text TEXT,
  language TEXT DEFAULT 'english',
  category_id INTEGER,
  status TEXT DEFAULT 'pending',
  admin_note TEXT,
  writing_id INTEGER,
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
  reviewed_at DATETIME,
  FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE,
  FOREIGN KEY (category_id) REFERENCES categories(id) ON DELETE SET NULL,
  FOREIGN KEY (writing_id) REFERENCES writings(id) ON DELETE SET NULL
);

CREATE TABLE IF NOT EXISTS writing_categories (
  writing_id INTEGER NOT NULL,
  category_id INTEGER NOT NULL,
  PRIMARY KEY (writing_id, category_id),
  FOREIGN KEY (writing_id) REFERENCES writings(id) ON DELETE CASCADE,
  FOREIGN KEY (category_id) REFERENCES categories(id) ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS collections (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  name TEXT NOT NULL,
  slug TEXT UNIQUE NOT NULL,
  description TEXT,
  cover_image TEXT,
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
  updated_at DATETIME DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE IF NOT EXISTS collection_writings (
  collection_id INTEGER NOT NULL,
  writing_id INTEGER NOT NULL,
  position INTEGER DEFAULT 0,
  PRIMARY KEY (collection_id, writing_id),
  FOREIGN KEY (collection_id) REFERENCES collections(id) ON DELETE CASCADE,
  FOREIGN KEY (writing_id) REFERENCES writings(id) ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS daily_words (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  writing_id INTEGER NOT NULL,
  date TEXT NOT NULL UNIQUE,
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
  FOREIGN KEY (writing_id) REFERENCES writings(id) ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS password_reset_tokens (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  user_id INTEGER NOT NULL,
  token_hash TEXT NOT NULL,
  expires_at DATETIME NOT NULL,
  used_at DATETIME,
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
  FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE
);

CREATE INDEX IF NOT EXISTS idx_writings_author ON writings(author_id);
CREATE INDEX IF NOT EXISTS idx_writings_status ON writings(status);
CREATE INDEX IF NOT EXISTS idx_writings_featured ON writings(featured);
CREATE INDEX IF NOT EXISTS idx_writings_type ON writings(type);
CREATE INDEX IF NOT EXISTS idx_writings_language ON writings(language);
CREATE INDEX IF NOT EXISTS idx_authors_slug ON authors(slug);
CREATE INDEX IF NOT EXISTS idx_categories_slug ON categories(slug);
CREATE INDEX IF NOT EXISTS idx_collections_slug ON collections(slug);
CREATE INDEX IF NOT EXISTS idx_daily_words_date ON daily_words(date);
CREATE INDEX IF NOT EXISTS idx_submissions_user ON submissions(user_id);
CREATE INDEX IF NOT EXISTS idx_submissions_status ON submissions(status);
CREATE INDEX IF NOT EXISTS idx_users_username ON users(username);