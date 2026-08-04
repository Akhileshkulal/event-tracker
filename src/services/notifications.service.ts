import { supabase } from '@/lib/supabase'
import type { Notification } from '@/types'

export async function listUserNotifications(userId: string) {
  const { data, error } = await supabase
    .from('notifications')
    .select('*')
    .eq('user_id', userId)
    .order('created_at', { ascending: false })

  if (error) throw error
  return data as Notification[]
}

export async function markNotificationRead(notificationId: string) {
  const { data, error } = await supabase
    .from('notifications')
    .update({ is_read: true })
    .eq('id', notificationId)
    .select()
    .single()

  if (error) throw error
  return data as Notification
}

export async function markAllNotificationsRead(userId: string) {
  const { error } = await supabase
    .from('notifications')
    .update({ is_read: true })
    .eq('user_id', userId)
    .eq('is_read', false)

  if (error) throw error
}

export async function createNotification(
  input: Omit<Notification, 'id' | 'created_at' | 'is_read' | 'link'> & {
    is_read?: boolean
    link?: string | null
  },
) {
  const { data, error } = await supabase
    .from('notifications')
    .insert({
      ...input,
      link: input.link ?? null,
    })
    .select()
    .single()

  if (error) throw error
  return data as Notification
}
