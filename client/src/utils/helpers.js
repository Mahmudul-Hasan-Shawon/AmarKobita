export function slugify(text) {
  return text
    .toString()
    .toLowerCase()
    .trim()
    .replace(/\s+/g, '-')
    .replace(/[^\w\-]+/g, '')
    .replace(/\-\-+/g, '-')
    .replace(/^-+/, '')
    .replace(/-+$/, '')
    .substring(0, 200);
}

export async function copyToClipboard(text) {
  try {
    await navigator.clipboard.writeText(text);
    return true;
  } catch {
    const el = document.createElement('textarea');
    el.value = text;
    el.style.position = 'fixed';
    el.style.opacity = '0';
    document.body.appendChild(el);
    el.select();
    document.execCommand('copy');
    document.body.removeChild(el);
    return true;
  }
}

export function shareWriting(writing, author) {
  const text = `"${writing.text}"\n\n— ${author}`;
  if (navigator.share) {
    navigator.share({ title: `Words by ${author}`, text });
  } else {
    copyToClipboard(text);
  }
}

export function formatDate(dateStr) {
  if (!dateStr) return '';
  const d = new Date(dateStr);
  return d.toLocaleDateString('en-US', { year: 'numeric', month: 'long', day: 'numeric' });
}

export function formatShortDate(dateStr) {
  if (!dateStr) return '';
  const d = new Date(dateStr);
  return d.toLocaleDateString('en-US', { year: 'numeric', month: 'short', day: 'numeric' });
}

export function truncate(text, length = 150) {
  if (!text || text.length <= length) return text;
  return text.substring(0, length) + '...';
}

export function getReadingTime(text) {
  if (!text) return '1 min read';
  const words = text.split(/\s+/).length;
  const minutes = Math.ceil(words / 200);
  return `${minutes} min read`;
}

export function capitalizeFirst(str) {
  if (!str) return '';
  return str.charAt(0).toUpperCase() + str.slice(1);
}

const MONTHS = ['January', 'February', 'March', 'April', 'May', 'June', 'July', 'August', 'September', 'October', 'November', 'December'];

export function friendlyDate(isoDate) {
  if (!isoDate) return '';
  const [y, m, d] = isoDate.split('-').map(Number);
  if (!y || !m || !d || m < 1 || m > 12 || d < 1 || d > 31) return '';
  return `${d} ${MONTHS[m - 1]}, ${y}`;
}

export function toInputDate(display) {
  if (!display) return '';
  const match = display.match(/^(\d{1,2})\s+([A-Za-z]+),?\s+(\d{4})$/);
  if (!match) return '';
  const month = MONTHS.findIndex((name) => name.toLowerCase() === match[2].toLowerCase());
  if (month === -1) return '';
  const day = parseInt(match[1], 10);
  const year = parseInt(match[3], 10);
  const d = new Date(Date.UTC(year, month, day));
  if (d.getUTCMonth() !== month || d.getUTCDate() !== day) return '';
  return `${year}-${String(month + 1).padStart(2, '0')}-${String(day).padStart(2, '0')}`;
}

export function debounce(fn, delay = 300) {
  let timer;
  return (...args) => {
    clearTimeout(timer);
    timer = setTimeout(() => fn(...args), delay);
  };
}

export function getInitials(name) {
  if (!name) return '?';
  return name.split(' ').map(w => w[0]).join('').substring(0, 2).toUpperCase();
}

export const WRITING_TYPES = [
  { value: 'quote', label: 'Quote' },
  { value: 'poetry', label: 'Poetry' },
  { value: 'poem', label: 'Poem' },
  { value: 'verse', label: 'Verse' },
  { value: 'ghazal', label: 'Ghazal' },
  { value: 'nazm', label: 'Nazm' },
  { value: 'haiku', label: 'Haiku' },
  { value: 'proverb', label: 'Proverb' },
  { value: 'wisdom', label: 'Wisdom' },
  { value: 'reflection', label: 'Reflection' },
  { value: 'letter', label: 'Letter' },
  { value: 'story', label: 'Story' },
  { value: 'song', label: 'Song' },
];

export const SUBMISSION_TYPES = [
  { value: 'poetry', label: 'Poetry (free verse)' },
  { value: 'ghazal', label: 'Ghazal' },
  { value: 'nazm', label: 'Nazm' },
  { value: 'poem', label: 'Poem' },
  { value: 'verse', label: 'Verse / Couplet' },
  { value: 'haiku', label: 'Haiku' },
  { value: 'story', label: 'Short story / prose' },
  { value: 'song', label: 'Song / lyrics' },
  { value: 'quote', label: 'Quote' },
  { value: 'reflection', label: 'Reflection' },
];

