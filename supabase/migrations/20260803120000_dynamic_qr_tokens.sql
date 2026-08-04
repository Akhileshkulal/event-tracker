-- =============================================================================
-- EventTrack — Dynamic QR token support
-- Allows regenerating the opaque registration QR token (invalidates old QR)
-- =============================================================================

ALTER TABLE public.registrations
  ADD COLUMN IF NOT EXISTS qr_version INTEGER NOT NULL DEFAULT 1,
  ADD COLUMN IF NOT EXISTS qr_rotated_at TIMESTAMPTZ;

COMMENT ON COLUMN public.registrations.qr_token IS
  'Opaque secure token embedded in QR. No personal data. One active token per registration.';
COMMENT ON COLUMN public.registrations.qr_version IS
  'Increments each time the QR token is regenerated (dynamic QR support).';
COMMENT ON COLUMN public.registrations.qr_rotated_at IS
  'Timestamp of the last QR token rotation.';

-- Regenerate QR token for a registration (participant owner or organizer/admin)
CREATE OR REPLACE FUNCTION public.regenerate_registration_qr(p_registration_id UUID)
RETURNS public.registrations
LANGUAGE plpgsql
SECURITY DEFINER
SET search_path = public
AS $$
DECLARE
  v_reg public.registrations%ROWTYPE;
  v_new_token TEXT;
BEGIN
  IF auth.uid() IS NULL THEN
    RAISE EXCEPTION 'Authentication required';
  END IF;

  SELECT * INTO v_reg
  FROM public.registrations
  WHERE id = p_registration_id;

  IF NOT FOUND THEN
    RAISE EXCEPTION 'Registration not found';
  END IF;

  IF v_reg.status = 'cancelled' THEN
    RAISE EXCEPTION 'Cannot regenerate QR for a cancelled registration';
  END IF;

  IF NOT (
    v_reg.participant_id = auth.uid()
    OR public.is_organizer_of(v_reg.event_id)
    OR public.is_admin()
  ) THEN
    RAISE EXCEPTION 'Insufficient permissions to regenerate QR';
  END IF;

  -- Cryptographically secure opaque token — never includes PII
  v_new_token := encode(gen_random_bytes(32), 'hex');

  UPDATE public.registrations
  SET
    qr_token = v_new_token,
    qr_version = v_reg.qr_version + 1,
    qr_rotated_at = timezone('utc', now())
  WHERE id = p_registration_id
  RETURNING * INTO v_reg;

  RETURN v_reg;
END;
$$;

GRANT EXECUTE ON FUNCTION public.regenerate_registration_qr(UUID) TO authenticated;
