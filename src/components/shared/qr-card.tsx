import { useEffect, useState } from 'react'
import QRCode from 'qrcode'
import { Download, QrCode } from 'lucide-react'
import { buildQrPayload } from '@/utils/qr'
import { Button } from '@/components/ui/button'
import { Skeleton } from '@/components/ui/skeleton'
import { cn } from '@/lib/utils'

type QrCardProps = {
  qrToken: string
  title?: string
  subtitle?: string
  className?: string
}

export function QrCard({
  qrToken,
  title = 'Your check-in QR',
  subtitle = 'Show this at the venue. It contains no personal details.',
  className,
}: QrCardProps) {
  const [dataUrl, setDataUrl] = useState<string | null>(null)
  const [error, setError] = useState<string | null>(null)

  useEffect(() => {
    let cancelled = false

    async function generate() {
      try {
        const url = await QRCode.toDataURL(buildQrPayload(qrToken), {
          errorCorrectionLevel: 'M',
          margin: 2,
          width: 320,
          color: {
            dark: '#0F172A',
            light: '#FFFFFF',
          },
        })
        if (!cancelled) {
          setDataUrl(url)
          setError(null)
        }
      } catch {
        if (!cancelled) {
          setError('Unable to generate QR code')
          setDataUrl(null)
        }
      }
    }

    void generate()
    return () => {
      cancelled = true
    }
  }, [qrToken])

  function downloadQr() {
    if (!dataUrl) return
    const link = document.createElement('a')
    link.href = dataUrl
    link.download = 'eventtrack-qr.png'
    link.click()
  }

  return (
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
      </div>

      <div className="mx-auto flex aspect-square w-full max-w-[280px] items-center justify-center rounded-2xl bg-white p-4 ring-1 ring-border">
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
      </div>

      <Button
        type="button"
        variant="outline"
        className="mt-4 h-12 w-full rounded-xl"
        disabled={!dataUrl}
        onClick={downloadQr}
      >
        <Download className="size-4" />
        Download QR
      </Button>
    </div>
  )
}
