import { Link } from 'react-router-dom'
import { LogOut, UserRound } from 'lucide-react'
import { useAuth } from '@/contexts/auth-context'
import { NotificationBell } from '@/features/notifications'
import { Button } from '@/components/ui/button'
import { Badge } from '@/components/ui/badge'
import { cn } from '@/lib/utils'

type AppNavbarProps = {
  className?: string
  showAuthActions?: boolean
}

export function AppNavbar({
  className,
  showAuthActions = true,
}: AppNavbarProps) {
  const { user, isAuthenticated, signOut } = useAuth()

  return (
    <header
      className={cn(
        'sticky top-0 z-40 border-b border-border/80 bg-surface/90 backdrop-blur-md',
        className,
      )}
    >
      <div className="mx-auto flex h-14 w-full max-w-5xl items-center justify-between px-4 sm:px-6">
        <Link to="/" className="text-lg font-semibold tracking-tight text-primary">
          EventTrack
        </Link>

        {showAuthActions ? (
          <div className="flex items-center gap-2">
            {isAuthenticated && user ? (
              <>
                <NotificationBell />
                <Badge variant="secondary" className="hidden capitalize sm:inline-flex">
                  {user.role}
                </Badge>
                <Button
                  asChild
                  variant="ghost"
                  size="sm"
                  className="min-h-10 gap-1.5 rounded-xl px-3"
                >
                  <Link to="/profile">
                    <UserRound className="size-4" />
                    <span className="hidden sm:inline">Profile</span>
                  </Link>
                </Button>
                <Button
                  variant="outline"
                  size="sm"
                  className="min-h-10 gap-1.5 rounded-xl px-3"
                  onClick={() => void signOut()}
                >
                  <LogOut className="size-4" />
                  <span className="hidden sm:inline">Log out</span>
                </Button>
              </>
            ) : (
              <>
                <Button
                  asChild
                  variant="ghost"
                  size="sm"
                  className="min-h-10 rounded-xl px-3"
                >
                  <Link to="/login">Log in</Link>
                </Button>
                <Button asChild size="sm" className="min-h-10 rounded-xl px-4">
                  <Link to="/register">Sign up</Link>
                </Button>
              </>
            )}
          </div>
        ) : null}
      </div>
    </header>
  )
}
