
# EventTrack - Product Requirements Document

## Vision
Build a mobile-first Progressive Web App for end-to-end event management.

## Users
- Participant
- Organizer
- Volunteer
- Admin

## Core Features
1. Authentication (Supabase Auth)
2. Event creation/editing
3. Event discovery & registration
4. Unique QR per registration
5. Dynamic QR token support
6. Mobile QR scanner using device camera
7. Attendance tracking
8. Live analytics dashboard
9. Certificate generation
10. Notifications

## Functional Requirements
### Participant
- Register/Login
- View events
- Register
- View QR
- Download certificate

### Organizer
- CRUD events
- View participants
- Dashboard
- Reports

### Volunteer
- Login
- Scan QR
- Validate attendee
- Mark attendance

## Non-functional
- Mobile-first
- Responsive
- HTTPS
- PWA
- <2 second page load

## Tech Stack
React + Vite + TypeScript
Tailwind + shadcn/ui
Supabase
Recharts
html5-qrcode
qrcode
vite-plugin-pwa

## Database
users, events, registrations, attendance, certificates, notifications.

## Deployment
Frontend: Vercel
Backend: Supabase
