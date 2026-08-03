import { supabase } from '@/lib/supabase'
import type { Certificate } from '@/types'

export async function listParticipantCertificates(participantId: string) {
  const { data, error } = await supabase
    .from('certificates')
    .select('*, events(*)')
    .eq('participant_id', participantId)
    .order('issued_at', { ascending: false })

  if (error) throw error
  return data
}

export async function getCertificateByRegistration(registrationId: string) {
  const { data, error } = await supabase
    .from('certificates')
    .select('*')
    .eq('registration_id', registrationId)
    .maybeSingle()

  if (error) throw error
  return data as Certificate | null
}

export async function issueCertificate(input: {
  registration_id: string
  event_id: string
  participant_id: string
  certificate_url?: string | null
}) {
  const { data, error } = await supabase
    .from('certificates')
    .insert(input)
    .select()
    .single()

  if (error) throw error
  return data as Certificate
}
