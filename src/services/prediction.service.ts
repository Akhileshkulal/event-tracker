import { supabase } from '@/lib/supabase'
import { DemoStore } from './demo-store'
import type { Event, User } from '@/types'

export type PredictionResult = {
  expectedAttendance: number
  attendancePercent: number
  expectedAbsentees: number
  fullEventProbability: number // 0‑100
  peakCheckInStart: string // formatted time e.g. "9:15 AM"
  peakCheckInEnd: string // formatted time e.g. "9:45 AM"
  confidenceScore: number // 0‑100
  isStatisticalBaseline: boolean
  branchBreakdown?: { branch: string; registered: number; predicted: number }[]
}

/**
 * Simple heuristic prediction based on historical attendance rate and event metadata.
 * Falls back to DemoStore data when Supabase queries fail or when there is insufficient history.
 */
export async function predictEventAttendance(eventId: string): Promise<PredictionResult> {
  // 1️⃣ Fetch event details
  let event: Event | undefined
  try {
    const { data, error } = await supabase.from('events').select('*').eq('id', eventId).single()
    if (!error && data) event = data as Event
  } catch {}
  if (!event) event = DemoStore.getEventById(eventId)
  if (!event) throw new Error('Event not found')

  const capacity = Number(event.capacity) || 0

  // 2️⃣ Current registrations for this event
  let registrations: any[] = []
  try {
    const { data, error } = await supabase
      .from('registrations')
      .select('id, participant_id')
      .eq('event_id', eventId)
      .neq('status', 'cancelled')
    if (!error && data) registrations = data as any[]
  } catch {}
  if (registrations.length === 0) registrations = DemoStore.getRegistrations().filter(r => r.event_id === eventId)
  const registrationCount = registrations.length

  // 3️⃣ Historical events (exclude current)
  let historicalEvents: Event[] = []
  try {
    const { data, error } = await supabase
      .from('events')
      .select('id, capacity, start_time, category')
      .in('status', ['completed', 'published'])
      .neq('id', eventId)
    if (!error && data) historicalEvents = data as Event[]
  } catch {}
  if (historicalEvents.length === 0) historicalEvents = DemoStore.getEvents().filter(e => e.id !== eventId && ['completed', 'published'].includes(e.status as any))

  // 4️⃣ Compute average attendance rate from historic data
  let totalRate = 0
  let rateSamples = 0
  for (const hist of historicalEvents) {
    // fetch registrations & attendance counts for each historical event (quick approximate)
    let histRegs: any[] = []
    let histAtts: any[] = []
    try {
      const { data: regs, error: regErr } = await supabase
        .from('registrations')
        .select('id')
        .eq('event_id', hist.id)
        .neq('status', 'cancelled')
      if (!regErr && regs) histRegs = regs as any[]
      const { data: atts, error: attErr } = await supabase
        .from('attendance')
        .select('id')
        .eq('event_id', hist.id)
      if (!attErr && atts) histAtts = atts as any[]
    } catch {}
    if (histRegs.length === 0) histRegs = DemoStore.getRegistrations().filter(r => r.event_id === hist.id)
    if (histAtts.length === 0) histAtts = DemoStore.getAttendance().filter(a => a.event_id === hist.id)
    const regCount = histRegs.length
    const attCount = histAtts.length
    if (regCount > 0) {
      totalRate += attCount / regCount
      rateSamples++
    }
  }

  const historicalRate = rateSamples > 0 ? totalRate / rateSamples : 0.5 // fallback to 50 % if no data

  // 5️⃣ Expected attendance based on current registrations and historic rate
  let expectedAttendance = Math.round(registrationCount * historicalRate)
  if (capacity > 0) expectedAttendance = Math.min(expectedAttendance, capacity)

  const attendancePercent = capacity > 0 ? Math.round((expectedAttendance / capacity) * 100) : 0
  const expectedAbsentees = Math.max(0, registrationCount - expectedAttendance)

  // 6️⃣ Probability of full event (simple linear model based on fill‑rate)
  const fullEventProbability = capacity > 0 ? Math.min(100, Math.round((expectedAttendance / capacity) * 100)) : 0

  // 7️⃣ Peak check‑in window – use historical check‑in timeline if available
  let peakStart = ''
  let peakEnd = ''
  try {
    const { getEventCheckInTimeline } = await import('@/services/analytics.service')
    const timeline = await getEventCheckInTimeline(eventId)
    if (timeline && timeline.length > 0) {
      const peak = timeline.reduce((prev, cur) => (cur.count > prev.count ? cur : prev))
      const startDate = new Date(peak.time)
      const endDate = new Date(startDate.getTime() + 15 * 60 * 1000)
      peakStart = startDate.toLocaleTimeString([], { hour: 'numeric', minute: '2-digit' })
      peakEnd = endDate.toLocaleTimeString([], { hour: 'numeric', minute: '2-digit' })
    }
  } catch {}
  if (!peakStart) peakStart = '--'
  if (!peakEnd) peakEnd = '--'

  // 8️⃣ Confidence score – higher when we have enough historical samples
  const confidenceScore = rateSamples >= 3 ? 90 : 60
  const isStatisticalBaseline = rateSamples < 3

  // 9️⃣ Branch breakdown (optional – based on current registrations)
  const branchMap: Record<string, number> = {}
  registrations.forEach(reg => {
    const user = DemoStore.findUserById(reg.participant_id)
    const branch = user?.branch ?? 'Unknown'
    branchMap[branch] = (branchMap[branch] || 0) + 1
  })
  const branchBreakdown = Object.entries(branchMap).map(([branch, count]) => ({
    branch,
    registered: count,
    predicted: Math.round(count * historicalRate),
  }))

  return {
    expectedAttendance,
    attendancePercent,
    expectedAbsentees,
    fullEventProbability,
    peakCheckInStart: peakStart,
    peakCheckInEnd: peakEnd,
    confidenceScore,
    isStatisticalBaseline,
    branchBreakdown,
  }
}
