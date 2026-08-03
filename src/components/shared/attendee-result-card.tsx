import { Loader2 } from 'lucide-react'
import type { QrScanResult } from '@/types'
import { formatDateTime } from '@/utils/date'
import { Badge } from '@/components/ui/badge'
import { Button } from '@/components/ui/button'
import { cn } from '@/lib/utils'

type AttendeeResultCardProps = {
  result: QrScanResult
  onMarkAttendance?: () => void
  isMarking?: boolean
  className?: string
}

export function AttendeeResultCard({
  result,
  onMarkAttendance,
  isMarking = false,
  className,
}: AttendeeResultCardProps) {
  const alreadyCheckedIn = Boolean(result.attendance)

  return (
    <div
      className={cn(
        'space-y-4 rounded-[20px] bg-surface p-5 ring-1 ring-border',
        className,
      )}
    >
      <div className="flex flex-wrap items-center gap-2">
        <h3 className="text-lg font-semibold">{result.participant.full_name}</h3>
        {alreadyCheckedIn ? (
          <Badge className="bg-success text-success-foreground">
            Already checked in
          </Badge>
        ) : (
          <Badge variant="secondary" className="capitalize">
            {result.registration_status.replace('_', ' ')}
          </Badge>
        )}
      </div>

      <dl className="grid gap-3 text-sm sm:grid-cols-2">
        <Info label="USN" value={result.participant.usn ?? '—'} />
        <Info label="Email" value={result.participant.email} />
        <Info label="Branch" value={result.participant.branch ?? '—'} />
        <Info label="Event" value={result.event.title} />
        <Info
          label="Registration"
          value={result.registration_status.replace('_', ' ')}
          capitalize
        />
        {result.attendance ? (
          <Info
            label="Checked in at"
            value={formatDateTime(result.attendance.checked_in_at)}
          />
        ) : null}
      </dl>

      {onMarkAttendance ? (
        <Button
          type="button"
          className="h-12 w-full rounded-xl text-base"
          disabled={alreadyCheckedIn || isMarking}
          onClick={onMarkAttendance}
        >
          {isMarking ? (
            <>
              <Loader2 className="size-4 animate-spin" />
              Marking attendance…
            </>
          ) : alreadyCheckedIn ? (
            'Duplicate check-in blocked'
          ) : (
            'Mark attendance'
          )}
        </Button>
      ) : null}
    </div>
  )
}

function Info({
  label,
  value,
  capitalize = false,
}: {
  label: string
  value: string
  capitalize?: boolean
}) {
  return (
    <div className="rounded-xl bg-muted/50 px-3 py-2">
      <dt className="text-xs text-muted-foreground">{label}</dt>
      <dd
        className={
          capitalize
            ? 'mt-0.5 font-medium capitalize text-foreground'
            : 'mt-0.5 font-medium text-foreground'
        }
      >
        {value}
      </dd>
    </div>
  )
}
