import { Link } from 'react-router-dom'
import { ArrowLeft } from 'lucide-react'
import { AppNavbar } from '@/components/layout/app-navbar'
import { ProfileForm } from '@/features/auth/profile-form'
import { useAuth } from '@/contexts/auth-context'
import { roleHomePath } from '@/utils/roles'
import { Button } from '@/components/ui/button'

export function ProfilePage() {
  const { user } = useAuth()

  return (
    <div className="min-h-dvh bg-background">
      <AppNavbar />
      <main className="mx-auto w-full max-w-5xl space-y-6 px-4 py-8 sm:px-6">
        {user ? (
          <Button
            asChild
            variant="ghost"
            className="h-11 rounded-xl px-3 text-muted-foreground"
          >
            <Link to={roleHomePath(user.role)}>
              <ArrowLeft className="size-4" />
              Back to dashboard
            </Link>
          </Button>
        ) : null}
        <ProfileForm />
      </main>
    </div>
  )
}
