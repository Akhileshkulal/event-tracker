import { Link } from 'react-router-dom'
import { ArrowLeft, Award } from 'lucide-react'
import { AppNavbar } from '@/components/layout/app-navbar'
import { ProfileForm } from '@/features/auth/profile-form'
import { CertificateCard } from '@/features/certificates'
import { useAuth } from '@/contexts/auth-context'
import { useMyRegistrations } from '@/hooks/use-events'
import { roleHomePath } from '@/utils/roles'
import { Button } from '@/components/ui/button'

export function ProfilePage() {
  const { user } = useAuth()
  const regsQuery = useMyRegistrations(user?.id)

  const checkedInRegs = (regsQuery.data ?? []).filter(
    (reg) => reg.status === 'checked_in',
  )

  return (
    <div className="min-h-dvh bg-background">
      <AppNavbar />
      <main className="mx-auto w-full max-w-5xl space-y-8 px-4 py-8 sm:px-6">
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

        {user && user.role === 'participant' ? (
          <section className="space-y-4 pt-4 border-t border-border">
            <div className="flex items-center gap-2">
              <Award className="size-5 text-primary" />
              <h2 className="text-xl font-semibold tracking-tight">
                My Certificates ({checkedInRegs.length})
              </h2>
            </div>

            {regsQuery.isLoading ? (
              <p className="text-sm text-muted-foreground">
                Loading certificates...
              </p>
            ) : checkedInRegs.length === 0 ? (
              <div className="rounded-[20px] bg-surface p-6 text-center ring-1 ring-border">
                <p className="text-sm text-muted-foreground">
                  No earned certificates yet. Once you check in to an event, your official Certificate of Participation will appear here.
                </p>
              </div>
            ) : (
              <div className="grid gap-6 md:grid-cols-2">
                {checkedInRegs.map((reg) => (
                  <CertificateCard
                    key={reg.id}
                    participantName={user.full_name ?? 'Participant'}
                    usn={user.usn}
                    eventTitle={reg.events?.title ?? 'Event'}
                    eventDate={reg.events?.start_time}
                    registrationId={reg.id}
                  />
                ))}
              </div>
            )}
          </section>
        ) : null}
      </main>
    </div>
  )
}
