import { useNavigate } from 'react-router-dom'
import { ArrowLeft } from 'lucide-react'
import { AppNavbar } from '@/components/layout/app-navbar'
import { LoginForm } from '@/features/auth/login-form'
import { Button } from '@/components/ui/button'

export function LoginPage() {
  const navigate = useNavigate()

  return (
    <div className="min-h-dvh bg-background">
      <AppNavbar showAuthActions={false} />
      <main className="mx-auto flex w-full max-w-5xl flex-col items-center px-4 py-8 sm:px-6 sm:py-12">
        <div className="w-full max-w-md mb-4 flex items-center">
          <Button
            variant="ghost"
            size="sm"
            className="h-10 rounded-xl px-3 text-muted-foreground hover:text-foreground"
            onClick={() => navigate(-1)}
          >
            <ArrowLeft className="mr-2 size-4" />
            Back
          </Button>
        </div>
        <LoginForm />
      </main>
    </div>
  )
}

