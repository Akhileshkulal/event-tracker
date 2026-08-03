-- =============================================================================
-- EventTrack — Initial Schema
-- Tables: users, events, registrations, attendance, certificates,
--         notifications, event_volunteers
-- =============================================================================

-- Extensions
CREATE EXTENSION IF NOT EXISTS "pgcrypto";

-- =============================================================================
-- ENUMS
-- =============================================================================

CREATE TYPE public.user_role AS ENUM (
  'participant',
  'organizer',
  'volunteer',
  'admin'
);

CREATE TYPE public.event_status AS ENUM (
  'draft',
  'published',
  'ongoing',
  'completed',
  'cancelled'
);

CREATE TYPE public.registration_status AS ENUM (
  'registered',
  'cancelled',
  'checked_in'
);

CREATE TYPE public.attendance_method AS ENUM (
  'qr_scan',
  'manual'
);

CREATE TYPE public.notification_type AS ENUM (
  'info',
  'success',
  'warning',
  'event',
  'certificate'
);

-- =============================================================================
-- HELPER: updated_at trigger
-- =============================================================================

CREATE OR REPLACE FUNCTION public.set_updated_at()
RETURNS TRIGGER
LANGUAGE plpgsql
AS $$
BEGIN
  NEW.updated_at = timezone('utc', now());
  RETURN NEW;
END;
$$;

-- =============================================================================
-- TABLE: users (public profile linked to auth.users)
-- =============================================================================

CREATE TABLE public.users (
  id UUID PRIMARY KEY REFERENCES auth.users (id) ON DELETE CASCADE,
  email TEXT NOT NULL,
  full_name TEXT NOT NULL,
  usn TEXT,
  branch TEXT,
  phone TEXT,
  avatar_url TEXT,
  role public.user_role NOT NULL DEFAULT 'participant',
  created_at TIMESTAMPTZ NOT NULL DEFAULT timezone('utc', now()),
  updated_at TIMESTAMPTZ NOT NULL DEFAULT timezone('utc', now()),
  CONSTRAINT users_email_key UNIQUE (email)
);

CREATE INDEX users_role_idx ON public.users (role);
CREATE INDEX users_usn_idx ON public.users (usn);

CREATE TRIGGER users_set_updated_at
  BEFORE UPDATE ON public.users
  FOR EACH ROW
  EXECUTE FUNCTION public.set_updated_at();

COMMENT ON TABLE public.users IS 'Application user profiles linked to Supabase Auth';

-- =============================================================================
-- TABLE: events
-- =============================================================================

CREATE TABLE public.events (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  title TEXT NOT NULL,
  description TEXT,
  location TEXT,
  venue TEXT,
  start_time TIMESTAMPTZ NOT NULL,
  end_time TIMESTAMPTZ NOT NULL,
  capacity INTEGER CHECK (capacity IS NULL OR capacity > 0),
  cover_image_url TEXT,
  organizer_id UUID NOT NULL REFERENCES public.users (id) ON DELETE RESTRICT,
  status public.event_status NOT NULL DEFAULT 'draft',
  is_registration_open BOOLEAN NOT NULL DEFAULT TRUE,
  created_at TIMESTAMPTZ NOT NULL DEFAULT timezone('utc', now()),
  updated_at TIMESTAMPTZ NOT NULL DEFAULT timezone('utc', now()),
  CONSTRAINT events_time_range_check CHECK (end_time > start_time)
);

CREATE INDEX events_organizer_id_idx ON public.events (organizer_id);
CREATE INDEX events_status_idx ON public.events (status);
CREATE INDEX events_start_time_idx ON public.events (start_time);

CREATE TRIGGER events_set_updated_at
  BEFORE UPDATE ON public.events
  FOR EACH ROW
  EXECUTE FUNCTION public.set_updated_at();

COMMENT ON TABLE public.events IS 'Events created and managed by organizers';

-- =============================================================================
-- TABLE: registrations (one unique QR token per registration)
-- =============================================================================

CREATE TABLE public.registrations (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  event_id UUID NOT NULL REFERENCES public.events (id) ON DELETE CASCADE,
  participant_id UUID NOT NULL REFERENCES public.users (id) ON DELETE CASCADE,
  -- Secure opaque token stored in QR codes — NEVER includes PII
  qr_token TEXT NOT NULL DEFAULT encode(gen_random_bytes(32), 'hex'),
  status public.registration_status NOT NULL DEFAULT 'registered',
  registered_at TIMESTAMPTZ NOT NULL DEFAULT timezone('utc', now()),
  cancelled_at TIMESTAMPTZ,
  CONSTRAINT registrations_event_participant_key UNIQUE (event_id, participant_id),
  CONSTRAINT registrations_qr_token_key UNIQUE (qr_token)
);

