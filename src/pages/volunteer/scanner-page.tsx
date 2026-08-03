import { Link } from 'react-router-dom'
import { Camera, ShieldCheck } from 'lucide-react'
import { ManualCheckInForm } from '@/features/scanner/manual-check-in-form'
import { Button } from '@/components/ui/button'

export function VolunteerScannerPage() {
  return (
    <main className="mx-auto w-full max-w-lg space-y-6 px-4 py-6 sm:px-6">
      <div className="space-y-2">
        <h1 className="text-2xl font-semibold tracking-tight">Scanner</h1>
        <p className="text-muted-foreground">
          Validate an attendee from their registration QR token, then mark
          attendance. Duplicate check-ins are blocked.
        </p>
      </div>

      <div className="rounded-[20px] bg-accent/70 p-4 ring-1 ring-border">
        <div className="flex items-start gap-3">
          <div className="flex size-10 shrink-0 items-center justify-center rounded-xl bg-surface">
            <Camera className="size-5 text-primary" />
          </div>
          <div className="space-y-2">
            <p className="font-medium text-foreground">Camera scan coming next</p>
            <p className="text-sm text-muted-foreground">
              Phase 7 adds live camera scanning with permission flow for mobile
              browsers over HTTPS.
            </p>
            <div className="flex items-center gap-2 text-xs text-muted-foreground">
              <ShieldCheck className="size-3.5 text-success" />
              QR stores only a secure token — never personal details
            </div>
          </div>
        </div>
      </div>

      <div className="rounded-[20px] bg-surface p-5 ring-1 ring-border">
        <ManualCheckInForm method="manual" />
      </div>

      <Button asChild variant="outline" className="h-11 w-full rounded-xl">
        <Link to="/volunteer/events">Choose an event first</Link>
      </Button>
    </main>
  )
}
