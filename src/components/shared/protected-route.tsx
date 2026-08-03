import { Navigate, Outlet, useLocation } from 'react-router-dom'
import { useAuth } from '@/contexts/auth-context'
import type { UserRole } from '@/types'
import { roleHomePath } from '@/utils/roles'
import { Skeleton } from '@/components/ui/skeleton'

function AuthLoadingScreen() {
  return (
    <div className="flex min-h-dvh flex-col items-center justify-center gap-4 bg-background px-6">
      <div className="w-full max-w-sm space-y-3">
        <Skeleton className="h-8 w-40" />
        <Skeleton className="h-4 w-full" />
        <Skeleton className="h-4 w-3/4" />
        <Skeleton className="mt-4 h-12 w-full rounded-xl" />
      </div>
    </div>
  )
}

/** Requires an authenticated session + loaded profile */
export function ProtectedRoute({
  allowedRoles,
}: {
  allowedRoles?: UserRole[]
}) {
  const { isAuthenticated, isLoading, user } = useAuth()
  const location = useLocation()

  if (isLoading) return <AuthLoadingScreen />

  if (!isAuthenticated || !user) {
    return <Navigate to="/login" replace state={{ from: location.pathname }} />
  }

  if (allowedRoles && !allowedRoles.includes(user.role)) {
    return <Navigate to={roleHomePath(user.role)} replace />
  }

  return <Outlet />
}

/** Redirects authenticated users away from public auth pages */
export function GuestRoute() {
  const { isAuthenticated, isLoading, user } = useAuth()

  if (isLoading) return <AuthLoadingScreen />

  if (isAuthenticated && user) {
    return <Navigate to={roleHomePath(user.role)} replace />
  }

  return <Outlet />
}