CREATE INDEX registrations_event_id_idx ON public.registrations (event_id);
CREATE INDEX registrations_participant_id_idx ON public.registrations (participant_id);
CREATE INDEX registrations_qr_token_idx ON public.registrations (qr_token);
CREATE INDEX registrations_status_idx ON public.registrations (status);

COMMENT ON COLUMN public.registrations.qr_token IS
  'Opaque secure token embedded in QR. No personal data. One token per registration.';

-- =============================================================================
-- TABLE: attendance (one check-in per registration — prevents duplicates)
-- =============================================================================

CREATE TABLE public.attendance (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  registration_id UUID NOT NULL REFERENCES public.registrations (id) ON DELETE CASCADE,
  event_id UUID NOT NULL REFERENCES public.events (id) ON DELETE CASCADE,
  participant_id UUID NOT NULL REFERENCES public.users (id) ON DELETE CASCADE,
  checked_in_by UUID NOT NULL REFERENCES public.users (id) ON DELETE RESTRICT,
  checked_in_at TIMESTAMPTZ NOT NULL DEFAULT timezone('utc', now()),
  method public.attendance_method NOT NULL DEFAULT 'qr_scan',
  -- UNIQUE on registration_id enforces single check-in (no duplicate attendance)
  CONSTRAINT attendance_registration_id_key UNIQUE (registration_id)
);

CREATE INDEX attendance_event_id_idx ON public.attendance (event_id);
CREATE INDEX attendance_participant_id_idx ON public.attendance (participant_id);
CREATE INDEX attendance_checked_in_at_idx ON public.attendance (checked_in_at);

COMMENT ON TABLE public.attendance IS
  'Check-in records. UNIQUE(registration_id) prevents duplicate check-ins.';

-- =============================================================================
-- TABLE: certificates
-- =============================================================================

CREATE TABLE public.certificates (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  registration_id UUID NOT NULL REFERENCES public.registrations (id) ON DELETE CASCADE,
  event_id UUID NOT NULL REFERENCES public.events (id) ON DELETE CASCADE,
  participant_id UUID NOT NULL REFERENCES public.users (id) ON DELETE CASCADE,
  certificate_url TEXT,
  issued_at TIMESTAMPTZ NOT NULL DEFAULT timezone('utc', now()),
  CONSTRAINT certificates_registration_id_key UNIQUE (registration_id)
);

CREATE INDEX certificates_participant_id_idx ON public.certificates (participant_id);
CREATE INDEX certificates_event_id_idx ON public.certificates (event_id);

-- =============================================================================
-- TABLE: notifications
-- =============================================================================

CREATE TABLE public.notifications (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  user_id UUID NOT NULL REFERENCES public.users (id) ON DELETE CASCADE,
  title TEXT NOT NULL,
  message TEXT NOT NULL,
  type public.notification_type NOT NULL DEFAULT 'info',
  is_read BOOLEAN NOT NULL DEFAULT FALSE,
  link TEXT,
  created_at TIMESTAMPTZ NOT NULL DEFAULT timezone('utc', now())
);

CREATE INDEX notifications_user_id_idx ON public.notifications (user_id);
CREATE INDEX notifications_user_unread_idx ON public.notifications (user_id, is_read)
  WHERE is_read = FALSE;

-- =============================================================================
-- TABLE: event_volunteers (assign volunteers to specific events)
-- =============================================================================

CREATE TABLE public.event_volunteers (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  event_id UUID NOT NULL REFERENCES public.events (id) ON DELETE CASCADE,
  volunteer_id UUID NOT NULL REFERENCES public.users (id) ON DELETE CASCADE,
  assigned_by UUID REFERENCES public.users (id) ON DELETE SET NULL,
  assigned_at TIMESTAMPTZ NOT NULL DEFAULT timezone('utc', now()),
  CONSTRAINT event_volunteers_event_volunteer_key UNIQUE (event_id, volunteer_id)
);

CREATE INDEX event_volunteers_event_id_idx ON public.event_volunteers (event_id);
CREATE INDEX event_volunteers_volunteer_id_idx ON public.event_volunteers (volunteer_id);

-- =============================================================================
-- AUTH HELPERS (SECURITY DEFINER — used by RLS)
-- =============================================================================

