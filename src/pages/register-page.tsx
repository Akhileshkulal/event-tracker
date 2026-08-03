import { AppNavbar } from '@/components/layout/app-navbar'
import { RegisterForm } from '@/features/auth/register-form'

export function RegisterPage() {
  return (
    <div className="min-h-dvh bg-background">
      <AppNavbar showAuthActions={false} />
      <main className="mx-auto flex w-full max-w-5xl justify-center px-4 py-10 sm:px-6 sm:py-12">
        <RegisterForm />
      </main>
    </div>
  )
}
