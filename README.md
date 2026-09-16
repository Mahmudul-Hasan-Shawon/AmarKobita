# AmarKobita

A quiet digital library of human thought. A premium, minimalist poetry and wisdom website serving as a digital literary archive for quotes, poetry, verses, and writings from Rumi, Mirza Ghalib, Rabindranath Tagore, and many more.

## Tech Stack

- **Frontend:** React 18 + Vite + Tailwind CSS + Framer Motion
- **Backend:** Express.js
- **Database:** SQLite (better-sqlite3)
- **Auth:** JWT with httpOnly cookies

## Getting Started

### 1. Install Dependencies

```bash
npm run setup
```

### 2. Run in Development

```bash
npm run dev
```

This starts:
- Client dev server at `http://localhost:5173`
- API server at `http://localhost:3001`

### 3. Production Build

```bash
npm run build
npm start
```

The Express server will serve the built React app at `http://localhost:3001`.

## Admin Account

The admin account is created on first database init. Sign in, then use **Admin → Security** to change your password. Credentials are intentionally not listed in this repo.

## Project Structure

```
Poetry/
├── client/                 # React frontend (Vite)
│   ├── public/
│   ├── src/
│   │   ├── api/
│   │   ├── components/
│   │   │   ├── admin/
│   │   │   ├── layout/
│   │   │   ├── quotes/
│   │   │   └── ui/
│   │   ├── context/
│   │   ├── hooks/
│   │   ├── pages/
│   │   │   ├── admin/
│   │   │   └── public/
│   │   ├── utils/
│   │   ├── App.jsx
│   │   ├── index.css
│   │   └── main.jsx
│   ├── tailwind.config.js
│   └── vite.config.js
├── server/                 # Express backend
│   ├── db/
│   │   ├── index.js        # Database initialization & schema
│   │   └── seed.js         # Sample data seeder
│   ├── middleware/
│   ├── routes/             # API routes
│   └── index.js            # Express server
└── package.json
```

## Features

### Public Website
- **Home:** Cinematic hero, word of the day, featured writings, author preview
- **Explore:** Search + filters by type, category, language, author
- **Authors:** Individual author pages with bios and writings
- **Collections:** Curated theme-based groupings
- **Quote Pages:** Beautiful reading experience with attribution, translations, related words
- **Random Discovery:** "Discover a Thought" button
- **Save/Favorites:** localStorage-based bookmarking
- **Copy/Share:** Elegant sharing actions
- **RTL Support:** Full right-to-left rendering for Urdu/Persian/Arabic
- **Responsive:** Mobile-first reading experience

### Admin Panel
- **Dashboard:** Overview stats (writings, authors, categories, collections)
- **Writings Management:** Create, edit, delete, duplicate, bulk actions, search
- **Author Management:** Full CRUD with bios, dates, languages
- **Category Management:** Create/edit/delete categories
- **Collection Management:** Create/edit collections
- **Daily Word:** Manually set today's word
- **Featured:** Toggle featured status
- **Import/Export:** JSON/CSV backup and restore
- **Preview:** See writing as it appears publicly before publishing

### Content Features
- Multilingual support (original + translations separated)
- Editorial verification status (Verified / Attributed / Unverified)
- Full source attribution (book, chapter, page, translator, URL, notes)
- Draft/Published/Archived workflow
- Type system: Quote, Poetry, Ghazal, Verse, Proverb, Wisdom, Reflection, Letter

## API Routes

| Method | Route | Description |
|--------|-------|-------------|
| POST | `/api/auth/login` | Admin login |
| POST | `/api/auth/logout` | Logout |
| GET | `/api/auth/me` | Check auth status |
| GET | `/api/writings` | List published writings (paginated) |
| GET | `/api/writings/featured` | Featured writings |
| GET | `/api/writings/random` | Random writing |
| GET | `/api/writings/daily` | Today's word |
| GET | `/api/writings/slug/:slug` | Get writing by slug |
| POST | `/api/writings` | Create writing (admin) |
| PUT | `/api/writings/:id` | Update writing (admin) |
| DELETE | `/api/writings/:id` | Delete writing (admin) |
| GET | `/api/authors` | List authors |
| GET | `/api/authors/:slug` | Get author with writings |
| POST/PUT/DELETE | `/api/authors` | Author CRUD (admin) |
| GET | `/api/categories` | List categories |
| GET | `/api/collections` | List collections |
| GET | `/api/collections/:slug` | Get collection with writings |
| GET | `/api/search?q=love` | Search writings, authors, categories, collections |
| GET | `/api/analytics/overview` | Admin dashboard stats |
| GET | `/api/export/json` | Export database as JSON |
| GET | `/api/export/csv` | Export writings as CSV |

## Security Notes

- Admin credentials are hashed with bcrypt
- JWT stored in httpOnly cookies
- All `/api/...` routes under admin protection require authentication
- Admin UI routes (`/admin`) are protected client-side, but the API is the real gatekeeper
- Session expires after 7 days
- Change the default password immediately
- Set `JWT_SECRET` environment variable in production

## Deployment

The whole app (API + built React site) runs as a single Node process, so it deploys anywhere that can run Node/Express.

### Option A — One server (recommended)

1. `git init`, commit, push to GitHub (the SQLite DB is already gitignored).
2. On [Railway](https://railway.com), [Render](https://render.com), or [Fly.io](https://fly.io): import the repo.
   - Build command: `npm run build`
   - Start command: `npm start`
3. **Persist the database** — mount a volume at `server/db/` (the SQLite file lives there and resets otherwise, wiping your content on every redeploy).
4. Set environment variables:
   - `JWT_SECRET` — a long random string
   - `NODE_ENV` — `production`
   - `PORT` — the host's default (e.g. 3001)
5. Put your domain on Cloudflare (free) so Cloudflare handles DNS/CDN/SSL in front of the server, or use a Cloudflare Tunnel to avoid exposing a port.

Using Docker (also works on Railway/Render/Fly/VPS):

```bash
docker build -t amarkobita .
docker run -p 3001:3001 -v poetry-db:/app/server/db amarkobita
```

Health check: `GET /api/health` returns `{ "status": "ok" }`.

### Option B — Static Cloudflare Pages + separate API

Not recommended unless you must use a `.pages.dev` subdomain. It requires cross-origin cookie/CORS handling and an always-on API host. Use Option A instead.

### First-run login

Sign in with the seeded admin account, then change the password from **Admin → Security**.

## Roadmap (Future Features)

- User accounts with full favorites sync
- Comments on writings
- Public submissions
- Author following
- Personalized recommendations
- Reading history
- Audio readings / text-to-speech
- Podcast-style poetry
- Daily email subscriptions
- Mobile app
- AI-powered semantic search
- Image optimization with WebP/AVIF