CREATE OR REPLACE FUNCTION public.current_user_role()
RETURNS public.user_role
LANGUAGE sql
STABLE
SECURITY DEFINER
SET search_path = public
AS $$
  SELECT role FROM public.users WHERE id = auth.uid();
$$;

CREATE OR REPLACE FUNCTION public.is_admin()
RETURNS BOOLEAN
LANGUAGE sql
STABLE
SECURITY DEFINER
SET search_path = public
AS $$
  SELECT EXISTS (
    SELECT 1 FROM public.users
    WHERE id = auth.uid() AND role = 'admin'
  );
$$;

CREATE OR REPLACE FUNCTION public.is_organizer_of(p_event_id UUID)
RETURNS BOOLEAN
LANGUAGE sql
STABLE
SECURITY DEFINER
SET search_path = public
AS $$
  SELECT EXISTS (
    SELECT 1 FROM public.events
    WHERE id = p_event_id AND organizer_id = auth.uid()
  )
  OR public.is_admin();
$$;

CREATE OR REPLACE FUNCTION public.is_volunteer_for(p_event_id UUID)
RETURNS BOOLEAN
LANGUAGE sql
STABLE
SECURITY DEFINER
SET search_path = public
AS $$
  SELECT EXISTS (
    SELECT 1 FROM public.event_volunteers
    WHERE event_id = p_event_id AND volunteer_id = auth.uid()
  )
  OR public.is_organizer_of(p_event_id);
$$;

CREATE OR REPLACE FUNCTION public.can_manage_attendance(p_event_id UUID)
RETURNS BOOLEAN
LANGUAGE sql
STABLE
SECURITY DEFINER
SET search_path = public
AS $$
  SELECT
    public.is_admin()
    OR public.is_organizer_of(p_event_id)
    OR EXISTS (
      SELECT 1 FROM public.event_volunteers
      WHERE event_id = p_event_id AND volunteer_id = auth.uid()
    )
    OR EXISTS (
      SELECT 1 FROM public.users
      WHERE id = auth.uid() AND role IN ('volunteer', 'organizer', 'admin')
    );
$$;

-- =============================================================================
-- AUTO-CREATE user profile on signup
-- =============================================================================

CREATE OR REPLACE FUNCTION public.handle_new_user()
RETURNS TRIGGER
LANGUAGE plpgsql
SECURITY DEFINER
SET search_path = public
AS $$
DECLARE
  v_role public.user_role;
BEGIN
  v_role := COALESCE(
    (NEW.raw_user_meta_data ->> 'role')::public.user_role,
    'participant'
  );

  INSERT INTO public.users (id, email, full_name, usn, branch, phone, role)
  VALUES (
    NEW.id,
    NEW.email,
    COALESCE(NEW.raw_user_meta_data ->> 'full_name', split_part(NEW.email, '@', 1)),
    NEW.raw_user_meta_data ->> 'usn',
    NEW.raw_user_meta_data ->> 'branch',
    NEW.raw_user_meta_data ->> 'phone',
    v_role
  );

  RETURN NEW;
END;
$$;

CREATE TRIGGER on_auth_user_created
  AFTER INSERT ON auth.users
  FOR EACH ROW
  EXECUTE FUNCTION public.handle_new_user();

-- =============================================================================
-- Keep registration status in sync when attendance is recorded
-- =============================================================================

CREATE OR REPLACE FUNCTION public.sync_registration_on_attendance()
RETURNS TRIGGER
LANGUAGE plpgsql
SECURITY DEFINER
SET search_path = public
AS $$
BEGIN
  UPDATE public.registrations
  SET status = 'checked_in'
  WHERE id = NEW.registration_id
    AND status = 'registered';

  RETURN NEW;
END;
$$;

CREATE TRIGGER attendance_sync_registration
  AFTER INSERT ON public.attendance
  FOR EACH ROW
  EXECUTE FUNCTION public.sync_registration_on_attendance();

-- =============================================================================
-- RPC: Lookup registration by QR token (volunteer scanner)
-- Returns participant + event info — NOT stored in the QR itself
-- =============================================================================

