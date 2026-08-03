import { supabase } from '@/lib/supabase'
import type { User, UserRole } from '@/types'

export type SignUpInput = {
  email: string
  password: string
  full_name: string
  usn?: string
  branch?: string
  phone?: string
  role?: UserRole
}

export async function signUp(input: SignUpInput) {
  const { email, password, full_name, usn, branch, phone, role = 'participant' } =
    input

  const { data, error } = await supabase.auth.signUp({
    email,
    password,
    options: {
      data: {
        full_name,
        usn: usn ?? null,
        branch: branch ?? null,
        phone: phone ?? null,
        role,
      },
    },
  })

  if (error) throw error
  return data
}

export async function signIn(email: string, password: string) {
  const { data, error } = await supabase.auth.signInWithPassword({
    email,
    password,
  })

  if (error) throw error
  return data
}

export async function signOut() {
  const { error } = await supabase.auth.signOut()
  if (error) throw error
}

export async function getSession() {
  const { data, error } = await supabase.auth.getSession()
  if (error) throw error
  return data.session
}

export async function getCurrentUser(): Promise<User | null> {
  const {
    data: { user },
    error: authError,
  } = await supabase.auth.getUser()

  if (authError) throw authError
  if (!user) return null

  const { data, error } = await supabase
    .from('users')
    .select('*')
    .eq('id', user.id)
    .single()

  if (error) throw error
  return data as User
}

export async function updateUserProfile(
  userId: string,
  updates: Partial<
    Pick<User, 'full_name' | 'usn' | 'branch' | 'phone' | 'avatar_url'>
  >,
): Promise<User> {
  const { data, error } = await supabase
    .from('users')
    .update(updates)
    .eq('id', userId)
    .select()
    .single()

  if (error) throw error
  return data as User
}
