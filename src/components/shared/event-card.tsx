import { Link } from 'react-router-dom'
import { CalendarDays, MapPin, Users } from 'lucide-react'
import type { Event } from '@/types'
import { formatDateTime, isEventLive, isEventUpcoming } from '@/utils/date'
import { Badge } from '@/components/ui/badge'
import { cn } from '@/lib/utils'

type EventCardProps = {
  event: Event
  to?: string
  registrationCount?: number
  className?: string
}

export function EventCard({
  event,
  to,
  registrationCount,
  className,
}: EventCardProps) {
  const live = isEventLive(event.start_time, event.end_time)
  const upcoming = isEventUpcoming(event.start_time)

  const content = (
    <article
      className={cn(
        'overflow-hidden rounded-[20px] bg-surface ring-1 ring-border transition hover:ring-primary/30',
        className,
      )}
    >
      <div className="relative aspect-[16/9] bg-gradient-to-br from-accent to-secondary">
        {event.cover_image_url ? (
          <img
            src={event.cover_image_url}
            alt=""
            className="size-full object-cover"
          />
        ) : (
          <div className="flex size-full items-center justify-center">
            <CalendarDays className="size-10 text-primary/40" />
          </div>
        )}
        <div className="absolute top-3 left-3 flex gap-2">
          {live ? (
            <Badge className="bg-success text-success-foreground">Live</Badge>
          ) : upcoming ? (
            <Badge variant="secondary">Upcoming</Badge>
          ) : (
            <Badge variant="outline">Ended</Badge>
          )}
          {!event.is_registration_open ? (
            <Badge variant="outline">Registration closed</Badge>
          ) : null}
        </div>
      </div>

      <div className="space-y-3 p-4">
        <div className="space-y-1">
          <h3 className="text-lg font-semibold tracking-tight text-foreground">
            {event.title}
          </h3>
          {event.description ? (
            <p className="line-clamp-2 text-sm text-muted-foreground">
              {event.description}
            </p>
          ) : null}
        </div>

        <div className="space-y-2 text-sm text-muted-foreground">
          <p className="flex items-center gap-2">
            <CalendarDays className="size-4 shrink-0 text-primary" />
            {formatDateTime(event.start_time)}
          </p>
          {event.location || event.venue ? (
            <p className="flex items-center gap-2">
              <MapPin className="size-4 shrink-0 text-primary" />
              {[event.venue, event.location].filter(Boolean).join(' · ')}
            </p>
          ) : null}
          {typeof registrationCount === 'number' || event.capacity ? (
            <p className="flex items-center gap-2">
              <Users className="size-4 shrink-0 text-primary" />
              {typeof registrationCount === 'number'
                ? `${registrationCount}`
                : '—'}
              {event.capacity ? ` / ${event.capacity}` : ''} registered
            </p>
          ) : null}
        </div>
      </div>
    </article>
  )

  if (!to) return content

  return (
    <Link to={to} className="block focus-visible:outline-none">
      {content}
    </Link>
  )
}
