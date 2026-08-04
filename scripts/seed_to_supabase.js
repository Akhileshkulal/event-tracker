import { createClient } from '@supabase/supabase-js'
import fs from 'fs'

const supabaseUrl = 'https://rzynlmyrechyanyjgequ.supabase.co'
const supabaseKey = 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InJ6eW5sbXlyZWNoeWFueWpnZXF1Iiwicm9sZSI6ImFub24iLCJpYXQiOjE3ODU3NDk3NDEsImV4cCI6MjEwMTMyNTc0MX0.STrthQPalwgSy01KWjGxjhAV3PeTHDFFImh2J2-A1DM'

const supabase = createClient(supabaseUrl, supabaseKey)

const rawData = fs.readFileSync('d:/event-tracker/src/data/demo-dataset.json', 'utf-8')
const demoData = JSON.parse(rawData)

async function seed() {
  console.log('Seeding Demo Data from Excel to Supabase...')
  
  // 1. Sign up all users
  for (const user of demoData.users) {
    try {
      const { data, error } = await supabase.auth.signUp({
        email: user.email,
        password: '12345678',
        options: {
          data: {
            full_name: user.full_name,
            role: user.role,
            usn: user.usn,
            branch: user.branch,
            phone: user.phone
          }
        }
      })
      if (error && !error.message.includes('already registered')) {
        console.warn(`User ${user.email} signup note:`, error.message)
      } else {
        console.log(`User ${user.email} synced (${user.role})`)
      }
    } catch (err) {
      console.warn(`Error for ${user.email}:`, err.message)
    }
  }

  // 2. Insert Events
  for (const ev of demoData.events) {
    const { error } = await supabase.from('events').upsert({
      id: ev.id,
      title: ev.title,
      description: ev.description,
      location: ev.location,
      venue: ev.venue,
      start_time: ev.start_time,
      end_time: ev.end_time,
      capacity: ev.capacity,
      organizer_id: ev.organizer_id,
      status: ev.status,
      is_registration_open: ev.is_registration_open
    })
    if (error) console.warn(`Event ${ev.title} note:`, error.message)
  }

  console.log('Seeding process completed!')
}

seed()
