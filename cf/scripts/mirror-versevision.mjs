import { readFileSync, writeFileSync } from 'fs';
import { join, dirname } from 'path';
import { fileURLToPath } from 'url';

const here = dirname(fileURLToPath(import.meta.url));

const vvFull = JSON.parse(readFileSync(join(here, '..', '..', 'versevision_writings.json'), 'utf8'));
const vvRaw = vvFull.writings || vvFull;

// Fetch current AK authors so we map VV author slugs -> AK author ids
const akRes = await fetch('https://amarkobita.pages.dev/api/authors');
const akAuthors = await akRes.json();

// Wait - the API might wrap. Normalize.
const authorList = Array.isArray(akAuthors) ? akAuthors : akAuthors.authors || [];
const slugToId = new Map();
for (const a of authorList) {
  if (a.slug) slugToId.set(a.slug, a.id);
}

const ts = new Date().toISOString().replace('T', ' ').substring(0, 19);

const del = `-- Rebuild writings from VerseVision (full 159 mirror)\n\nDELETE FROM writing_categories;\nDELETE FROM daily_words;\nDELETE FROM writings;\n\n`;

const authorCols = '(id, name, slug, short_bio, full_bio, portrait, birth_date, death_date, country, primary_language, other_languages, tags, created_at, updated_at, user_id)';
const writingCols = '(id, author_id, title, slug, text, original_text, english_translation, bangla_translation, urdu_translation, type, language, direction, source, source_url, translator, source_book, source_chapter, source_page, source_notes, date, status, featured, editors_pick, verification_status, views, saves, created_at, updated_at)';

function esc(v) {
  if (v === null || v === undefined) return 'NULL';
  if (typeof v === 'number') return String(v);
  return `'${String(v).replace(/'/g, "''")}'`;
}

// Repeatable author creation for any VV slug missing in AK
const authorStatements = [];
for (const a of authorList) {
  if (!slugToId.has(a.slug)) {
    throw new Error(`Author missing mapping (script bug): slug=${a.slug}`);
  }
}

// Collect author objects by slug for any missing/associated authors
const authorInserts = [];
const vvAuthorIdsBySlug = new Map();
for (const w of vvRaw) {
  const slug = w.author_slug || w.author?.slug || '';
  const name = w.author_name || w.author?.name || '';
  if (slug && !vvAuthorIdsBySlug.has(slug)) vvAuthorIdsBySlug.set(slug, { name, slug });
}
for (const [slug, info] of vvAuthorIdsBySlug) {
  if (!slugToId.has(slug)) {
    const id = slugToId.size + 1;
    // find next free id beyond existing
    let nid = 11;
    const taken = new Set([...slugToId.values()]);
    while (taken.has(nid)) nid++;
    const nm = esc(info.name);
    const sl = esc(info.slug);
    authorInserts.push(`INSERT INTO authors ${authorCols} VALUES (${nid}, ${nm}, ${sl}, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '${ts}', '${ts}', NULL);`);
    slugToId.set(slug, nid);
  }
}

// Slug uniquifier within this dataset
const usedSlugs = new Set();
function slugify(text) {
  return (text || '').toString().toLowerCase().trim()
    .replace(/\s+/g, '-')
    .replace(/[^\w\u0980-\u09FF\u0400-\u04FF\u0600-\u06FF'-]+/g, '')
    .replace(/\-\-+/g, '-').replace(/^-+/, '').replace(/-+$/, '')
    .substring(0, 200);
}

let writingSql = '';
let catSql = '';
const idMap = new Map(); // vv writing id -> new AK writing id (sequential renumber)
let nextId = 1;

const existingSlugs = new Set();

for (const w of vvRaw) {
  const newId = nextId++;
  idMap.set(w.id, newId);
  const authorId = slugToId.get(w.author_slug || w.author?.slug) || 'NULL';
  const title = w.title ? esc(w.title) : 'NULL';
  let base = slugify(w.title || w.text || '');
  if (!base) base = 'writing';
  let slug = base;
  let counter = 1;
  const fullSet = new Set([...usedSlugs, ...existingSlugs]);
  while (fullSet.has(slug)) {
    slug = `${base}-${counter}`;
    counter++;
  }
  usedSlugs.add(slug);

  const vals = [
    newId, authorId, title, esc(slug),
    esc(w.text), esc(w.original_text || null), esc(w.english_translation || null),
    esc(w.bangla_translation || null), esc(w.urdu_translation || null),
    esc(w.type || 'quote'), esc(w.language || 'english'), esc(w.direction || 'ltr'),
    esc(w.source || null), 'NULL', 'NULL', 'NULL', 'NULL', 'NULL', 'NULL',
    'NULL', esc(w.status || 'published'), w.featured ? 1 : 0, w.editors_pick ? 1 : 0,
    esc(w.verification_status || 'attributed'), 0, 0, `'${ts}'`, `'${ts}'`,
  ];
  writingSql += `INSERT INTO writings ${writingCols} VALUES (${vals.join(', ')});\n`;

  if (Array.isArray(w.categories)) {
    for (const c of w.categories) {
      if (c && c.id) {
        catSql += `INSERT OR IGNORE INTO writing_categories (writing_id, category_id) VALUES (${newId}, ${c.id});\n`;
      }
    }
  }
}

const sql = del + authorInserts.join('\n') + '\n' + writingSql + '\n' + catSql;
writeFileSync(join(here, '..', 'mirror-versevision.sql'), sql);
console.log(`Rebuild SQL written.`);
console.log(`VV writings: ${vvRaw.length}`);
console.log(`Author inserts needed: ${authorInserts.length}`);
console.log(`Renumbered writings 1..${nextId - 1}`);
console.log(`Total category links: ${catSql.split('\n').length - 1}`);