import { createClient } from '@supabase/supabase-js'

const SUPABASE_URL = 'https://rzynlmyrechyanyjgequ.supabase.co'
const SUPABASE_ANON_KEY =
  'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InJ6eW5sbXlyZWNoeWFueWpnZXF1Iiwicm9sZSI6ImFub24iLCJpYXQiOjE3ODU3NDk3NDEsImV4cCI6MjEwMTMyNTc0MX0.STrthQPalwgSy01KWjGxjhAV3PeTHDFFImh2J2-A1DM'

/**
 * Typed domain models live in `@/types`.
 * Full generated Database types can be added later via:
 * `supabase gen types typescript --project-id <id> > src/types/supabase.ts`
 */
export const supabase = createClient(SUPABASE_URL, SUPABASE_ANON_KEY, {
  auth: {
    persistSession: true,
    autoRefreshToken: true,
    detectSessionInUrl: true,
  },
})