CREATE OR REPLACE FUNCTION public.lookup_registration_by_qr(p_qr_token TEXT)
RETURNS TABLE (
  registration_id UUID,
  qr_token TEXT,
  registration_status public.registration_status,
  event JSONB,
  participant JSONB,
  attendance JSONB
)
LANGUAGE plpgsql
STABLE
SECURITY DEFINER
SET search_path = public
AS $$
BEGIN
  IF auth.uid() IS NULL THEN
    RAISE EXCEPTION 'Authentication required';
  END IF;

  IF NOT (
    public.is_admin()
    OR EXISTS (
      SELECT 1 FROM public.users
      WHERE id = auth.uid() AND role IN ('volunteer', 'organizer', 'admin')
    )
  ) THEN
    RAISE EXCEPTION 'Insufficient permissions to scan QR codes';
  END IF;

  RETURN QUERY
  SELECT
    r.id AS registration_id,
    r.qr_token,
    r.status AS registration_status,
    jsonb_build_object(
      'id', e.id,
      'title', e.title,
      'start_time', e.start_time,
      'end_time', e.end_time,
      'location', e.location
    ) AS event,
    jsonb_build_object(
      'id', u.id,
      'full_name', u.full_name,
      'usn', u.usn,
      'email', u.email,
      'branch', u.branch,
      'avatar_url', u.avatar_url
    ) AS participant,
    CASE
      WHEN a.id IS NULL THEN NULL
      ELSE jsonb_build_object(
        'id', a.id,
        'checked_in_at', a.checked_in_at,
        'method', a.method
      )
    END AS attendance
  FROM public.registrations r
  JOIN public.events e ON e.id = r.event_id
  JOIN public.users u ON u.id = r.participant_id
  LEFT JOIN public.attendance a ON a.registration_id = r.id
  WHERE r.qr_token = p_qr_token
    AND r.status <> 'cancelled';
END;
$$;

-- =============================================================================
-- RPC: Mark attendance from QR token (prevents duplicates via UNIQUE constraint)
-- =============================================================================

CREATE OR REPLACE FUNCTION public.mark_attendance(
  p_qr_token TEXT,
  p_method public.attendance_method DEFAULT 'qr_scan'
)
RETURNS public.attendance
LANGUAGE plpgsql
SECURITY DEFINER
SET search_path = public
AS $$
DECLARE
  v_reg public.registrations%ROWTYPE;
  v_row public.attendance%ROWTYPE;
BEGIN
  IF auth.uid() IS NULL THEN
    RAISE EXCEPTION 'Authentication required';
  END IF;

  SELECT * INTO v_reg
  FROM public.registrations
  WHERE qr_token = p_qr_token
    AND status <> 'cancelled';

  IF NOT FOUND THEN
    RAISE EXCEPTION 'Invalid or cancelled registration QR';
  END IF;

  IF NOT public.can_manage_attendance(v_reg.event_id) THEN
    RAISE EXCEPTION 'Insufficient permissions to mark attendance';
  END IF;

  IF EXISTS (
    SELECT 1 FROM public.attendance WHERE registration_id = v_reg.id
  ) THEN
    RAISE EXCEPTION 'Duplicate check-in: attendance already recorded';
  END IF;

  INSERT INTO public.attendance (
    registration_id,
    event_id,
    participant_id,
    checked_in_by,
    method
  )
  VALUES (
    v_reg.id,
    v_reg.event_id,
    v_reg.participant_id,
    auth.uid(),
    p_method
  )
  RETURNING * INTO v_row;

  RETURN v_row;
END;
$$;

-- =============================================================================
-- ROW LEVEL SECURITY
-- =============================================================================

ALTER TABLE public.users ENABLE ROW LEVEL SECURITY;
ALTER TABLE public.events ENABLE ROW LEVEL SECURITY;
ALTER TABLE public.registrations ENABLE ROW LEVEL SECURITY;
ALTER TABLE public.attendance ENABLE ROW LEVEL SECURITY;
ALTER TABLE public.certificates ENABLE ROW LEVEL SECURITY;
ALTER TABLE public.notifications ENABLE ROW LEVEL SECURITY;
ALTER TABLE public.event_volunteers ENABLE ROW LEVEL SECURITY;

-- ----- users -----

CREATE POLICY "users_select_own_or_staff"
  ON public.users FOR SELECT
  TO authenticated
  USING (
    id = auth.uid()
    OR public.is_admin()
    OR public.current_user_role() IN ('organizer', 'volunteer')
  );

CREATE POLICY "users_insert_own"
  ON public.users FOR INSERT
  TO authenticated
  WITH CHECK (id = auth.uid());

CREATE POLICY "users_update_own_or_admin"
  ON public.users FOR UPDATE
  TO authenticated
  USING (id = auth.uid() OR public.is_admin())
  WITH CHECK (id = auth.uid() OR public.is_admin());

