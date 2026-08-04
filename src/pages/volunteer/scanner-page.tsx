import { Link, useNavigate } from 'react-router-dom'
import { ArrowLeft, ShieldCheck } from 'lucide-react'
import { CheckInPanel } from '@/features/scanner/check-in-panel'
import { Button } from '@/components/ui/button'

export function VolunteerScannerPage() {
  const navigate = useNavigate()

  return (
    <main className="mx-auto w-full max-w-lg space-y-6 px-4 py-6 sm:px-6">
      <Button
        variant="ghost"
        className="h-10 rounded-xl px-3 text-muted-foreground hover:text-foreground"
        onClick={() => navigate(-1)}
      >
        <ArrowLeft className="mr-2 size-4" />
        Back
      </Button>

      <div className="space-y-2">
        <h1 className="text-2xl font-semibold tracking-tight">QR Scanner</h1>
        <p className="text-muted-foreground">
          Scan a registration QR, validate the attendee, and mark attendance.
          Duplicate check-ins are blocked.
        </p>
      </div>

      <div className="flex items-center gap-2 rounded-xl bg-accent/70 px-4 py-3 text-xs text-muted-foreground">
        <ShieldCheck className="size-4 shrink-0 text-success" />
        QR contains only a secure token — never name, USN, or email.
      </div>

      <div className="rounded-[20px] bg-surface p-5 ring-1 ring-border">
        <CheckInPanel method="qr_scan" />
      </div>

      <Button asChild variant="outline" className="h-11 w-full rounded-xl">
        <Link to="/volunteer/events">View events</Link>
      </Button>
    </main>
  )
}
