import { useEffect, useState } from 'react'
import { generateQrDataUrl } from '@/services/qr.service'

export function useQrDataUrl(
  qrToken: string | undefined,
  width = 512,
) {
  const [dataUrl, setDataUrl] = useState<string | null>(null)
  const [error, setError] = useState<string | null>(null)
  const [isGenerating, setIsGenerating] = useState(false)

  useEffect(() => {
    if (!qrToken) {
      setDataUrl(null)
      setError(null)
      return
    }

    let cancelled = false
    setIsGenerating(true)

    void (async () => {
      try {
        const url = await generateQrDataUrl(qrToken, { width })
        if (!cancelled) {
          setDataUrl(url)
          setError(null)
        }
      } catch {
        if (!cancelled) {
          setDataUrl(null)
          setError('Unable to generate QR code')
        }
      } finally {
        if (!cancelled) setIsGenerating(false)
      }
    })()

    return () => {
      cancelled = true
    }
  }, [qrToken, width])

  return { dataUrl, error, isGenerating }
}
