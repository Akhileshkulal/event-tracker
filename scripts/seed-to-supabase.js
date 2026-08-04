import { createClient } from '@supabase/supabase-js'
import fs from 'fs'

const supabaseUrl = 'https://rzynlmyrechyanyjgequ.supabase.co'
const supabaseKey = 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InJ6eW5sbXlyZWNoeWFueWpnZXF1Iiwicm9sZSI6ImFub24iLCJpYXQiOjE3ODU3NDk3NDEsImV4cCI6MjEwMTMyNTc0MX0.STrthQPalwgSy01KWjGxjhAV3PeTHDFFImh2J2-A1DM'

const supabase = createClient(supabaseUrl, supabaseKey)

console.log('Testing Supabase Client connection...')
const { data, error } = await supabase.from('users').select('count', { count: 'exact', head: true })
console.log('Users count result:', { data, error })
