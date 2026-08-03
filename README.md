# EventTrack

Mobile-first Progressive Web App for end-to-end event management.

Built with React, Vite, TypeScript, Tailwind CSS, shadcn/ui, and Supabase.

## Documentation (source of truth)

- [`spec.md`](./spec.md) — product requirements
- [`design.md`](./design.md) — design system
- [`skills.md`](./skills.md) — implementation guide
- [`supabase/SCHEMA.md`](./supabase/SCHEMA.md) — database schema notes

## Phase status

| Phase | Status |
|-------|--------|
| 1 — Project init, Tailwind, shadcn, Supabase schema | Done |
| 2 — Authentication | Done |
| 3 — Participant Portal | Done |
| 4 — Organizer Portal | Done |
| 5 — Volunteer Portal | Done |
| 6 — QR Generation | Pending |
| 7 — QR Scanner | Pending |
| 8 — Realtime Dashboard | Pending |
| 9 — Certificates | Pending |
| 10 — PWA, Testing, Deployment | Pending |

## Setup

```bash
npm install
cp .env.example .env
# Fill VITE_SUPABASE_URL and VITE_SUPABASE_ANON_KEY
npm run dev
```

### Supabase

1. Create a project at [supabase.com](https://supabase.com)
2. Run `supabase/migrations/20260803100000_initial_schema.sql` in the SQL Editor
3. Copy Project URL + anon key into `.env`

## Scripts

- `npm run dev` — local development
- `npm run build` — production build
- `npm run preview` — preview production build
