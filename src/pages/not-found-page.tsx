import { Link } from 'react-router-dom'
import { AppNavbar } from '@/components/layout/app-navbar'
import { Button } from '@/components/ui/button'

export function NotFoundPage() {
  return (
    <div className="min-h-dvh bg-background">
      <AppNavbar />
      <main className="mx-auto flex min-h-[calc(100dvh-3.5rem)] w-full max-w-5xl flex-col items-center justify-center gap-4 px-4 text-center">
        <p className="text-sm font-medium text-primary">404</p>
        <h1 className="text-2xl font-semibold">Page not found</h1>
        <Button asChild className="h-11 rounded-xl">
          <Link to="/">Back home</Link>
        </Button>
      </main>
    </div>
  )
}
