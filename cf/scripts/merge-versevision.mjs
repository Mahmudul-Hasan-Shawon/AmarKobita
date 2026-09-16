import { readFileSync, writeFileSync } from 'fs';
import { join, dirname } from 'path';
import { fileURLToPath } from 'url';

const here = dirname(fileURLToPath(import.meta.url));

// Load both datasets
const vvFull = JSON.parse(readFileSync(join(here, '..', '..', 'versevision_writings.json'), 'utf8'));
const vvRaw = vvFull.writings || vvFull;
const akFull = JSON.parse(readFileSync('C:\\Users\\Shawon\\AppData\\Local\\Temp\\opencode\\amarkobita_full.json', 'utf8'));
const akRaw = akFull.writings || akFull;

function norm(text) {
  return (text || '').toLowerCase().trim().replace(/\s+/g, ' ').substring(0, 100);
}

// Build set of normalized texts already in AmarKobita
const akTexts = new Set(akRaw.map(w => norm(w.text)));

// Find writings unique to VerseVision
const uniqueVV = vvRaw.filter(w => !akTexts.has(norm(w.text)));

console.log(`VerseVision total: ${vvRaw.length}`);
console.log(`AmarKobita total: ${akRaw.length}`);
console.log(`Unique to VerseVision: ${uniqueVV.length}`);

// Collect unique author slugs from unique writings
const newAuthors = new Map();
for (const w of uniqueVV) {
  const authorSlug = w.author_slug || w.author?.slug || '';
  const authorName = w.author_name || w.author?.name || '';
  if (authorSlug && !newAuthors.has(authorSlug) && !akRaw.some(a => (a.author_slug || a.author?.slug) === authorSlug)) {
    // Check if this author exists in AmarKobita
    const existsInAK = akRaw.some(w2 => (w2.author_slug || w2.author?.slug) === authorSlug);
    if (!existsInAK) {
      newAuthors.set(authorSlug, { name: authorName, slug: authorSlug, writingCount: 0 });
    }
  }
  if (newAuthors.has(authorSlug)) {
    newAuthors.get(authorSlug).writingCount++;
  }
}

console.log(`New authors to add: ${newAuthors.size}`);
for (const [slug, info] of newAuthors) {
  console.log(`  - ${info.name} [${slug}]: ${info.writingCount} writings`);
}

// Show the unique writings
console.log('\nUnique writings:');
for (const w of uniqueVV) {
  console.log(`  - VV#${w.id} by "${w.author_name || w.author?.name || '(none)'}" [${w.author_slug || w.author?.slug || ''}]: ${(w.text || '').substring(0, 60).replace(/\n/g, ' ')}... [${w.type}]`);
}

// Generate SQL
let sql = '-- Merged from VerseVision: unique authors + writings not in AmarKobita\n\n';

