import { useState } from 'react'
import {
  Download,
  Expand,
  Loader2,
  QrCode,
  RefreshCw,
  Share2,
} from 'lucide-react'
import { toast } from 'sonner'
import { useQrDataUrl } from '@/hooks/use-qr'
import { downloadQrPng, shareQrImage } from '@/services/qr.service'
import { buildQrPayload, describeQrSecurity } from '@/utils/qr'
import { Button } from '@/components/ui/button'
import { Skeleton } from '@/components/ui/skeleton'
import {
  Dialog,
  DialogContent,
  DialogDescription,
  DialogHeader,
  DialogTitle,
} from '@/components/ui/dialog'
import { cn } from '@/lib/utils'

type QrCardProps = {
  qrToken: string
  registrationId?: string
  eventTitle?: string
  qrVersion?: number
  title?: string
  subtitle?: string
  className?: string
  onRegenerate?: () => Promise<void>
  canRegenerate?: boolean
}

export function QrCard({
  qrToken,
  registrationId,
  eventTitle,
  qrVersion,
  title = 'Your check-in QR',
  subtitle = describeQrSecurity(),
  className,
  onRegenerate,
  canRegenerate = false,
}: QrCardProps) {
  const { dataUrl, error, isGenerating } = useQrDataUrl(qrToken, 512)
  const [fullscreen, setFullscreen] = useState(false)
  const [regenerating, setRegenerating] = useState(false)

  async function handleDownload() {
    if (!dataUrl) return
    const safeName = (eventTitle ?? 'event')
      .toLowerCase()
      .replace(/[^a-z0-9]+/g, '-')
      .replace(/^-|-$/g, '')
    await downloadQrPng(
      dataUrl,
      `eventtrack-${safeName || 'checkin'}-qr.png`,
    )
    toast.success('QR downloaded')
  }

  async function handleShare() {
    if (!dataUrl) return
    try {
      await shareQrImage({
        dataUrl,
        title: eventTitle ? `${eventTitle} check-in QR` : 'EventTrack check-in QR',
        text: 'Show this QR at the venue for check-in.',
      })
    } catch (err) {
      const message =
        err instanceof Error ? err.message : 'Unable to share QR'
      if (message.toLowerCase().includes('share')) {
        toast.message('Sharing unavailable', {
          description: 'Use Download instead.',
        })
      } else if (message.toLowerCase().includes('abort')) {
        return
      } else {
        toast.error(message)
      }
    }
  }

  async function handleCopyPayload() {
    try {
      await navigator.clipboard.writeText(buildQrPayload(qrToken))
      toast.success('QR payload copied', {
        description: 'Token only — no personal details.',
      })
    } catch {
      toast.error('Could not copy to clipboard')
    }
  }

  async function handleRegenerate() {
    if (!onRegenerate) return
    const confirmed = window.confirm(
      'Regenerate this QR? The old code will stop working immediately.',
    )
    if (!confirmed) return

    setRegenerating(true)
    try {
      await onRegenerate()
      toast.success('New QR generated')
    } catch (err) {
      toast.error(
        err instanceof Error ? err.message : 'Could not regenerate QR',
      )
    } finally {
      setRegenerating(false)
    }
  }

  return (
    <>
      <div
        className={cn(
          'rounded-[20px] bg-surface p-5 ring-1 ring-border sm:p-6',
          className,
        )}
      >
        <div className="mb-4 space-y-1 text-center">
          <div className="mx-auto mb-3 flex size-10 items-center justify-center rounded-xl bg-accent">
            <QrCode className="size-5 text-primary" />
          </div>
          <h3 className="text-lg font-semibold text-foreground">{title}</h3>
          <p className="text-sm text-muted-foreground">{subtitle}</p>
          {typeof qrVersion === 'number' ? (
            <p className="text-xs text-muted-foreground">
              QR version {qrVersion}
              {registrationId ? ` · ID ${registrationId.slice(0, 8)}` : ''}
            </p>
          ) : null}
        </div>

        <button
          type="button"
          className="mx-auto flex aspect-square w-full max-w-[280px] items-center justify-center rounded-2xl bg-white p-4 ring-1 ring-border transition hover:ring-primary/40"
          onClick={() => setFullscreen(true)}
          aria-label="Open fullscreen QR"
        >
          {error ? (
            <p className="text-center text-sm text-danger">{error}</p>
          ) : dataUrl ? (
            <img
              src={dataUrl}
              alt="Registration QR code"
              className="size-full object-contain"
            />
          ) : (
            <Skeleton className="size-full rounded-xl" />
          )}
        </button>

        <div className="mt-4 grid grid-cols-2 gap-3">
          <Button
            type="button"
            variant="outline"
            className="h-12 rounded-xl"
            disabled={!dataUrl || isGenerating}
            onClick={() => void handleDownload()}
          >
            <Download className="size-4" />
            Download
          </Button>
          <Button
            type="button"
            variant="outline"
            className="h-12 rounded-xl"
            disabled={!dataUrl || isGenerating}
            onClick={() => void handleShare()}
          >
            <Share2 className="size-4" />
            Share
          </Button>
          <Button
            type="button"
            variant="outline"
            className="h-12 rounded-xl"
            disabled={!dataUrl}
            onClick={() => setFullscreen(true)}
          >
            <Expand className="size-4" />
            Fullscreen
          </Button>
          <Button
            type="button"
            variant="outline"
            className="h-12 rounded-xl"
            onClick={() => void handleCopyPayload()}
          >
            Copy token
          </Button>
        </div>

        {canRegenerate && onRegenerate ? (
          <Button
            type="button"
            variant="secondary"
            className="mt-3 h-12 w-full rounded-xl"
            disabled={regenerating}
            onClick={() => void handleRegenerate()}
          >
            {regenerating ? (
              <>
                <Loader2 className="size-4 animate-spin" />
                Regenerating…
              </>
            ) : (
              <>
                <RefreshCw className="size-4" />
                Regenerate QR
              </>
            )}
          </Button>
        ) : null}
      </div>

      <Dialog open={fullscreen} onOpenChange={setFullscreen}>
        <DialogContent className="max-w-md rounded-[20px] border-border bg-surface p-6">
          <DialogHeader>
            <DialogTitle>Check-in QR</DialogTitle>
            <DialogDescription>{describeQrSecurity()}</DialogDescription>
          </DialogHeader>
          <div className="mx-auto aspect-square w-full max-w-sm rounded-2xl bg-white p-4 ring-1 ring-border">
            {dataUrl ? (
              <img
                src={dataUrl}
                alt="Fullscreen registration QR"
                className="size-full object-contain"
              />
            ) : (
              <Skeleton className="size-full rounded-xl" />
            )}
          </div>
          {eventTitle ? (
            <p className="text-center text-sm font-medium">{eventTitle}</p>
          ) : null}
        </DialogContent>
      </Dialog>
    </>
  )
}
