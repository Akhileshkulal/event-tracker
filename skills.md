
# EventTrack Implementation Guide

## Frontend
- React
- Vite
- TypeScript
- Tailwind CSS
- shadcn/ui

## Backend
- Supabase Auth
- PostgreSQL
- Storage
- Realtime

## Pages
Landing
Login
Register
Participant Dashboard
Organizer Dashboard
Volunteer Scanner
Event Details
Analytics
Profile

## Build Order
1. Auth
2. Database
3. Events
4. Registration
5. QR Generation
6. QR Scanner
7. Attendance
8. Dashboard
9. Certificates
10. Deployment

## Libraries
html5-qrcode
qrcode
react-hook-form
zod
tanstack-query
lucide-react
recharts

## Deployment
Deploy as PWA on Vercel.
Scanner must use mobile camera over HTTPS.
