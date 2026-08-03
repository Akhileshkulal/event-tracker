# EventTrack Database Schema

Source of truth: `spec.md` tables — users, events, registrations, attendance, certificates, notifications.

Additional table: `event_volunteers` (assign volunteers to events for scanner access).

## Entity relationships

```
auth.users 1──1 public.users
public.users 1──* events (organizer)
public.users 1──* registrations (participant)
events 1──* registrations
registrations 1──1 attendance   (UNIQUE registration_id → no duplicate check-ins)
registrations 1──1 certificates
public.users 1──* notifications
events *──* users (via event_volunteers)
```

## QR security model

- Each **registration** gets one unique `qr_token` (`encode(gen_random_bytes(32), 'hex')`).
- QR payload contains **only** the token (optionally prefixed `eventtrack:reg:`).
- No name, USN, email, or other PII is encoded in the QR.
- Volunteers call `lookup_registration_by_qr(token)` to fetch participant + event details.
- Volunteers call `mark_attendance(token)` to check in; duplicates raise an error.

## Applying migrations

1. Create a Supabase project at https://supabase.com
2. Copy project URL + anon key into `.env` (see `.env.example`)
3. Run the SQL in `supabase/migrations/20260803100000_initial_schema.sql`
   via Supabase SQL Editor **or** `supabase db push` if using the CLI

## Storage buckets

| Bucket         | Public | Purpose              |
|----------------|--------|----------------------|
| avatars        | yes    | User profile images  |
| event-covers   | yes    | Event cover images   |
| certificates   | no     | Issued certificates  |

## Realtime

Enabled on: `attendance`, `registrations`, `notifications`, `events`
