-- Wipe all community/user content: users, submissions, authors, writings
-- Order respects foreign keys (children before parents).

DELETE FROM writing_categories;
DELETE FROM collection_writings;
DELETE FROM daily_words;
DELETE FROM collections;
DELETE FROM writings;
DELETE FROM submissions;
DELETE FROM password_reset_tokens;
DELETE FROM authors;
DELETE FROM users;