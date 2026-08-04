import { useCallback, useState } from 'react'
import { Loader2, RotateCcw } from 'lucide-react'
import { toast } from 'sonner'
import {
  lookupByQrToken,
  markAttendanceByQr,
} from '@/services/attendance.service'
import type { AttendanceMethod, QrScanResult } from '@/types'
import { AttendeeResultCard } from '@/components/shared/attendee-result-card'
import { QrScanner } from '@/features/scanner/qr-scanner'
import { ManualCheckInForm } from '@/features/scanner/manual-check-in-form'
import { Button } from '@/components/ui/button'
import { Separator } from '@/components/ui/separator'

type CheckInPanelProps = {
  method?: AttendanceMethod
  onCheckedIn?: (result: QrScanResult) => void
}

export function CheckInPanel({
  method = 'qr_scan',
  onCheckedIn,
}: CheckInPanelProps) {
  const [result, setResult] = useState<QrScanResult | null>(null)
  const [lookingUp, setLookingUp] = useState(false)
  const [marking, setMarking] = useState(false)
  const [scannerPaused, setScannerPaused] = useState(false)

  const handleLookup = useCallback(async (rawToken: string) => {
    setLookingUp(true)
    try {
      const data = await lookupByQrToken(rawToken)
      setResult(data)
      setScannerPaused(true)
      if (data.attendance) {
        toast.warning('This participant is already checked in')
      } else {
        toast.success('Participant found')
      }
    } catch (error) {
      toast.error(
        error instanceof Error ? error.message : 'Could not look up QR',
      )
    } finally {
      setLookingUp(false)
    }
  }, [])

  const handleMarkAttendance = useCallback(async () => {
    if (!result) return
    setMarking(true)
    try {
      await markAttendanceByQr(result.qr_token, method)
      const refreshed = await lookupByQrToken(result.qr_token)
      setResult(refreshed)
      toast.success('Attendance marked')
      onCheckedIn?.(refreshed)
    } catch (error) {
      const message =
        error instanceof Error ? error.message : 'Could not mark attendance'
      if (message.toLowerCase().includes('duplicate')) {
        toast.error('Duplicate check-in blocked')
      } else {
        toast.error(message)
      }
    } finally {
      setMarking(false)
    }
  }, [method, onCheckedIn, result])

  function resetScan() {
    setResult(null)
    setScannerPaused(false)
  }

  return (
    <div className="space-y-6">
      <section className="space-y-4">
        <div className="space-y-1">
          <h2 className="text-lg font-semibold">Scan QR code</h2>
          <p className="text-sm text-muted-foreground">
            Point the camera at the participant&apos;s registration QR. Only a
            secure token is read — personal details are fetched from Supabase.
          </p>
        </div>

        <QrScanner
          paused={scannerPaused || lookingUp}
          onScan={(token) => void handleLookup(token)}
          onError={(message) => {
            if (
              message.toLowerCase().includes('permission') ||
              message.toLowerCase().includes('notallowed')
            ) {
              toast.error('Camera permission denied', {
                description: 'Enable camera access in browser settings.',
              })
            }
          }}
        />

        {lookingUp ? (
          <div className="flex items-center justify-center gap-2 text-sm text-muted-foreground">
            <Loader2 className="size-4 animate-spin" />
            Fetching participant details…
          </div>
        ) : null}
      </section>

      {result ? (
        <section className="space-y-4">
          <AttendeeResultCard
            result={result}
            isMarking={marking}
            onMarkAttendance={handleMarkAttendance}
          />
          <Button
            type="button"
            variant="outline"
            className="h-12 w-full rounded-xl"
            onClick={resetScan}
          >
            <RotateCcw className="size-4" />
            Scan next attendee
          </Button>
        </section>
      ) : null}

      <Separator />

      <section className="space-y-4">
        <div className="space-y-1">
          <h2 className="text-lg font-semibold">Manual fallback</h2>
          <p className="text-sm text-muted-foreground">
            Paste a registration token if the camera is unavailable.
          </p>
        </div>
        <ManualCheckInForm
          method={method === 'qr_scan' ? 'manual' : method}
          onCheckedIn={(data) => {
            setResult(data)
            setScannerPaused(true)
            onCheckedIn?.(data)
          }}
        />
      </section>
    </div>
  )
}