export const COUNTRIES = [
  'Afghanistan', 'Albania', 'Algeria', 'Argentina', 'Armenia', 'Australia', 'Austria',
  'Azerbaijan', 'Bangladesh', 'Belgium', 'Brazil', 'Bulgaria', 'Cambodia', 'Canada',
  'Chile', 'China', 'Colombia', 'Croatia', 'Cuba', 'Czech Republic', 'Denmark',
  'Egypt', 'Ethiopia', 'Finland', 'France', 'Georgia', 'Germany', 'Ghana', 'Greece',
  'Hungary', 'Iceland', 'India', 'Indonesia', 'Iran', 'Iraq', 'Ireland', 'Israel',
  'Italy', 'Jamaica', 'Japan', 'Jordan', 'Kazakhstan', 'Kenya', 'Kuwait', 'Kyrgyzstan',
  'Lebanon', 'Libya', 'Malaysia', 'Mauritius', 'Mexico', 'Mongolia', 'Morocco',
  'Myanmar', 'Nepal', 'Netherlands', 'New Zealand', 'Nigeria', 'North Macedonia',
  'Norway', 'Oman', 'Pakistan', 'Palestine', 'Peru', 'Philippines', 'Poland',
  'Portugal', 'Qatar', 'Romania', 'Russia', 'Saudi Arabia', 'Serbia', 'Singapore',
  'Slovakia', 'Slovenia', 'Somalia', 'South Africa', 'South Korea', 'Spain', 'Sri Lanka',
  'Sudan', 'Sweden', 'Switzerland', 'Syria', 'Taiwan', 'Tanzania', 'Thailand', 'Tunisia',
  'Turkey', 'Turkmenistan', 'Uganda', 'Ukraine', 'United Arab Emirates', 'United Kingdom',
  'United States', 'Uruguay', 'Uzbekistan', 'Venezuela', 'Vietnam', 'Yemen', 'Zimbabwe',
];

