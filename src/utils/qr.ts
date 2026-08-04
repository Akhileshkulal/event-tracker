/**
 * QR payload helpers.
 * The QR code stores ONLY a secure registration token — never PII.
 *
 * Payload format: eventtrack:reg:<64-char-hex-token>
 */

export const QR_PREFIX = 'eventtrack:reg:'

export type QrPayloadParts = {
  token: string
  raw: string
}

export function buildQrPayload(qrToken: string): string {
  const token = qrToken.trim().toLowerCase()
  if (!token) {
    throw new Error('QR token is required')
  }
  return `${QR_PREFIX}${token}`
}

export function parseQrPayload(raw: string): string | null {
  const value = raw.trim()

  if (value.startsWith(QR_PREFIX)) {
    const token = value.slice(QR_PREFIX.length).trim()
    return isValidQrToken(token) ? token.toLowerCase() : null
  }

  if (isValidQrToken(value)) {
    return value.toLowerCase()
  }

  return null
}

export function isValidQrToken(token: string): boolean {
  return /^[a-f0-9]{64}$/i.test(token.trim())
}

export function describeQrSecurity() {
  return 'This QR contains only a secure registration token — never your name, USN, or email.'
}
