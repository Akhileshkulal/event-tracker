import { useRef, useState } from 'react'
import { Download, Printer, CheckCircle2, Sparkles } from 'lucide-react'
import { formatDateTime } from '@/utils/date'
import { Button } from '@/components/ui/button'
import { Badge } from '@/components/ui/badge'

type CertificateCardProps = {
  participantName: string
  usn?: string | null
  eventTitle: string
  eventDate?: string | null
  issueDate?: string | null
  registrationId: string
  organizerName?: string
}

export function CertificateCard({
  participantName,
  usn,
  eventTitle,
  eventDate,
  issueDate,
  registrationId,
  organizerName = 'EventTrack Organizer',
}: CertificateCardProps) {
  const [isDownloading, setIsDownloading] = useState(false)
  const certRef = useRef<HTMLDivElement>(null)

  const formattedDate = issueDate
    ? formatDateTime(issueDate)
    : eventDate
      ? formatDateTime(eventDate)
      : new Date().toLocaleDateString('en-US', {
          year: 'numeric',
          month: 'long',
          day: 'numeric',
        })

  const certId = `CERT-${registrationId.slice(0, 8).toUpperCase()}`

  function handleDownloadPng() {
    setIsDownloading(true)

    // Render Certificate to HTML5 Canvas
    const canvas = document.createElement('canvas')
    const ctx = canvas.getContext('2d')
    if (!ctx) {
      setIsDownloading(false)
      return
    }

    // Set high resolution canvas (1200x850)
    canvas.width = 1200
    canvas.height = 850

    // Background Gradient
    const gradient = ctx.createLinearGradient(0, 0, 1200, 850)
    gradient.addColorStop(0, '#0F172A')
    gradient.addColorStop(1, '#1E293B')
    ctx.fillStyle = gradient
    ctx.fillRect(0, 0, 1200, 850)

    // Decorative Borders & Gold Ring
    ctx.strokeStyle = 'rgba(234, 179, 8, 0.4)'
    ctx.lineWidth = 6
    ctx.strokeRect(30, 30, 1140, 790)

    ctx.strokeStyle = 'rgba(59, 130, 246, 0.3)'
    ctx.lineWidth = 2
    ctx.strokeRect(42, 42, 1116, 766)

    // Header Text
    ctx.fillStyle = '#60A5FA'
    ctx.font = '600 24px Inter, sans-serif'
    ctx.textAlign = 'center'
    ctx.fillText('EVENTTRACK OFFICIAL CERTIFICATE', 600, 120)

    ctx.fillStyle = '#FFFFFF'
    ctx.font = 'bold 44px Inter, sans-serif'
    ctx.fillText('Certificate of Participation', 600, 190)

    ctx.fillStyle = '#94A3B8'
    ctx.font = '20px Inter, sans-serif'
    ctx.fillText('This is proudly presented to', 600, 270)

    // Participant Name
    ctx.fillStyle = '#F8FAFC'
    ctx.font = 'bold 48px Inter, sans-serif'
    ctx.fillText(participantName, 600, 340)

    if (usn) {
      ctx.fillStyle = '#CBD5E1'
      ctx.font = '600 20px Inter, sans-serif'
      ctx.fillText(`USN / ID: ${usn}`, 600, 385)
    }

    ctx.fillStyle = '#94A3B8'
    ctx.font = '20px Inter, sans-serif'
    ctx.fillText('for successfully attending and completing', 600, 455)

    // Event Title
    ctx.fillStyle = '#38BDF8'
    ctx.font = 'bold 36px Inter, sans-serif'
    ctx.fillText(eventTitle, 600, 520)

    // Footer Info
    ctx.fillStyle = '#94A3B8'
    ctx.font = '18px Inter, sans-serif'
    ctx.fillText(`Date: ${formattedDate}`, 350, 680)
    ctx.fillText(`Issued by: ${organizerName}`, 850, 680)

    // Verification ID
    ctx.fillStyle = '#E2E8F0'
    ctx.font = '600 16px Inter, sans-serif'
    ctx.fillText(`Verification ID: ${certId}`, 600, 760)

    // Trigger Download
    const link = document.createElement('a')
    link.download = `${certId}_${eventTitle.replace(/[^a-zA-Z0-9]/g, '_')}.png`
    link.href = canvas.toDataURL('image/png')
    link.click()

    setIsDownloading(false)
  }

  function handlePrint() {
    window.print()
  }

  return (
    <div className="space-y-4">
      {/* Visual Certificate Preview */}
      <div
        ref={certRef}
        className="relative overflow-hidden rounded-[24px] border border-border bg-gradient-to-br from-slate-900 via-slate-800 to-slate-950 p-6 sm:p-10 text-white shadow-2xl ring-1 ring-white/10"
      >
        {/* Subtle decorative background glow */}
        <div className="pointer-events-none absolute -right-20 -top-20 size-72 rounded-full bg-primary/20 blur-3xl" />
        <div className="pointer-events-none absolute -bottom-20 -left-20 size-72 rounded-full bg-emerald-500/10 blur-3xl" />

        <div className="relative z-10 flex flex-col items-center text-center space-y-6">
          <div className="flex items-center gap-2">
            <Badge className="bg-amber-500/20 text-amber-300 border-amber-500/30 gap-1.5 px-3 py-1 text-xs font-semibold">
              <Sparkles className="size-3.5" /> Official Certificate
            </Badge>
          </div>

          <div className="space-y-2">
            <h2 className="text-2xl sm:text-3xl font-extrabold tracking-tight bg-gradient-to-r from-blue-400 via-sky-200 to-indigo-300 bg-clip-text text-transparent">
              Certificate of Participation
            </h2>
            <p className="text-xs sm:text-sm text-slate-400">
              This is proudly presented to
            </p>
          </div>

          <div className="py-2">
            <p className="text-2xl sm:text-4xl font-bold tracking-tight text-slate-50">
              {participantName}
            </p>
            {usn ? (
              <p className="mt-1 text-xs sm:text-sm font-medium text-slate-400">
                USN / ID: {usn}
              </p>
            ) : null}
          </div>

          <div className="space-y-1">
            <p className="text-xs sm:text-sm text-slate-400">
              for successfully attending and completing
            </p>
            <p className="text-lg sm:text-2xl font-bold text-sky-400">
              {eventTitle}
            </p>
          </div>

          <div className="w-full border-t border-slate-700/60 pt-6 mt-4 flex flex-col sm:flex-row items-center justify-between gap-4 text-xs text-slate-400">
            <div className="flex items-center gap-1.5 text-emerald-400 font-medium">
              <CheckCircle2 className="size-4" /> Verified Attendance
            </div>

            <div className="text-center sm:text-right">
              <p className="font-mono text-[11px] text-slate-400">
                ID: {certId}
              </p>
              <p className="text-[11px] text-slate-400">{formattedDate}</p>
            </div>
          </div>
        </div>
      </div>

      {/* Action Buttons */}
      <div className="flex flex-col sm:flex-row items-center gap-3">
        <Button
          onClick={handleDownloadPng}
          disabled={isDownloading}
          className="h-11 w-full sm:flex-1 rounded-xl bg-primary gap-2 font-medium"
        >
          <Download className="size-4" />
          {isDownloading ? 'Generating...' : 'Download Certificate (PNG)'}
        </Button>
        <Button
          onClick={handlePrint}
          variant="outline"
          className="h-11 w-full sm:w-auto rounded-xl gap-2"
        >
          <Printer className="size-4" />
          Print / PDF
        </Button>
      </div>
    </div>
  )
}
