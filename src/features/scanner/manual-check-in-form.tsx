import { useState, type FormEvent } from 'react'
import { Loader2, Search } from 'lucide-react'
import { toast } from 'sonner'
import {
  lookupByQrToken,
  markAttendanceByQr,
} from '@/services/attendance.service'
import type { AttendanceMethod, QrScanResult } from '@/types'
import { AttendeeResultCard } from '@/components/shared/attendee-result-card'
import { Button } from '@/components/ui/button'
import { Input } from '@/components/ui/input'
import { Label } from '@/components/ui/label'

type ManualCheckInFormProps = {
  method?: AttendanceMethod
  onCheckedIn?: (result: QrScanResult) => void
}

export function ManualCheckInForm({
  method = 'manual',
  onCheckedIn,
}: ManualCheckInFormProps) {
  const [token, setToken] = useState('')
  const [result, setResult] = useState<QrScanResult | null>(null)
  const [lookingUp, setLookingUp] = useState(false)
  const [marking, setMarking] = useState(false)

  async function handleLookup(e: FormEvent) {
    e.preventDefault()
    if (!token.trim()) {
      toast.error('Paste a QR token to look up')
      return
    }

    setLookingUp(true)
    setResult(null)
    try {
      const data = await lookupByQrToken(token)
      setResult(data)
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
  }

  async function handleMarkAttendance() {
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
  }

  return (
    <div className="space-y-5">
      <form className="space-y-3" onSubmit={handleLookup} noValidate>
        <div className="space-y-2">
          <Label htmlFor="qr-token">Registration QR token</Label>
          <Input
            id="qr-token"
            value={token}
            onChange={(e) => setToken(e.target.value)}
            placeholder="Paste token or eventtrack:reg:…"
            className="h-12 rounded-xl text-base"
          />
        </div>
        <Button
          type="submit"
          disabled={lookingUp}
          className="h-12 w-full rounded-xl text-base"
        >
          {lookingUp ? (
            <>
              <Loader2 className="size-4 animate-spin" />
              Looking up…
            </>
          ) : (
            <>
              <Search className="size-4" />
              Validate attendee
            </>
          )}
        </Button>
      </form>

      {result ? (
        <AttendeeResultCard
          result={result}
          isMarking={marking}
          onMarkAttendance={handleMarkAttendance}
        />
      ) : null}
    </div>
  )
}