export const LANGUAGES = [
  { value: 'english', label: 'English' },
  { value: 'bangla', label: 'Bengali' },
  { value: 'hindi', label: 'Hindi' },
  { value: 'urdu', label: 'Urdu' },
  { value: 'arabic', label: 'Arabic' },
  { value: 'persian', label: 'Persian / Farsi' },
  { value: 'french', label: 'French' },
  { value: 'spanish', label: 'Spanish' },
  { value: 'portuguese', label: 'Portuguese' },
  { value: 'german', label: 'German' },
  { value: 'italian', label: 'Italian' },
  { value: 'dutch', label: 'Dutch' },
  { value: 'russian', label: 'Russian' },
  { value: 'chinese', label: 'Chinese' },
  { value: 'japanese', label: 'Japanese' },
  { value: 'korean', label: 'Korean' },
  { value: 'turkish', label: 'Turkish' },
  { value: 'afrikaans', label: 'Afrikaans' },
  { value: 'albanian', label: 'Albanian' },
  { value: 'amharic', label: 'Amharic' },
  { value: 'armenian', label: 'Armenian' },
  { value: 'assamese', label: 'Assamese' },
  { value: 'azerbaijani', label: 'Azerbaijani' },
  { value: 'balochi', label: 'Balochi' },
  { value: 'basque', label: 'Basque' },
  { value: 'belarusian', label: 'Belarusian' },
  { value: 'bosnian', label: 'Bosnian' },
  { value: 'bulgarian', label: 'Bulgarian' },
  { value: 'burmese', label: 'Burmese' },
  { value: 'catalan', label: 'Catalan' },
  { value: 'cebuano', label: 'Cebuano' },
  { value: 'croatian', label: 'Croatian' },
  { value: 'czech', label: 'Czech' },
  { value: 'danish', label: 'Danish' },
  { value: 'dari', label: 'Dari' },
  { value: 'dhivehi', label: 'Dhivehi' },
  { value: 'esperanto', label: 'Esperanto' },
  { value: 'estonian', label: 'Estonian' },
  { value: 'filipino', label: 'Filipino' },
  { value: 'finnish', label: 'Finnish' },
  { value: 'galician', label: 'Galician' },
  { value: 'georgian', label: 'Georgian' },
  { value: 'greek', label: 'Greek' },
  { value: 'gujarati', label: 'Gujarati' },
  { value: 'hausa', label: 'Hausa' },
  { value: 'hebrew', label: 'Hebrew' },
  { value: 'hungarian', label: 'Hungarian' },
  { value: 'icelandic', label: 'Icelandic' },
  { value: 'igbo', label: 'Igbo' },
  { value: 'indonesian', label: 'Indonesian' },
  { value: 'irish', label: 'Irish' },
  { value: 'javanese', label: 'Javanese' },
  { value: 'kannada', label: 'Kannada' },
  { value: 'kazakh', label: 'Kazakh' },
  { value: 'khmer', label: 'Khmer' },
  { value: 'kurdish', label: 'Kurdish' },
  { value: 'kyrgyz', label: 'Kyrgyz' },
  { value: 'lao', label: 'Lao' },
  { value: 'latvian', label: 'Latvian' },
  { value: 'lithuanian', label: 'Lithuanian' },
  { value: 'luxembourgish', label: 'Luxembourgish' },
  { value: 'macedonian', label: 'Macedonian' },
  { value: 'maithili', label: 'Maithili' },
  { value: 'malay', label: 'Malay' },
  { value: 'malayalam', label: 'Malayalam' },
  { value: 'maltese', label: 'Maltese' },
  { value: 'maori', label: 'Māori' },
  { value: 'marathi', label: 'Marathi' },
  { value: 'mongolian', label: 'Mongolian' },
  { value: 'nepali', label: 'Nepali' },
  { value: 'norwegian', label: 'Norwegian' },
  { value: 'odia', label: 'Odia / Oriya' },
  { value: 'pashto', label: 'Pashto' },
  { value: 'polish', label: 'Polish' },
  { value: 'punjabi', label: 'Punjabi' },
  { value: 'romanian', label: 'Romanian' },
  { value: 'sanskrit', label: 'Sanskrit' },
  { value: 'serbian', label: 'Serbian' },
  { value: 'sindhi', label: 'Sindhi' },
  { value: 'sinhala', label: 'Sinhala' },
  { value: 'slovak', label: 'Slovak' },
  { value: 'slovenian', label: 'Slovenian' },
  { value: 'somali', label: 'Somali' },
  { value: 'swahili', label: 'Swahili' },
  { value: 'swedish', label: 'Swedish' },
  { value: 'tagalog', label: 'Tagalog' },
  { value: 'tajik', label: 'Tajik' },
  { value: 'tamil', label: 'Tamil' },
  { value: 'telugu', label: 'Telugu' },
  { value: 'thai', label: 'Thai' },
  { value: 'tigrinya', label: 'Tigrinya' },
  { value: 'turkmen', label: 'Turkmen' },
  { value: 'ukrainian', label: 'Ukrainian' },
  { value: 'uyghur', label: 'Uyghur' },
  { value: 'uzbek', label: 'Uzbek' },
  { value: 'vietnamese', label: 'Vietnamese' },
  { value: 'welsh', label: 'Welsh' },
  { value: 'wolof', label: 'Wolof' },
  { value: 'yoruba', label: 'Yoruba' },
  { value: 'zulu', label: 'Zulu' },
];

export const RTL_LANGUAGES = [
  'arabic', 'balochi', 'dari', 'hebrew', 'kurdish', 'pashto',
  'persian', 'sindhi', 'urdu', 'uyghur',
];

export const TYPE_ROUTES = {
  quote: 'quotes',
  poetry: 'poetry',
  poem: 'poems',
  verse: 'verses',
  ghazal: 'ghazals',
  nazm: 'nazms',
  haiku: 'haikus',
  proverb: 'proverbs',
  wisdom: 'wisdom',
  reflection: 'reflections',
  letter: 'letters',
  story: 'stories',
  song: 'songs',
};

export function writingUrl(writing) {
  const prefix = TYPE_ROUTES[writing?.type] || 'quotes';
  return `/${prefix}/${writing.slug}`;
}

export function languageLabel(value) {
  if (!value) return '—';
  const lang = LANGUAGES.find((l) => l.value === value);
  return lang ? lang.label : value;
}

export function writingTypeLabel(value) {
  if (!value) return '—';
  const type = WRITING_TYPES.find((t) => t.value === value);
  if (type) return type.label;
  return capitalizeFirst(value);
}

export const STATUSES = [
  { value: 'draft', label: 'Draft' },
  { value: 'published', label: 'Published' },
  { value: 'archived', label: 'Archived' },
];

export const VERIFICATION_STATUSES = [
  { value: 'verified', label: 'Verified' },
  { value: 'attributed', label: 'Attributed' },
  { value: 'unverified', label: 'Unverified' },
];
