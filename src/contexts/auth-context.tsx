import {
  createContext,
  useCallback,
  useContext,
  useEffect,
  useMemo,
  useState,
  type ReactNode,
} from 'react'
import type { Session } from '@supabase/supabase-js'
import { supabase } from '@/lib/supabase'
import {
  getCurrentUser,
  signIn as authSignIn,
  signOut as authSignOut,
  signUp as authSignUp,
  updateUserProfile,
  type SignUpInput,
} from '@/services/auth.service'
import type { User } from '@/types'

type AuthContextValue = {
  session: Session | null
  user: User | null
  isLoading: boolean
  isAuthenticated: boolean
  signIn: (email: string, password: string) => Promise<User>
  signUp: (input: SignUpInput) => Promise<{ needsEmailConfirmation: boolean }>
  signOut: () => Promise<void>
  refreshUser: () => Promise<User | null>
  updateProfile: (
    updates: Partial<
      Pick<User, 'full_name' | 'usn' | 'branch' | 'phone' | 'avatar_url'>
    >,
  ) => Promise<User>
}

const AuthContext = createContext<AuthContextValue | null>(null)

async function fetchProfile(): Promise<User | null> {
  try {
    return await getCurrentUser()
  } catch {
    return null
  }
}

export function AuthProvider({ children }: { children: ReactNode }) {
  const [session, setSession] = useState<Session | null>(null)
  const [user, setUser] = useState<User | null>(null)
  const [isLoading, setIsLoading] = useState(true)

  const refreshUser = useCallback(async () => {
    const profile = await fetchProfile()
    setUser(profile)
    return profile
  }, [])

  useEffect(() => {
    let mounted = true

    async function bootstrap() {
      const { data, error } = await supabase.auth.getSession()
      if (!mounted) return

      if (error) {
        setSession(null)
        setUser(null)
        setIsLoading(false)
        return
      }

      setSession(data.session)
      if (data.session) {
        const profile = await fetchProfile()
        if (mounted) setUser(profile)
      }
      if (mounted) setIsLoading(false)
    }

    void bootstrap()

    const {
      data: { subscription },
    } = supabase.auth.onAuthStateChange((_event, nextSession) => {
      setSession(nextSession)

      if (!nextSession) {
        setUser(null)
        setIsLoading(false)
        return
      }

      // Defer profile fetch to avoid deadlocks with Supabase auth internals
      void (async () => {
        const profile = await fetchProfile()
        if (mounted) {
          setUser(profile)
          setIsLoading(false)
        }
      })()
    })

    return () => {
      mounted = false
      subscription.unsubscribe()
    }
  }, [])

  const signIn = useCallback(async (email: string, password: string) => {
    await authSignIn(email, password)
    const profile = await fetchProfile()
    if (!profile) {
      throw new Error('Signed in, but profile could not be loaded.')
    }
    setUser(profile)
    return profile
  }, [])

  const signUp = useCallback(async (input: SignUpInput) => {
    const data = await authSignUp(input)
    const needsEmailConfirmation = !data.session

    if (data.session) {
      const profile = await fetchProfile()
      setUser(profile)
    }

    return { needsEmailConfirmation }
  }, [])

  const signOut = useCallback(async () => {
    await authSignOut()
    setUser(null)
    setSession(null)
  }, [])

  const updateProfile = useCallback(
    async (
      updates: Partial<
        Pick<User, 'full_name' | 'usn' | 'branch' | 'phone' | 'avatar_url'>
      >,
    ) => {
      if (!user) throw new Error('Not authenticated')
      const updated = await updateUserProfile(user.id, updates)
      setUser(updated)
      return updated
    },
    [user],
  )

  const value = useMemo<AuthContextValue>(
    () => ({
      session,
      user,
      isLoading,
      isAuthenticated: Boolean(session && user),
      signIn,
      signUp,
      signOut,
      refreshUser,
      updateProfile,
    }),
    [
      session,
      user,
      isLoading,
      signIn,
      signUp,
      signOut,
      refreshUser,
      updateProfile,
    ],
  )

  return <AuthContext.Provider value={value}>{children}</AuthContext.Provider>
}

export function useAuth() {
  const context = useContext(AuthContext)
  if (!context) {
    throw new Error('useAuth must be used within an AuthProvider')
  }
  return context
}