-- ----- events -----

CREATE POLICY "events_select_published_or_related"
  ON public.events FOR SELECT
  TO authenticated
  USING (
    status IN ('published', 'ongoing', 'completed')
    OR organizer_id = auth.uid()
    OR public.is_admin()
    OR public.is_volunteer_for(id)
  );

CREATE POLICY "events_select_published_anon"
  ON public.events FOR SELECT
  TO anon
  USING (status IN ('published', 'ongoing', 'completed'));

CREATE POLICY "events_insert_organizer"
  ON public.events FOR INSERT
  TO authenticated
  WITH CHECK (
    organizer_id = auth.uid()
    AND public.current_user_role() IN ('organizer', 'admin')
  );

CREATE POLICY "events_update_own_or_admin"
  ON public.events FOR UPDATE
  TO authenticated
  USING (organizer_id = auth.uid() OR public.is_admin())
  WITH CHECK (organizer_id = auth.uid() OR public.is_admin());

CREATE POLICY "events_delete_own_or_admin"
  ON public.events FOR DELETE
  TO authenticated
  USING (organizer_id = auth.uid() OR public.is_admin());

-- ----- registrations -----

CREATE POLICY "registrations_select_own_or_staff"
  ON public.registrations FOR SELECT
  TO authenticated
  USING (
    participant_id = auth.uid()
    OR public.is_organizer_of(event_id)
    OR public.can_manage_attendance(event_id)
  );

CREATE POLICY "registrations_insert_own"
  ON public.registrations FOR INSERT
  TO authenticated
  WITH CHECK (
    participant_id = auth.uid()
    AND EXISTS (
      SELECT 1 FROM public.events e
      WHERE e.id = event_id
        AND e.is_registration_open = TRUE
        AND e.status IN ('published', 'ongoing')
    )
  );

CREATE POLICY "registrations_update_own_or_organizer"
  ON public.registrations FOR UPDATE
  TO authenticated
  USING (
    participant_id = auth.uid()
    OR public.is_organizer_of(event_id)
    OR public.is_admin()
  )
  WITH CHECK (
    participant_id = auth.uid()
    OR public.is_organizer_of(event_id)
    OR public.is_admin()
  );

-- ----- attendance -----

CREATE POLICY "attendance_select_related"
  ON public.attendance FOR SELECT
  TO authenticated
  USING (
    participant_id = auth.uid()
    OR public.is_organizer_of(event_id)
    OR public.can_manage_attendance(event_id)
  );

CREATE POLICY "attendance_insert_staff"
  ON public.attendance FOR INSERT
  TO authenticated
  WITH CHECK (public.can_manage_attendance(event_id));

-- No UPDATE/DELETE for attendance — check-ins are immutable (prevents tampering)

-- ----- certificates -----

CREATE POLICY "certificates_select_own_or_organizer"
  ON public.certificates FOR SELECT
  TO authenticated
  USING (
    participant_id = auth.uid()
    OR public.is_organizer_of(event_id)
    OR public.is_admin()
  );

CREATE POLICY "certificates_insert_organizer"
  ON public.certificates FOR INSERT
  TO authenticated
  WITH CHECK (
    public.is_organizer_of(event_id) OR public.is_admin()
  );

CREATE POLICY "certificates_update_organizer"
  ON public.certificates FOR UPDATE
  TO authenticated
  USING (public.is_organizer_of(event_id) OR public.is_admin())
  WITH CHECK (public.is_organizer_of(event_id) OR public.is_admin());

-- ----- notifications -----

CREATE POLICY "notifications_select_own"
  ON public.notifications FOR SELECT
  TO authenticated
  USING (user_id = auth.uid() OR public.is_admin());

CREATE POLICY "notifications_update_own"
  ON public.notifications FOR UPDATE
  TO authenticated
  USING (user_id = auth.uid())
  WITH CHECK (user_id = auth.uid());

CREATE POLICY "notifications_insert_authenticated"
  ON public.notifications FOR INSERT
  TO authenticated
  WITH CHECK (
    public.is_admin()
    OR public.current_user_role() IN ('organizer', 'admin')
    OR user_id = auth.uid()
  );

CREATE POLICY "notifications_delete_own"
  ON public.notifications FOR DELETE
  TO authenticated
  USING (user_id = auth.uid() OR public.is_admin());

-- ----- event_volunteers -----

CREATE POLICY "event_volunteers_select_related"
  ON public.event_volunteers FOR SELECT
  TO authenticated
  USING (
    volunteer_id = auth.uid()
    OR public.is_organizer_of(event_id)
    OR public.is_admin()
  );

