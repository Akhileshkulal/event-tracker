import { createClient } from '@supabase/supabase-js'

function sanitizeEnv(val?: string): string {
  if (!val) return ''
  return val
    .trim()
    .replace(/^["']|["']$/g, '')
    .replace(/[^\x20-\x7E]/g, '')
    .trim()
}

const VERIFIED_URL = 'https://rzynlmyrechyanyjgequ.supabase.co'
const VERIFIED_ANON_KEY =
  'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InJ6eW5sbXlyZWNoeWFueWpnZXF1Iiwicm9sZSI6ImFub24iLCJpYXQiOjE3ODU3NDk3NDEsImV4cCI6MjEwMTMyNTc0MX0.STrthQPalwgSy01KWjGxjhAV3PeTHDFFImh2J2-A1DM'

const envUrl = sanitizeEnv(import.meta.env.VITE_SUPABASE_URL)
const envKey = sanitizeEnv(import.meta.env.VITE_SUPABASE_ANON_KEY)

const supabaseUrl =
  envUrl && envUrl.startsWith('http') && envUrl.includes('supabase')
    ? envUrl
    : VERIFIED_URL

const supabaseAnonKey =
  envKey && envKey.startsWith('eyJ') && envKey.length > 100
    ? envKey
    : VERIFIED_ANON_KEY

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




