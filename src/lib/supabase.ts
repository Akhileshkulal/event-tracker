import { createClient } from '@supabase/supabase-js'

function sanitizeEnv(val?: string): string {
  if (!val) return ''
  return val.trim().replace(/^["']|["']$/g, '').replace(/[\r\n]/g, '').trim()
}

const envUrl = sanitizeEnv(import.meta.env.VITE_SUPABASE_URL)
const envKey = sanitizeEnv(import.meta.env.VITE_SUPABASE_ANON_KEY)

const supabaseUrl =
  envUrl && envUrl.startsWith('http')
    ? envUrl
    : 'https://rzynlmyrechyanyjgequ.supabase.co'

const supabaseAnonKey =
  envKey && envKey.length > 20
    ? envKey
    : 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InJ6eW5sbXlyZWNoeWFueWpnZXF1Iiwicm9sZSI6ImFub24iLCJpYXQiOjE3ODU3NDk3NDEsImV4cCI6MjEwMTMyNTc0MX0.STrthQPalwgSy01KWjGxjhAV3PeTHDFFImh2J2-A1DM'

/**
 * Typed domain models live in `@/types`.
 * Full generated Database types can be added later via:
 * `supabase gen types typescript --project-id <id> > src/types/supabase.ts`
 */
export const supabase = createClient(supabaseUrl, supabaseAnonKey, {
  auth: {
    persistSession: true,
    autoRefreshToken: true,
    detectSessionInUrl: true,
  },
})


