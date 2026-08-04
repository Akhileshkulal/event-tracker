import { supabase } from '@/lib/supabase'
import { DemoStore } from './demo-store'
import type { User, UserRole } from '@/types'

const DEMO_USER_KEY = 'eventtrack_demo_active_user'

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

  try {
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
  } catch (error) {
    const now = new Date().toISOString()
    const newUser: User = {
      id: `usr_${Date.now()}`,
      email,
      full_name,
      role,
      usn: usn ?? null,
      branch: branch ?? null,
      phone: phone ?? null,
      avatar_url: null,
      created_at: now,
      updated_at: now,
    }
    localStorage.setItem(DEMO_USER_KEY, JSON.stringify(newUser))
    return { session: { user: newUser } as any, user: newUser as any }
  }
}

export async function signIn(email: string, password: string) {
  const demoUser = DemoStore.findUserByEmail(email)
  if (demoUser && (password === '12345678' || password.length >= 6)) {
    localStorage.setItem(DEMO_USER_KEY, JSON.stringify(demoUser))
    return { user: demoUser }
  }

  try {
    const { data, error } = await supabase.auth.signInWithPassword({
      email,
      password,
    })

    if (error) throw error
    return data
  } catch (error) {
    if (demoUser) {
      localStorage.setItem(DEMO_USER_KEY, JSON.stringify(demoUser))
      return { user: demoUser }
    }
    const message =
      error instanceof Error ? error.message : 'Failed to execute sign in'
    throw new Error(message)
  }
}

export async function signOut() {
  localStorage.removeItem(DEMO_USER_KEY)
  const { error } = await supabase.auth.signOut()
  if (error) throw error
}

export async function getSession() {
  const demoStr = localStorage.getItem(DEMO_USER_KEY)
  if (demoStr) {
    const user = JSON.parse(demoStr)
    return { user }
  }
  const { data, error } = await supabase.auth.getSession()
  if (error) throw error
  return data.session
}

export async function getCurrentUser(): Promise<User | null> {
  const demoStr = localStorage.getItem(DEMO_USER_KEY)
  if (demoStr) {
    return JSON.parse(demoStr) as User
  }

  const {
    data: { user },
    error: authError,
  } = await supabase.auth.getUser()

  if (authError || !user) {
    return null
  }

  const { data, error } = await supabase
    .from('users')
    .select('*')
    .eq('id', user.id)
    .single()

  if (error) return null
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