// Insert new authors
const authorInserts = [];
let nextAuthorId = 11; // after existing 10 classic authors
for (const [slug, info] of newAuthors) {
  const id = nextAuthorId++;
  const name = info.name.replace(/'/g, "''");
  const sl = info.slug.replace(/'/g, "''");
  const ts = new Date().toISOString().replace('T', ' ').substring(0, 19);
  authorInserts.push(`INSERT INTO authors (id, name, slug, short_bio, full_bio, portrait, birth_date, death_date, country, primary_language, other_languages, tags, created_at, updated_at, user_id) VALUES (${id}, '${name}', '${sl}', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '${ts}', '${ts}', NULL);`);
}
sql += authorInserts.join('\n') + '\n\n';

// Map author slug to id (existing + new)
const authorIdMap = {};
for (const w of akRaw) {
  const slug = w.author_slug || w.author?.slug || '';
  const id = w.author_id;
  if (slug && id) authorIdMap[slug] = id;
}
let aid = 11;
for (const [slug] of newAuthors) {
  authorIdMap[slug] = aid++;
}

// Insert unique writings
const writingInserts = [];
const catInserts = [];
let nextWritingId = Math.max(...akRaw.map(w => w.id)) + 1;
const usedSlugs = new Set(akRaw.map(w => w.slug));

function slugify(text) {
  return (text || '')
    .toString()
    .toLowerCase()
    .trim()
    .replace(/\s+/g, '-')
    .replace(/[^\w\u0980-\u09FF\u0400-\u04FF\u0600-\u06FF\-]+/g, '')
    .replace(/\-\-+/g, '-')
    .replace(/^-+/, '')
    .replace(/-+$/, '')
    .substring(0, 200);
}

for (const w of uniqueVV) {
  const id = nextWritingId++;
  const authorId = authorIdMap[w.author_slug || w.author?.slug] || 'NULL';
  const title = w.title ? `'${String(w.title).replace(/'/g, "''")}'` : 'NULL';
  let base = slugify(w.title || w.text || '');
  let slug = base;
  let counter = 1;
  while (usedSlugs.has(slug)) {
    slug = `${base}-${counter}`;
    counter++;
  }
  usedSlugs.add(slug);
  const slugStr = `'${slug}'`;
  const text = `'${String(w.text || '').replace(/'/g, "''")}'`;
  const orig = w.original_text ? `'${String(w.original_text).replace(/'/g, "''")}'` : 'NULL';
  const eng = w.english_translation ? `'${String(w.english_translation).replace(/'/g, "''")}'` : 'NULL';
  const ban = w.bangla_translation ? `'${String(w.bangla_translation).replace(/'/g, "''")}'` : 'NULL';
  const urd = w.urdu_translation ? `'${String(w.urdu_translation).replace(/'/g, "''")}'` : 'NULL';
  const type = `'${w.type || 'quote'}'`;
  const lang = `'${w.language || 'english'}'`;
  const dir = `'${w.direction || 'ltr'}'`;
  const source = w.source ? `'${String(w.source).replace(/'/g, "''")}'` : 'NULL';
  const status = `'${w.status || 'published'}'`;
  const feat = w.featured ? 1 : 0;
  const verif = `'${w.verification_status || 'attributed'}'`;
  const ts = new Date().toISOString().replace('T', ' ').substring(0, 19);

  writingInserts.push(`INSERT INTO writings (id, author_id, title, slug, text, original_text, english_translation, bangla_translation, urdu_translation, type, language, direction, source, source_url, translator, source_book, source_chapter, source_page, source_notes, date, status, featured, editors_pick, verification_status, views, saves, created_at, updated_at) VALUES (${id}, ${authorId}, ${title}, ${slugStr}, ${text}, ${orig}, ${eng}, ${ban}, ${urd}, ${type}, ${lang}, ${dir}, ${source}, NULL, NULL, NULL, NULL, NULL, NULL, NULL, ${status}, ${feat}, 0, ${verif}, 0, 0, '${ts}', '${ts}');`);

  // Insert writing_categories
  if (w.categories && Array.isArray(w.categories)) {
    for (const cat of w.categories) {
      if (cat.id) {
        catInserts.push(`INSERT OR IGNORE INTO writing_categories (writing_id, category_id) VALUES (${id}, ${cat.id});`);
      }
    }
  }
}

sql += writingInserts.join('\n') + '\n\n';
sql += catInserts.join('\n') + '\n';

// Set a daily word from the new writings
sql += `\nINSERT OR REPLACE INTO daily_words (writing_id, date) VALUES (${nextWritingId - 1}, date('now'));\n`;

const outPath = join(here, '..', 'merge-from-versevision.sql');
writeFileSync(outPath, sql);
console.log(`\nWrote ${outPath}`);
console.log(`Authors to insert: ${authorInserts.length}`);
console.log(`Writings to insert: ${writingInserts.length}`);
console.log(`Category links to insert: ${catInserts.length}`);