CREATE POLICY "event_volunteers_insert_organizer"
  ON public.event_volunteers FOR INSERT
  TO authenticated
  WITH CHECK (public.is_organizer_of(event_id) OR public.is_admin());

CREATE POLICY "event_volunteers_delete_organizer"
  ON public.event_volunteers FOR DELETE
  TO authenticated
  USING (public.is_organizer_of(event_id) OR public.is_admin());

-- =============================================================================
-- STORAGE BUCKETS
-- =============================================================================

INSERT INTO storage.buckets (id, name, public, file_size_limit, allowed_mime_types)
VALUES
  (
    'avatars',
    'avatars',
    TRUE,
    2097152,
    ARRAY['image/jpeg', 'image/png', 'image/webp']
  ),
  (
    'event-covers',
    'event-covers',
    TRUE,
    5242880,
    ARRAY['image/jpeg', 'image/png', 'image/webp']
  ),
  (
    'certificates',
    'certificates',
    FALSE,
    10485760,
    ARRAY['application/pdf', 'image/png', 'image/jpeg']
  )
ON CONFLICT (id) DO NOTHING;

-- Avatars: users manage own folder
CREATE POLICY "avatars_public_read"
  ON storage.objects FOR SELECT
  TO public
  USING (bucket_id = 'avatars');

CREATE POLICY "avatars_owner_upload"
  ON storage.objects FOR INSERT
  TO authenticated
  WITH CHECK (
    bucket_id = 'avatars'
    AND (storage.foldername(name))[1] = auth.uid()::text
  );

CREATE POLICY "avatars_owner_update"
  ON storage.objects FOR UPDATE
  TO authenticated
  USING (
    bucket_id = 'avatars'
    AND (storage.foldername(name))[1] = auth.uid()::text
  );

CREATE POLICY "avatars_owner_delete"
  ON storage.objects FOR DELETE
  TO authenticated
  USING (
    bucket_id = 'avatars'
    AND (storage.foldername(name))[1] = auth.uid()::text
  );

-- Event covers: public read, organizers write
CREATE POLICY "event_covers_public_read"
  ON storage.objects FOR SELECT
  TO public
  USING (bucket_id = 'event-covers');

CREATE POLICY "event_covers_organizer_upload"
  ON storage.objects FOR INSERT
  TO authenticated
  WITH CHECK (
    bucket_id = 'event-covers'
    AND public.current_user_role() IN ('organizer', 'admin')
  );

CREATE POLICY "event_covers_organizer_update"
  ON storage.objects FOR UPDATE
  TO authenticated
  USING (
    bucket_id = 'event-covers'
    AND public.current_user_role() IN ('organizer', 'admin')
  );

CREATE POLICY "event_covers_organizer_delete"
  ON storage.objects FOR DELETE
  TO authenticated
  USING (
    bucket_id = 'event-covers'
    AND public.current_user_role() IN ('organizer', 'admin')
  );

-- Certificates: owner or organizer can read
CREATE POLICY "certificates_storage_select"
  ON storage.objects FOR SELECT
  TO authenticated
  USING (
    bucket_id = 'certificates'
    AND (
      (storage.foldername(name))[1] = auth.uid()::text
      OR public.current_user_role() IN ('organizer', 'admin')
    )
  );

CREATE POLICY "certificates_storage_insert"
  ON storage.objects FOR INSERT
  TO authenticated
  WITH CHECK (
    bucket_id = 'certificates'
    AND public.current_user_role() IN ('organizer', 'admin')
  );

-- =============================================================================
-- REALTIME
-- =============================================================================

ALTER PUBLICATION supabase_realtime ADD TABLE public.attendance;
ALTER PUBLICATION supabase_realtime ADD TABLE public.registrations;
ALTER PUBLICATION supabase_realtime ADD TABLE public.notifications;
ALTER PUBLICATION supabase_realtime ADD TABLE public.events;

-- =============================================================================
-- GRANTS
-- =============================================================================

GRANT USAGE ON SCHEMA public TO anon, authenticated;
GRANT ALL ON ALL TABLES IN SCHEMA public TO authenticated;
GRANT SELECT ON ALL TABLES IN SCHEMA public TO anon;
GRANT EXECUTE ON ALL FUNCTIONS IN SCHEMA public TO authenticated;
GRANT USAGE ON ALL SEQUENCES IN SCHEMA public TO authenticated;
