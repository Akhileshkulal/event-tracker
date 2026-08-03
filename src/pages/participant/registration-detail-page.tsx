import { Link, useParams } from 'react-router-dom'
import { ArrowLeft, CalendarDays, MapPin } from 'lucide-react'
import { useAuth } from '@/contexts/auth-context'
import { useRegistration } from '@/hooks/use-events'
import { QrCard } from '@/components/shared/qr-card'
import { formatDateTime } from '@/utils/date'
import { Badge } from '@/components/ui/badge'
import { Button } from '@/components/ui/button'
import { Skeleton } from '@/components/ui/skeleton'

export function ParticipantRegistrationDetailPage() {
  const { registrationId } = useParams<{ registrationId: string }>()
  const { user } = useAuth()
  const regQuery = useRegistration(registrationId)

  if (regQuery.isLoading) {
    return (
      <main className="mx-auto w-full max-w-lg space-y-4 px-4 py-6 sm:px-6">
        <Skeleton className="h-8 w-40" />
        <Skeleton className="h-80 w-full rounded-[20px]" />
      </main>
    )
  }

  if (regQuery.isError || !regQuery.data) {
    return (
      <main className="mx-auto w-full max-w-lg px-4 py-10 text-center sm:px-6">
        <p className="font-medium">Registration not found</p>
        <Button asChild className="mt-4 h-11 rounded-xl">
          <Link to="/participant/registrations">Back</Link>
        </Button>
      </main>
    )
  }

  const reg = regQuery.data

  if (user && reg.participant_id !== user.id && user.role !== 'admin') {
    return (
      <main className="mx-auto w-full max-w-lg px-4 py-10 text-center sm:px-6">
        <p className="font-medium">You don’t have access to this QR</p>
        <Button asChild className="mt-4 h-11 rounded-xl">
          <Link to="/participant/registrations">Back</Link>
        </Button>
      </main>
    )
  }

  return (
    <main className="mx-auto w-full max-w-lg space-y-6 px-4 py-6 sm:px-6">
      <Button
        asChild
        variant="ghost"
        className="h-11 rounded-xl px-3 text-muted-foreground"
      >
        <Link to="/participant/registrations">
          <ArrowLeft className="size-4" />
          My registrations
        </Link>
      </Button>

      <div className="space-y-3 rounded-[20px] bg-surface p-5 ring-1 ring-border">
        <div className="flex flex-wrap items-center gap-2">
          <h1 className="text-xl font-semibold">
            {reg.events?.title ?? 'Event registration'}
          </h1>
          {reg.status === 'checked_in' ? (
            <Badge className="bg-success text-success-foreground">
              Checked in
            </Badge>
          ) : (
            <Badge variant="secondary" className="capitalize">
              {reg.status.replace('_', ' ')}
            </Badge>
          )}
        </div>

        {reg.events?.start_time ? (
          <p className="flex items-center gap-2 text-sm text-muted-foreground">
            <CalendarDays className="size-4 text-primary" />
            {formatDateTime(reg.events.start_time)}
          </p>
        ) : null}

        {reg.events?.location || reg.events?.venue ? (
          <p className="flex items-center gap-2 text-sm text-muted-foreground">
            <MapPin className="size-4 text-primary" />
            {[reg.events.venue, reg.events.location].filter(Boolean).join(' · ')}
          </p>
        ) : null}

        {reg.events?.id ? (
          <Button asChild variant="outline" className="h-11 w-full rounded-xl">
            <Link to={`/participant/events/${reg.events.id}`}>
              View event details
            </Link>
          </Button>
        ) : null}
      </div>

      <QrCard qrToken={reg.qr_token} />
    </main>
  )
}
