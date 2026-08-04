-- =============================================================================
-- EventTrack - Seed Data imported from EventTrack_Demo_Data.xlsx
-- All users default password: 12345678
-- =============================================================================
CREATE EXTENSION IF NOT EXISTS pgcrypto;

-- Delete existing demo records to prevent duplicate key conflicts
DELETE FROM auth.users WHERE email IN ('organizer1@eventtrack.com', 'organizer2@eventtrack.com', 'organizer3@eventtrack.com', 'organizer4@eventtrack.com', 'organizer5@eventtrack.com', 'volunteer1@eventtrack.com', 'volunteer2@eventtrack.com', 'volunteer3@eventtrack.com', 'volunteer4@eventtrack.com', 'volunteer5@eventtrack.com', 'user1@gmail.com', 'user2@gmail.com', 'user3@gmail.com', 'user4@gmail.com', 'user5@gmail.com', 'user6@gmail.com', 'user7@gmail.com', 'user8@gmail.com', 'user9@gmail.com', 'user10@gmail.com', 'user11@gmail.com', 'user12@gmail.com', 'user13@gmail.com', 'user14@gmail.com', 'user15@gmail.com', 'user16@gmail.com', 'user17@gmail.com', 'user18@gmail.com', 'user19@gmail.com', 'user20@gmail.com', 'user21@gmail.com', 'user22@gmail.com', 'user23@gmail.com', 'user24@gmail.com', 'user25@gmail.com', 'user26@gmail.com', 'user27@gmail.com', 'user28@gmail.com', 'user29@gmail.com', 'user30@gmail.com', 'user31@gmail.com', 'user32@gmail.com', 'user33@gmail.com', 'user34@gmail.com', 'user35@gmail.com', 'user36@gmail.com', 'user37@gmail.com', 'user38@gmail.com', 'user39@gmail.com', 'user40@gmail.com', 'user41@gmail.com', 'user42@gmail.com', 'user43@gmail.com', 'user44@gmail.com', 'user45@gmail.com', 'user46@gmail.com', 'user47@gmail.com', 'user48@gmail.com', 'user49@gmail.com', 'user50@gmail.com', 'user51@gmail.com', 'user52@gmail.com', 'user53@gmail.com', 'user54@gmail.com', 'user55@gmail.com', 'user56@gmail.com', 'user57@gmail.com', 'user58@gmail.com', 'user59@gmail.com', 'user60@gmail.com', 'user61@gmail.com', 'user62@gmail.com', 'user63@gmail.com', 'user64@gmail.com', 'user65@gmail.com', 'user66@gmail.com', 'user67@gmail.com', 'user68@gmail.com', 'user69@gmail.com', 'user70@gmail.com', 'user71@gmail.com', 'user72@gmail.com', 'user73@gmail.com', 'user74@gmail.com', 'user75@gmail.com', 'user76@gmail.com', 'user77@gmail.com', 'user78@gmail.com', 'user79@gmail.com', 'user80@gmail.com', 'user81@gmail.com', 'user82@gmail.com', 'user83@gmail.com', 'user84@gmail.com', 'user85@gmail.com', 'user86@gmail.com', 'user87@gmail.com', 'user88@gmail.com', 'user89@gmail.com', 'user90@gmail.com', 'user91@gmail.com', 'user92@gmail.com', 'user93@gmail.com', 'user94@gmail.com', 'user95@gmail.com', 'user96@gmail.com', 'user97@gmail.com', 'user98@gmail.com', 'user99@gmail.com', 'user100@gmail.com');
DELETE FROM public.users WHERE email IN ('organizer1@eventtrack.com', 'organizer2@eventtrack.com', 'organizer3@eventtrack.com', 'organizer4@eventtrack.com', 'organizer5@eventtrack.com', 'volunteer1@eventtrack.com', 'volunteer2@eventtrack.com', 'volunteer3@eventtrack.com', 'volunteer4@eventtrack.com', 'volunteer5@eventtrack.com', 'user1@gmail.com', 'user2@gmail.com', 'user3@gmail.com', 'user4@gmail.com', 'user5@gmail.com', 'user6@gmail.com', 'user7@gmail.com', 'user8@gmail.com', 'user9@gmail.com', 'user10@gmail.com', 'user11@gmail.com', 'user12@gmail.com', 'user13@gmail.com', 'user14@gmail.com', 'user15@gmail.com', 'user16@gmail.com', 'user17@gmail.com', 'user18@gmail.com', 'user19@gmail.com', 'user20@gmail.com', 'user21@gmail.com', 'user22@gmail.com', 'user23@gmail.com', 'user24@gmail.com', 'user25@gmail.com', 'user26@gmail.com', 'user27@gmail.com', 'user28@gmail.com', 'user29@gmail.com', 'user30@gmail.com', 'user31@gmail.com', 'user32@gmail.com', 'user33@gmail.com', 'user34@gmail.com', 'user35@gmail.com', 'user36@gmail.com', 'user37@gmail.com', 'user38@gmail.com', 'user39@gmail.com', 'user40@gmail.com', 'user41@gmail.com', 'user42@gmail.com', 'user43@gmail.com', 'user44@gmail.com', 'user45@gmail.com', 'user46@gmail.com', 'user47@gmail.com', 'user48@gmail.com', 'user49@gmail.com', 'user50@gmail.com', 'user51@gmail.com', 'user52@gmail.com', 'user53@gmail.com', 'user54@gmail.com', 'user55@gmail.com', 'user56@gmail.com', 'user57@gmail.com', 'user58@gmail.com', 'user59@gmail.com', 'user60@gmail.com', 'user61@gmail.com', 'user62@gmail.com', 'user63@gmail.com', 'user64@gmail.com', 'user65@gmail.com', 'user66@gmail.com', 'user67@gmail.com', 'user68@gmail.com', 'user69@gmail.com', 'user70@gmail.com', 'user71@gmail.com', 'user72@gmail.com', 'user73@gmail.com', 'user74@gmail.com', 'user75@gmail.com', 'user76@gmail.com', 'user77@gmail.com', 'user78@gmail.com', 'user79@gmail.com', 'user80@gmail.com', 'user81@gmail.com', 'user82@gmail.com', 'user83@gmail.com', 'user84@gmail.com', 'user85@gmail.com', 'user86@gmail.com', 'user87@gmail.com', 'user88@gmail.com', 'user89@gmail.com', 'user90@gmail.com', 'user91@gmail.com', 'user92@gmail.com', 'user93@gmail.com', 'user94@gmail.com', 'user95@gmail.com', 'user96@gmail.com', 'user97@gmail.com', 'user98@gmail.com', 'user99@gmail.com', 'user100@gmail.com');


INSERT INTO auth.users (
  id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, updated_at, role, aud
) VALUES (
  '00000000-0000-4000-8000-100000000001',
  '00000000-0000-0000-0000-000000000000',
  'organizer1@eventtrack.com',
  crypt('12345678', gen_salt('bf')),
  now(),
  '{"provider":"email","providers":["email"]}',
  '{"full_name": "Organizer 1", "role": "organizer", "usn": null, "branch": null, "phone": null}',
  now(),
  now(),
  'authenticated',
  'authenticated'
) ON CONFLICT (id) DO UPDATE SET encrypted_password = crypt('12345678', gen_salt('bf'));

INSERT INTO public.users (
  id, email, full_name, usn, branch, phone, role
) VALUES (
  '00000000-0000-4000-8000-100000000001',
  'organizer1@eventtrack.com',
  'Organizer 1',
  NULL,
  NULL,
  NULL,
  'organizer'
) ON CONFLICT (id) DO UPDATE SET
  full_name = EXCLUDED.full_name,
  usn = EXCLUDED.usn,
  branch = EXCLUDED.branch,
  role = EXCLUDED.role;


INSERT INTO auth.users (
  id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, updated_at, role, aud
) VALUES (
  '00000000-0000-4000-8000-100000000002',
  '00000000-0000-0000-0000-000000000000',
  'organizer2@eventtrack.com',
  crypt('12345678', gen_salt('bf')),
  now(),
  '{"provider":"email","providers":["email"]}',
  '{"full_name": "Organizer 2", "role": "organizer", "usn": null, "branch": null, "phone": null}',
  now(),
  now(),
  'authenticated',
  'authenticated'
) ON CONFLICT (id) DO UPDATE SET encrypted_password = crypt('12345678', gen_salt('bf'));

INSERT INTO public.users (
  id, email, full_name, usn, branch, phone, role
) VALUES (
  '00000000-0000-4000-8000-100000000002',
  'organizer2@eventtrack.com',
  'Organizer 2',
  NULL,
  NULL,
  NULL,
  'organizer'
) ON CONFLICT (id) DO UPDATE SET
  full_name = EXCLUDED.full_name,
  usn = EXCLUDED.usn,
  branch = EXCLUDED.branch,
  role = EXCLUDED.role;


INSERT INTO auth.users (
  id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, updated_at, role, aud
) VALUES (
  '00000000-0000-4000-8000-100000000003',
  '00000000-0000-0000-0000-000000000000',
  'organizer3@eventtrack.com',
  crypt('12345678', gen_salt('bf')),
  now(),
  '{"provider":"email","providers":["email"]}',
  '{"full_name": "Organizer 3", "role": "organizer", "usn": null, "branch": null, "phone": null}',
  now(),
  now(),
  'authenticated',
  'authenticated'
) ON CONFLICT (id) DO UPDATE SET encrypted_password = crypt('12345678', gen_salt('bf'));

INSERT INTO public.users (
  id, email, full_name, usn, branch, phone, role
) VALUES (
  '00000000-0000-4000-8000-100000000003',
  'organizer3@eventtrack.com',
  'Organizer 3',
  NULL,
  NULL,
  NULL,
  'organizer'
) ON CONFLICT (id) DO UPDATE SET
  full_name = EXCLUDED.full_name,
  usn = EXCLUDED.usn,
  branch = EXCLUDED.branch,
  role = EXCLUDED.role;


INSERT INTO auth.users (
  id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, updated_at, role, aud
) VALUES (
  '00000000-0000-4000-8000-100000000004',
  '00000000-0000-0000-0000-000000000000',
  'organizer4@eventtrack.com',
  crypt('12345678', gen_salt('bf')),
  now(),
  '{"provider":"email","providers":["email"]}',
  '{"full_name": "Organizer 4", "role": "organizer", "usn": null, "branch": null, "phone": null}',
  now(),
  now(),
  'authenticated',
  'authenticated'
) ON CONFLICT (id) DO UPDATE SET encrypted_password = crypt('12345678', gen_salt('bf'));

INSERT INTO public.users (
  id, email, full_name, usn, branch, phone, role
) VALUES (
  '00000000-0000-4000-8000-100000000004',
  'organizer4@eventtrack.com',
  'Organizer 4',
  NULL,
  NULL,
  NULL,
  'organizer'
) ON CONFLICT (id) DO UPDATE SET
  full_name = EXCLUDED.full_name,
  usn = EXCLUDED.usn,
  branch = EXCLUDED.branch,
  role = EXCLUDED.role;


INSERT INTO auth.users (
  id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, updated_at, role, aud
) VALUES (
  '00000000-0000-4000-8000-100000000005',
  '00000000-0000-0000-0000-000000000000',
  'organizer5@eventtrack.com',
  crypt('12345678', gen_salt('bf')),
  now(),
  '{"provider":"email","providers":["email"]}',
  '{"full_name": "Organizer 5", "role": "organizer", "usn": null, "branch": null, "phone": null}',
  now(),
  now(),
  'authenticated',
  'authenticated'
) ON CONFLICT (id) DO UPDATE SET encrypted_password = crypt('12345678', gen_salt('bf'));

INSERT INTO public.users (
  id, email, full_name, usn, branch, phone, role
) VALUES (
  '00000000-0000-4000-8000-100000000005',
  'organizer5@eventtrack.com',
  'Organizer 5',
  NULL,
  NULL,
  NULL,
  'organizer'
) ON CONFLICT (id) DO UPDATE SET
  full_name = EXCLUDED.full_name,
  usn = EXCLUDED.usn,
  branch = EXCLUDED.branch,
  role = EXCLUDED.role;


INSERT INTO auth.users (
  id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, updated_at, role, aud
) VALUES (
  '00000000-0000-4000-8000-200000000001',
  '00000000-0000-0000-0000-000000000000',
  'volunteer1@eventtrack.com',
  crypt('12345678', gen_salt('bf')),
  now(),
  '{"provider":"email","providers":["email"]}',
  '{"full_name": "Volunteer 1", "role": "volunteer", "usn": null, "branch": null, "phone": null}',
  now(),
  now(),
  'authenticated',
  'authenticated'
) ON CONFLICT (id) DO UPDATE SET encrypted_password = crypt('12345678', gen_salt('bf'));

INSERT INTO public.users (
  id, email, full_name, usn, branch, phone, role
) VALUES (
  '00000000-0000-4000-8000-200000000001',
  'volunteer1@eventtrack.com',
  'Volunteer 1',
  NULL,
  NULL,
  NULL,
  'volunteer'
) ON CONFLICT (id) DO UPDATE SET
  full_name = EXCLUDED.full_name,
  usn = EXCLUDED.usn,
  branch = EXCLUDED.branch,
  role = EXCLUDED.role;


INSERT INTO auth.users (
  id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, updated_at, role, aud
) VALUES (
  '00000000-0000-4000-8000-200000000002',
  '00000000-0000-0000-0000-000000000000',
  'volunteer2@eventtrack.com',
  crypt('12345678', gen_salt('bf')),
  now(),
  '{"provider":"email","providers":["email"]}',
  '{"full_name": "Volunteer 2", "role": "volunteer", "usn": null, "branch": null, "phone": null}',
  now(),
  now(),
  'authenticated',
  'authenticated'
) ON CONFLICT (id) DO UPDATE SET encrypted_password = crypt('12345678', gen_salt('bf'));

INSERT INTO public.users (
  id, email, full_name, usn, branch, phone, role
) VALUES (
  '00000000-0000-4000-8000-200000000002',
  'volunteer2@eventtrack.com',
  'Volunteer 2',
  NULL,
  NULL,
  NULL,
  'volunteer'
) ON CONFLICT (id) DO UPDATE SET
  full_name = EXCLUDED.full_name,
  usn = EXCLUDED.usn,
  branch = EXCLUDED.branch,
  role = EXCLUDED.role;


INSERT INTO auth.users (
  id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, updated_at, role, aud
) VALUES (
  '00000000-0000-4000-8000-200000000003',
  '00000000-0000-0000-0000-000000000000',
  'volunteer3@eventtrack.com',
  crypt('12345678', gen_salt('bf')),
  now(),
  '{"provider":"email","providers":["email"]}',
  '{"full_name": "Volunteer 3", "role": "volunteer", "usn": null, "branch": null, "phone": null}',
  now(),
  now(),
  'authenticated',
  'authenticated'
) ON CONFLICT (id) DO UPDATE SET encrypted_password = crypt('12345678', gen_salt('bf'));

INSERT INTO public.users (
  id, email, full_name, usn, branch, phone, role
) VALUES (
  '00000000-0000-4000-8000-200000000003',
  'volunteer3@eventtrack.com',
  'Volunteer 3',
  NULL,
  NULL,
  NULL,
  'volunteer'
) ON CONFLICT (id) DO UPDATE SET
  full_name = EXCLUDED.full_name,
  usn = EXCLUDED.usn,
  branch = EXCLUDED.branch,
  role = EXCLUDED.role;


INSERT INTO auth.users (
  id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, updated_at, role, aud
) VALUES (
  '00000000-0000-4000-8000-200000000004',
  '00000000-0000-0000-0000-000000000000',
  'volunteer4@eventtrack.com',
  crypt('12345678', gen_salt('bf')),
  now(),
  '{"provider":"email","providers":["email"]}',
  '{"full_name": "Volunteer 4", "role": "volunteer", "usn": null, "branch": null, "phone": null}',
  now(),
  now(),
  'authenticated',
  'authenticated'
) ON CONFLICT (id) DO UPDATE SET encrypted_password = crypt('12345678', gen_salt('bf'));

INSERT INTO public.users (
  id, email, full_name, usn, branch, phone, role
) VALUES (
  '00000000-0000-4000-8000-200000000004',
  'volunteer4@eventtrack.com',
  'Volunteer 4',
  NULL,
  NULL,
  NULL,
  'volunteer'
) ON CONFLICT (id) DO UPDATE SET
  full_name = EXCLUDED.full_name,
  usn = EXCLUDED.usn,
  branch = EXCLUDED.branch,
  role = EXCLUDED.role;


INSERT INTO auth.users (
  id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, updated_at, role, aud
) VALUES (
  '00000000-0000-4000-8000-200000000005',
  '00000000-0000-0000-0000-000000000000',
  'volunteer5@eventtrack.com',
  crypt('12345678', gen_salt('bf')),
  now(),
  '{"provider":"email","providers":["email"]}',
  '{"full_name": "Volunteer 5", "role": "volunteer", "usn": null, "branch": null, "phone": null}',
  now(),
  now(),
  'authenticated',
  'authenticated'
) ON CONFLICT (id) DO UPDATE SET encrypted_password = crypt('12345678', gen_salt('bf'));

INSERT INTO public.users (
  id, email, full_name, usn, branch, phone, role
) VALUES (
  '00000000-0000-4000-8000-200000000005',
  'volunteer5@eventtrack.com',
  'Volunteer 5',
  NULL,
  NULL,
  NULL,
  'volunteer'
) ON CONFLICT (id) DO UPDATE SET
  full_name = EXCLUDED.full_name,
  usn = EXCLUDED.usn,
  branch = EXCLUDED.branch,
  role = EXCLUDED.role;


INSERT INTO auth.users (
  id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, updated_at, role, aud
) VALUES (
  '00000000-0000-4000-8000-300000000001',
  '00000000-0000-0000-0000-000000000000',
  'user1@gmail.com',
  crypt('12345678', gen_salt('bf')),
  now(),
  '{"provider":"email","providers":["email"]}',
  '{"full_name": "Deepak Nair", "role": "participant", "usn": "4SC24CS001", "branch": "CSE", "phone": "9479751964"}',
  now(),
  now(),
  'authenticated',
  'authenticated'
) ON CONFLICT (id) DO UPDATE SET encrypted_password = crypt('12345678', gen_salt('bf'));

INSERT INTO public.users (
  id, email, full_name, usn, branch, phone, role
) VALUES (
  '00000000-0000-4000-8000-300000000001',
  'user1@gmail.com',
  'Deepak Nair',
  '4SC24CS001',
  'CSE',
  '9479751964',
  'participant'
) ON CONFLICT (id) DO UPDATE SET
  full_name = EXCLUDED.full_name,
  usn = EXCLUDED.usn,
  branch = EXCLUDED.branch,
  role = EXCLUDED.role;


INSERT INTO auth.users (
  id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, updated_at, role, aud
) VALUES (
  '00000000-0000-4000-8000-300000000002',
  '00000000-0000-0000-0000-000000000000',
  'user2@gmail.com',
  crypt('12345678', gen_salt('bf')),
  now(),
  '{"provider":"email","providers":["email"]}',
  '{"full_name": "Pooja Rao", "role": "participant", "usn": "4SC24ME002", "branch": "ME", "phone": "9220880193"}',
  now(),
  now(),
  'authenticated',
  'authenticated'
) ON CONFLICT (id) DO UPDATE SET encrypted_password = crypt('12345678', gen_salt('bf'));

INSERT INTO public.users (
  id, email, full_name, usn, branch, phone, role
) VALUES (
  '00000000-0000-4000-8000-300000000002',
  'user2@gmail.com',
  'Pooja Rao',
  '4SC24ME002',
  'ME',
  '9220880193',
  'participant'
) ON CONFLICT (id) DO UPDATE SET
  full_name = EXCLUDED.full_name,
  usn = EXCLUDED.usn,
  branch = EXCLUDED.branch,
  role = EXCLUDED.role;


INSERT INTO auth.users (
  id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, updated_at, role, aud
) VALUES (
  '00000000-0000-4000-8000-300000000003',
  '00000000-0000-0000-0000-000000000000',
  'user3@gmail.com',
  crypt('12345678', gen_salt('bf')),
  now(),
  '{"provider":"email","providers":["email"]}',
  '{"full_name": "Keerthana Reddy", "role": "participant", "usn": "4SC24CS003", "branch": "CSE", "phone": "9545901321"}',
  now(),
  now(),
  'authenticated',
  'authenticated'
) ON CONFLICT (id) DO UPDATE SET encrypted_password = crypt('12345678', gen_salt('bf'));

INSERT INTO public.users (
  id, email, full_name, usn, branch, phone, role
) VALUES (
  '00000000-0000-4000-8000-300000000003',
  'user3@gmail.com',
  'Keerthana Reddy',
  '4SC24CS003',
  'CSE',
  '9545901321',
  'participant'
) ON CONFLICT (id) DO UPDATE SET
  full_name = EXCLUDED.full_name,
  usn = EXCLUDED.usn,
  branch = EXCLUDED.branch,
  role = EXCLUDED.role;


INSERT INTO auth.users (
  id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, updated_at, role, aud
) VALUES (
  '00000000-0000-4000-8000-300000000004',
  '00000000-0000-0000-0000-000000000000',
  'user4@gmail.com',
  crypt('12345678', gen_salt('bf')),
  now(),
  '{"provider":"email","providers":["email"]}',
  '{"full_name": "Varun Rao", "role": "participant", "usn": "4SC24CS004", "branch": "CSE", "phone": "9935749892"}',
  now(),
  now(),
  'authenticated',
  'authenticated'
) ON CONFLICT (id) DO UPDATE SET encrypted_password = crypt('12345678', gen_salt('bf'));

INSERT INTO public.users (
  id, email, full_name, usn, branch, phone, role
) VALUES (
  '00000000-0000-4000-8000-300000000004',
  'user4@gmail.com',
  'Varun Rao',
  '4SC24CS004',
  'CSE',
  '9935749892',
  'participant'
) ON CONFLICT (id) DO UPDATE SET
  full_name = EXCLUDED.full_name,
  usn = EXCLUDED.usn,
  branch = EXCLUDED.branch,
  role = EXCLUDED.role;


INSERT INTO auth.users (
  id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, updated_at, role, aud
) VALUES (
  '00000000-0000-4000-8000-300000000005',
  '00000000-0000-0000-0000-000000000000',
  'user5@gmail.com',
  crypt('12345678', gen_salt('bf')),
  now(),
  '{"provider":"email","providers":["email"]}',
  '{"full_name": "Sanjana Shetty", "role": "participant", "usn": "4SC24CS005", "branch": "CSE", "phone": "9938973372"}',
  now(),
  now(),
  'authenticated',
  'authenticated'
) ON CONFLICT (id) DO UPDATE SET encrypted_password = crypt('12345678', gen_salt('bf'));

INSERT INTO public.users (
  id, email, full_name, usn, branch, phone, role
) VALUES (
  '00000000-0000-4000-8000-300000000005',
  'user5@gmail.com',
  'Sanjana Shetty',
  '4SC24CS005',
  'CSE',
  '9938973372',
  'participant'
) ON CONFLICT (id) DO UPDATE SET
  full_name = EXCLUDED.full_name,
  usn = EXCLUDED.usn,
  branch = EXCLUDED.branch,
  role = EXCLUDED.role;


INSERT INTO auth.users (
  id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, updated_at, role, aud
) VALUES (
  '00000000-0000-4000-8000-300000000006',
  '00000000-0000-0000-0000-000000000000',
  'user6@gmail.com',
  crypt('12345678', gen_salt('bf')),
  now(),
  '{"provider":"email","providers":["email"]}',
  '{"full_name": "Akhil Naik", "role": "participant", "usn": "4SC24IS006", "branch": "ISE", "phone": "9571010482"}',
  now(),
  now(),
  'authenticated',
  'authenticated'
) ON CONFLICT (id) DO UPDATE SET encrypted_password = crypt('12345678', gen_salt('bf'));

INSERT INTO public.users (
  id, email, full_name, usn, branch, phone, role
) VALUES (
  '00000000-0000-4000-8000-300000000006',
  'user6@gmail.com',
  'Akhil Naik',
  '4SC24IS006',
  'ISE',
  '9571010482',
  'participant'
) ON CONFLICT (id) DO UPDATE SET
  full_name = EXCLUDED.full_name,
  usn = EXCLUDED.usn,
  branch = EXCLUDED.branch,
  role = EXCLUDED.role;


INSERT INTO auth.users (
  id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, updated_at, role, aud
) VALUES (
  '00000000-0000-4000-8000-300000000007',
  '00000000-0000-0000-0000-000000000000',
  'user7@gmail.com',
  crypt('12345678', gen_salt('bf')),
  now(),
  '{"provider":"email","providers":["email"]}',
  '{"full_name": "Kiran Naik", "role": "participant", "usn": "4SC24ME007", "branch": "ME", "phone": "9609866134"}',
  now(),
  now(),
  'authenticated',
  'authenticated'
) ON CONFLICT (id) DO UPDATE SET encrypted_password = crypt('12345678', gen_salt('bf'));

INSERT INTO public.users (
  id, email, full_name, usn, branch, phone, role
) VALUES (
  '00000000-0000-4000-8000-300000000007',
  'user7@gmail.com',
  'Kiran Naik',
  '4SC24ME007',
  'ME',
  '9609866134',
  'participant'
) ON CONFLICT (id) DO UPDATE SET
  full_name = EXCLUDED.full_name,
  usn = EXCLUDED.usn,
  branch = EXCLUDED.branch,
  role = EXCLUDED.role;


INSERT INTO auth.users (
  id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, updated_at, role, aud
) VALUES (
  '00000000-0000-4000-8000-300000000008',
  '00000000-0000-0000-0000-000000000000',
  'user8@gmail.com',
  crypt('12345678', gen_salt('bf')),
  now(),
  '{"provider":"email","providers":["email"]}',
  '{"full_name": "Megha Patil", "role": "participant", "usn": "4SC24CS008", "branch": "CSE", "phone": "9434118708"}',
  now(),
  now(),
  'authenticated',
  'authenticated'
) ON CONFLICT (id) DO UPDATE SET encrypted_password = crypt('12345678', gen_salt('bf'));

INSERT INTO public.users (
  id, email, full_name, usn, branch, phone, role
) VALUES (
  '00000000-0000-4000-8000-300000000008',
  'user8@gmail.com',
  'Megha Patil',
  '4SC24CS008',
  'CSE',
  '9434118708',
  'participant'
) ON CONFLICT (id) DO UPDATE SET
  full_name = EXCLUDED.full_name,
  usn = EXCLUDED.usn,
  branch = EXCLUDED.branch,
  role = EXCLUDED.role;


INSERT INTO auth.users (
  id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, updated_at, role, aud
) VALUES (
  '00000000-0000-4000-8000-300000000009',
  '00000000-0000-0000-0000-000000000000',
  'user9@gmail.com',
  crypt('12345678', gen_salt('bf')),
  now(),
  '{"provider":"email","providers":["email"]}',
  '{"full_name": "Varun Kulal", "role": "participant", "usn": "4SC24ME009", "branch": "ME", "phone": "9523962202"}',
  now(),
  now(),
  'authenticated',
  'authenticated'
) ON CONFLICT (id) DO UPDATE SET encrypted_password = crypt('12345678', gen_salt('bf'));

INSERT INTO public.users (
  id, email, full_name, usn, branch, phone, role
) VALUES (
  '00000000-0000-4000-8000-300000000009',
  'user9@gmail.com',
  'Varun Kulal',
  '4SC24ME009',
  'ME',
  '9523962202',
  'participant'
) ON CONFLICT (id) DO UPDATE SET
  full_name = EXCLUDED.full_name,
  usn = EXCLUDED.usn,
  branch = EXCLUDED.branch,
  role = EXCLUDED.role;


INSERT INTO auth.users (
  id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, updated_at, role, aud
) VALUES (
  '00000000-0000-4000-8000-300000000010',
  '00000000-0000-0000-0000-000000000000',
  'user10@gmail.com',
  crypt('12345678', gen_salt('bf')),
  now(),
  '{"provider":"email","providers":["email"]}',
  '{"full_name": "Rohan Rao", "role": "participant", "usn": "4SC24EC010", "branch": "ECE", "phone": "9879448233"}',
  now(),
  now(),
  'authenticated',
  'authenticated'
) ON CONFLICT (id) DO UPDATE SET encrypted_password = crypt('12345678', gen_salt('bf'));

INSERT INTO public.users (
  id, email, full_name, usn, branch, phone, role
) VALUES (
  '00000000-0000-4000-8000-300000000010',
  'user10@gmail.com',
  'Rohan Rao',
  '4SC24EC010',
  'ECE',
  '9879448233',
  'participant'
) ON CONFLICT (id) DO UPDATE SET
  full_name = EXCLUDED.full_name,
  usn = EXCLUDED.usn,
  branch = EXCLUDED.branch,
  role = EXCLUDED.role;


INSERT INTO auth.users (
  id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, updated_at, role, aud
) VALUES (
  '00000000-0000-4000-8000-300000000011',
  '00000000-0000-0000-0000-000000000000',
  'user11@gmail.com',
  crypt('12345678', gen_salt('bf')),
  now(),
  '{"provider":"email","providers":["email"]}',
  '{"full_name": "Harsha Patil", "role": "participant", "usn": "4SC24CS011", "branch": "CSE", "phone": "9891705517"}',
  now(),
  now(),
  'authenticated',
  'authenticated'
) ON CONFLICT (id) DO UPDATE SET encrypted_password = crypt('12345678', gen_salt('bf'));

INSERT INTO public.users (
  id, email, full_name, usn, branch, phone, role
) VALUES (
  '00000000-0000-4000-8000-300000000011',
  'user11@gmail.com',
  'Harsha Patil',
  '4SC24CS011',
  'CSE',
  '9891705517',
  'participant'
) ON CONFLICT (id) DO UPDATE SET
  full_name = EXCLUDED.full_name,
  usn = EXCLUDED.usn,
  branch = EXCLUDED.branch,
  role = EXCLUDED.role;


INSERT INTO auth.users (
  id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, updated_at, role, aud
) VALUES (
  '00000000-0000-4000-8000-300000000012',
  '00000000-0000-0000-0000-000000000000',
  'user12@gmail.com',
  crypt('12345678', gen_salt('bf')),
  now(),
  '{"provider":"email","providers":["email"]}',
  '{"full_name": "Megha Naik", "role": "participant", "usn": "4SC24IS012", "branch": "ISE", "phone": "9462288255"}',
  now(),
  now(),
  'authenticated',
  'authenticated'
) ON CONFLICT (id) DO UPDATE SET encrypted_password = crypt('12345678', gen_salt('bf'));

INSERT INTO public.users (
  id, email, full_name, usn, branch, phone, role
) VALUES (
  '00000000-0000-4000-8000-300000000012',
  'user12@gmail.com',
  'Megha Naik',
  '4SC24IS012',
  'ISE',
  '9462288255',
  'participant'
) ON CONFLICT (id) DO UPDATE SET
  full_name = EXCLUDED.full_name,
  usn = EXCLUDED.usn,
  branch = EXCLUDED.branch,
  role = EXCLUDED.role;


INSERT INTO auth.users (
  id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, updated_at, role, aud
) VALUES (
  '00000000-0000-4000-8000-300000000013',
  '00000000-0000-0000-0000-000000000000',
  'user13@gmail.com',
  crypt('12345678', gen_salt('bf')),
  now(),
  '{"provider":"email","providers":["email"]}',
  '{"full_name": "Keerthana Reddy", "role": "participant", "usn": "4SC24CS013", "branch": "CSE", "phone": "9808791980"}',
  now(),
  now(),
  'authenticated',
  'authenticated'
) ON CONFLICT (id) DO UPDATE SET encrypted_password = crypt('12345678', gen_salt('bf'));

INSERT INTO public.users (
  id, email, full_name, usn, branch, phone, role
) VALUES (
  '00000000-0000-4000-8000-300000000013',
  'user13@gmail.com',
  'Keerthana Reddy',
  '4SC24CS013',
  'CSE',
  '9808791980',
  'participant'
) ON CONFLICT (id) DO UPDATE SET
  full_name = EXCLUDED.full_name,
  usn = EXCLUDED.usn,
  branch = EXCLUDED.branch,
  role = EXCLUDED.role;


INSERT INTO auth.users (
  id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, updated_at, role, aud
) VALUES (
  '00000000-0000-4000-8000-300000000014',
  '00000000-0000-0000-0000-000000000000',
  'user14@gmail.com',
  crypt('12345678', gen_salt('bf')),
  now(),
  '{"provider":"email","providers":["email"]}',
  '{"full_name": "Nikhil Naik", "role": "participant", "usn": "4SC24CS014", "branch": "CSE", "phone": "9356843474"}',
  now(),
  now(),
  'authenticated',
  'authenticated'
) ON CONFLICT (id) DO UPDATE SET encrypted_password = crypt('12345678', gen_salt('bf'));

INSERT INTO public.users (
  id, email, full_name, usn, branch, phone, role
) VALUES (
  '00000000-0000-4000-8000-300000000014',
  'user14@gmail.com',
  'Nikhil Naik',
  '4SC24CS014',
  'CSE',
  '9356843474',
  'participant'
) ON CONFLICT (id) DO UPDATE SET
  full_name = EXCLUDED.full_name,
  usn = EXCLUDED.usn,
  branch = EXCLUDED.branch,
  role = EXCLUDED.role;


INSERT INTO auth.users (
  id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, updated_at, role, aud
) VALUES (
  '00000000-0000-4000-8000-300000000015',
  '00000000-0000-0000-0000-000000000000',
  'user15@gmail.com',
  crypt('12345678', gen_salt('bf')),
  now(),
  '{"provider":"email","providers":["email"]}',
  '{"full_name": "Priya Nair", "role": "participant", "usn": "4SC24CS015", "branch": "CSE", "phone": "9774438383"}',
  now(),
  now(),
  'authenticated',
  'authenticated'
) ON CONFLICT (id) DO UPDATE SET encrypted_password = crypt('12345678', gen_salt('bf'));

INSERT INTO public.users (
  id, email, full_name, usn, branch, phone, role
) VALUES (
  '00000000-0000-4000-8000-300000000015',
  'user15@gmail.com',
  'Priya Nair',
  '4SC24CS015',
  'CSE',
  '9774438383',
  'participant'
) ON CONFLICT (id) DO UPDATE SET
  full_name = EXCLUDED.full_name,
  usn = EXCLUDED.usn,
  branch = EXCLUDED.branch,
  role = EXCLUDED.role;


INSERT INTO auth.users (
  id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, updated_at, role, aud
) VALUES (
  '00000000-0000-4000-8000-300000000016',
  '00000000-0000-0000-0000-000000000000',
  'user16@gmail.com',
  crypt('12345678', gen_salt('bf')),
  now(),
  '{"provider":"email","providers":["email"]}',
  '{"full_name": "Sneha Bhat", "role": "participant", "usn": "4SC24AI016", "branch": "AIML", "phone": "9378590132"}',
  now(),
  now(),
  'authenticated',
  'authenticated'
) ON CONFLICT (id) DO UPDATE SET encrypted_password = crypt('12345678', gen_salt('bf'));

INSERT INTO public.users (
  id, email, full_name, usn, branch, phone, role
) VALUES (
  '00000000-0000-4000-8000-300000000016',
  'user16@gmail.com',
  'Sneha Bhat',
  '4SC24AI016',
  'AIML',
  '9378590132',
  'participant'
) ON CONFLICT (id) DO UPDATE SET
  full_name = EXCLUDED.full_name,
  usn = EXCLUDED.usn,
  branch = EXCLUDED.branch,
  role = EXCLUDED.role;


INSERT INTO auth.users (
  id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, updated_at, role, aud
) VALUES (
  '00000000-0000-4000-8000-300000000017',
  '00000000-0000-0000-0000-000000000000',
  'user17@gmail.com',
  crypt('12345678', gen_salt('bf')),
  now(),
  '{"provider":"email","providers":["email"]}',
  '{"full_name": "Harsha Patil", "role": "participant", "usn": "4SC24EC017", "branch": "ECE", "phone": "9668657474"}',
  now(),
  now(),
  'authenticated',
  'authenticated'
) ON CONFLICT (id) DO UPDATE SET encrypted_password = crypt('12345678', gen_salt('bf'));

INSERT INTO public.users (
  id, email, full_name, usn, branch, phone, role
) VALUES (
  '00000000-0000-4000-8000-300000000017',
  'user17@gmail.com',
  'Harsha Patil',
  '4SC24EC017',
  'ECE',
  '9668657474',
  'participant'
) ON CONFLICT (id) DO UPDATE SET
  full_name = EXCLUDED.full_name,
  usn = EXCLUDED.usn,
  branch = EXCLUDED.branch,
  role = EXCLUDED.role;


INSERT INTO auth.users (
  id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, updated_at, role, aud
) VALUES (
  '00000000-0000-4000-8000-300000000018',
  '00000000-0000-0000-0000-000000000000',
  'user18@gmail.com',
  crypt('12345678', gen_salt('bf')),
  now(),
  '{"provider":"email","providers":["email"]}',
  '{"full_name": "Rohan Reddy", "role": "participant", "usn": "4SC24IS018", "branch": "ISE", "phone": "9208639544"}',
  now(),
  now(),
  'authenticated',
  'authenticated'
) ON CONFLICT (id) DO UPDATE SET encrypted_password = crypt('12345678', gen_salt('bf'));

INSERT INTO public.users (
  id, email, full_name, usn, branch, phone, role
) VALUES (
  '00000000-0000-4000-8000-300000000018',
  'user18@gmail.com',
  'Rohan Reddy',
  '4SC24IS018',
  'ISE',
  '9208639544',
  'participant'
) ON CONFLICT (id) DO UPDATE SET
  full_name = EXCLUDED.full_name,
  usn = EXCLUDED.usn,
  branch = EXCLUDED.branch,
  role = EXCLUDED.role;


INSERT INTO auth.users (
  id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, updated_at, role, aud
) VALUES (
  '00000000-0000-4000-8000-300000000019',
  '00000000-0000-0000-0000-000000000000',
  'user19@gmail.com',
  crypt('12345678', gen_salt('bf')),
  now(),
  '{"provider":"email","providers":["email"]}',
  '{"full_name": "Sneha Bhat", "role": "participant", "usn": "4SC24AI019", "branch": "AIML", "phone": "9938300228"}',
  now(),
  now(),
  'authenticated',
  'authenticated'
) ON CONFLICT (id) DO UPDATE SET encrypted_password = crypt('12345678', gen_salt('bf'));

INSERT INTO public.users (
  id, email, full_name, usn, branch, phone, role
) VALUES (
  '00000000-0000-4000-8000-300000000019',
  'user19@gmail.com',
  'Sneha Bhat',
  '4SC24AI019',
  'AIML',
  '9938300228',
  'participant'
) ON CONFLICT (id) DO UPDATE SET
  full_name = EXCLUDED.full_name,
  usn = EXCLUDED.usn,
  branch = EXCLUDED.branch,
  role = EXCLUDED.role;


INSERT INTO auth.users (
  id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, updated_at, role, aud
) VALUES (
  '00000000-0000-4000-8000-300000000020',
  '00000000-0000-0000-0000-000000000000',
  'user20@gmail.com',
  crypt('12345678', gen_salt('bf')),
  now(),
  '{"provider":"email","providers":["email"]}',
  '{"full_name": "Arjun Shetty", "role": "participant", "usn": "4SC24IS020", "branch": "ISE", "phone": "9935377712"}',
  now(),
  now(),
  'authenticated',
  'authenticated'
) ON CONFLICT (id) DO UPDATE SET encrypted_password = crypt('12345678', gen_salt('bf'));

INSERT INTO public.users (
  id, email, full_name, usn, branch, phone, role
) VALUES (
  '00000000-0000-4000-8000-300000000020',
  'user20@gmail.com',
  'Arjun Shetty',
  '4SC24IS020',
  'ISE',
  '9935377712',
  'participant'
) ON CONFLICT (id) DO UPDATE SET
  full_name = EXCLUDED.full_name,
  usn = EXCLUDED.usn,
  branch = EXCLUDED.branch,
  role = EXCLUDED.role;


INSERT INTO auth.users (
  id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, updated_at, role, aud
) VALUES (
  '00000000-0000-4000-8000-300000000021',
  '00000000-0000-0000-0000-000000000000',
  'user21@gmail.com',
  crypt('12345678', gen_salt('bf')),
  now(),
  '{"provider":"email","providers":["email"]}',
  '{"full_name": "Pooja Shetty", "role": "participant", "usn": "4SC24CS021", "branch": "CSE", "phone": "9655047171"}',
  now(),
  now(),
  'authenticated',
  'authenticated'
) ON CONFLICT (id) DO UPDATE SET encrypted_password = crypt('12345678', gen_salt('bf'));

INSERT INTO public.users (
  id, email, full_name, usn, branch, phone, role
) VALUES (
  '00000000-0000-4000-8000-300000000021',
  'user21@gmail.com',
  'Pooja Shetty',
  '4SC24CS021',
  'CSE',
  '9655047171',
  'participant'
) ON CONFLICT (id) DO UPDATE SET
  full_name = EXCLUDED.full_name,
  usn = EXCLUDED.usn,
  branch = EXCLUDED.branch,
  role = EXCLUDED.role;


INSERT INTO auth.users (
  id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, updated_at, role, aud
) VALUES (
  '00000000-0000-4000-8000-300000000022',
  '00000000-0000-0000-0000-000000000000',
  'user22@gmail.com',
  crypt('12345678', gen_salt('bf')),
  now(),
  '{"provider":"email","providers":["email"]}',
  '{"full_name": "Keerthana Patil", "role": "participant", "usn": "4SC24EC022", "branch": "ECE", "phone": "9290141000"}',
  now(),
  now(),
  'authenticated',
  'authenticated'
) ON CONFLICT (id) DO UPDATE SET encrypted_password = crypt('12345678', gen_salt('bf'));

INSERT INTO public.users (
  id, email, full_name, usn, branch, phone, role
) VALUES (
  '00000000-0000-4000-8000-300000000022',
  'user22@gmail.com',
  'Keerthana Patil',
  '4SC24EC022',
  'ECE',
  '9290141000',
  'participant'
) ON CONFLICT (id) DO UPDATE SET
  full_name = EXCLUDED.full_name,
  usn = EXCLUDED.usn,
  branch = EXCLUDED.branch,
  role = EXCLUDED.role;


INSERT INTO auth.users (
  id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, updated_at, role, aud
) VALUES (
  '00000000-0000-4000-8000-300000000023',
  '00000000-0000-0000-0000-000000000000',
  'user23@gmail.com',
  crypt('12345678', gen_salt('bf')),
  now(),
  '{"provider":"email","providers":["email"]}',
  '{"full_name": "Naveen Gowda", "role": "participant", "usn": "4SC24AI023", "branch": "AIML", "phone": "9567259860"}',
  now(),
  now(),
  'authenticated',
  'authenticated'
) ON CONFLICT (id) DO UPDATE SET encrypted_password = crypt('12345678', gen_salt('bf'));

INSERT INTO public.users (
  id, email, full_name, usn, branch, phone, role
) VALUES (
  '00000000-0000-4000-8000-300000000023',
  'user23@gmail.com',
  'Naveen Gowda',
  '4SC24AI023',
  'AIML',
  '9567259860',
  'participant'
) ON CONFLICT (id) DO UPDATE SET
  full_name = EXCLUDED.full_name,
  usn = EXCLUDED.usn,
  branch = EXCLUDED.branch,
  role = EXCLUDED.role;


INSERT INTO auth.users (
  id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, updated_at, role, aud
) VALUES (
  '00000000-0000-4000-8000-300000000024',
  '00000000-0000-0000-0000-000000000000',
  'user24@gmail.com',
  crypt('12345678', gen_salt('bf')),
  now(),
  '{"provider":"email","providers":["email"]}',
  '{"full_name": "Rohan Kulal", "role": "participant", "usn": "4SC24AI024", "branch": "AIML", "phone": "9806542809"}',
  now(),
  now(),
  'authenticated',
  'authenticated'
) ON CONFLICT (id) DO UPDATE SET encrypted_password = crypt('12345678', gen_salt('bf'));

INSERT INTO public.users (
  id, email, full_name, usn, branch, phone, role
) VALUES (
  '00000000-0000-4000-8000-300000000024',
  'user24@gmail.com',
  'Rohan Kulal',
  '4SC24AI024',
  'AIML',
  '9806542809',
  'participant'
) ON CONFLICT (id) DO UPDATE SET
  full_name = EXCLUDED.full_name,
  usn = EXCLUDED.usn,
  branch = EXCLUDED.branch,
  role = EXCLUDED.role;


INSERT INTO auth.users (
  id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, updated_at, role, aud
) VALUES (
  '00000000-0000-4000-8000-300000000025',
  '00000000-0000-0000-0000-000000000000',
  'user25@gmail.com',
  crypt('12345678', gen_salt('bf')),
  now(),
  '{"provider":"email","providers":["email"]}',
  '{"full_name": "Rahul Naik", "role": "participant", "usn": "4SC24EC025", "branch": "ECE", "phone": "9326771304"}',
  now(),
  now(),
  'authenticated',
  'authenticated'
) ON CONFLICT (id) DO UPDATE SET encrypted_password = crypt('12345678', gen_salt('bf'));

INSERT INTO public.users (
  id, email, full_name, usn, branch, phone, role
) VALUES (
  '00000000-0000-4000-8000-300000000025',
  'user25@gmail.com',
  'Rahul Naik',
  '4SC24EC025',
  'ECE',
  '9326771304',
  'participant'
) ON CONFLICT (id) DO UPDATE SET
  full_name = EXCLUDED.full_name,
  usn = EXCLUDED.usn,
  branch = EXCLUDED.branch,
  role = EXCLUDED.role;


INSERT INTO auth.users (
  id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, updated_at, role, aud
) VALUES (
  '00000000-0000-4000-8000-300000000026',
  '00000000-0000-0000-0000-000000000000',
  'user26@gmail.com',
  crypt('12345678', gen_salt('bf')),
  now(),
  '{"provider":"email","providers":["email"]}',
  '{"full_name": "Pooja Gowda", "role": "participant", "usn": "4SC24AI026", "branch": "AIML", "phone": "9792790722"}',
  now(),
  now(),
  'authenticated',
  'authenticated'
) ON CONFLICT (id) DO UPDATE SET encrypted_password = crypt('12345678', gen_salt('bf'));

INSERT INTO public.users (
  id, email, full_name, usn, branch, phone, role
) VALUES (
  '00000000-0000-4000-8000-300000000026',
  'user26@gmail.com',
  'Pooja Gowda',
  '4SC24AI026',
  'AIML',
  '9792790722',
  'participant'
) ON CONFLICT (id) DO UPDATE SET
  full_name = EXCLUDED.full_name,
  usn = EXCLUDED.usn,
  branch = EXCLUDED.branch,
  role = EXCLUDED.role;


INSERT INTO auth.users (
  id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, updated_at, role, aud
) VALUES (
  '00000000-0000-4000-8000-300000000027',
  '00000000-0000-0000-0000-000000000000',
  'user27@gmail.com',
  crypt('12345678', gen_salt('bf')),
  now(),
  '{"provider":"email","providers":["email"]}',
  '{"full_name": "Aishwarya Kulal", "role": "participant", "usn": "4SC24ME027", "branch": "ME", "phone": "9203376000"}',
  now(),
  now(),
  'authenticated',
  'authenticated'
) ON CONFLICT (id) DO UPDATE SET encrypted_password = crypt('12345678', gen_salt('bf'));

INSERT INTO public.users (
  id, email, full_name, usn, branch, phone, role
) VALUES (
  '00000000-0000-4000-8000-300000000027',
  'user27@gmail.com',
  'Aishwarya Kulal',
  '4SC24ME027',
  'ME',
  '9203376000',
  'participant'
) ON CONFLICT (id) DO UPDATE SET
  full_name = EXCLUDED.full_name,
  usn = EXCLUDED.usn,
  branch = EXCLUDED.branch,
  role = EXCLUDED.role;


INSERT INTO auth.users (
  id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, updated_at, role, aud
) VALUES (
  '00000000-0000-4000-8000-300000000028',
  '00000000-0000-0000-0000-000000000000',
  'user28@gmail.com',
  crypt('12345678', gen_salt('bf')),
  now(),
  '{"provider":"email","providers":["email"]}',
  '{"full_name": "Priya Rao", "role": "participant", "usn": "4SC24IS028", "branch": "ISE", "phone": "9517475721"}',
  now(),
  now(),
  'authenticated',
  'authenticated'
) ON CONFLICT (id) DO UPDATE SET encrypted_password = crypt('12345678', gen_salt('bf'));

INSERT INTO public.users (
  id, email, full_name, usn, branch, phone, role
) VALUES (
  '00000000-0000-4000-8000-300000000028',
  'user28@gmail.com',
  'Priya Rao',
  '4SC24IS028',
  'ISE',
  '9517475721',
  'participant'
) ON CONFLICT (id) DO UPDATE SET
  full_name = EXCLUDED.full_name,
  usn = EXCLUDED.usn,
  branch = EXCLUDED.branch,
  role = EXCLUDED.role;


INSERT INTO auth.users (
  id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, updated_at, role, aud
) VALUES (
  '00000000-0000-4000-8000-300000000029',
  '00000000-0000-0000-0000-000000000000',
  'user29@gmail.com',
  crypt('12345678', gen_salt('bf')),
  now(),
  '{"provider":"email","providers":["email"]}',
  '{"full_name": "Rahul Rao", "role": "participant", "usn": "4SC24ME029", "branch": "ME", "phone": "9728794712"}',
  now(),
  now(),
  'authenticated',
  'authenticated'
) ON CONFLICT (id) DO UPDATE SET encrypted_password = crypt('12345678', gen_salt('bf'));

INSERT INTO public.users (
  id, email, full_name, usn, branch, phone, role
) VALUES (
  '00000000-0000-4000-8000-300000000029',
  'user29@gmail.com',
  'Rahul Rao',
  '4SC24ME029',
  'ME',
  '9728794712',
  'participant'
) ON CONFLICT (id) DO UPDATE SET
  full_name = EXCLUDED.full_name,
  usn = EXCLUDED.usn,
  branch = EXCLUDED.branch,
  role = EXCLUDED.role;


INSERT INTO auth.users (
  id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, updated_at, role, aud
) VALUES (
  '00000000-0000-4000-8000-300000000030',
  '00000000-0000-0000-0000-000000000000',
  'user30@gmail.com',
  crypt('12345678', gen_salt('bf')),
  now(),
  '{"provider":"email","providers":["email"]}',
  '{"full_name": "Ananya Kumar", "role": "participant", "usn": "4SC24CS030", "branch": "CSE", "phone": "9733491399"}',
  now(),
  now(),
  'authenticated',
  'authenticated'
) ON CONFLICT (id) DO UPDATE SET encrypted_password = crypt('12345678', gen_salt('bf'));

INSERT INTO public.users (
  id, email, full_name, usn, branch, phone, role
) VALUES (
  '00000000-0000-4000-8000-300000000030',
  'user30@gmail.com',
  'Ananya Kumar',
  '4SC24CS030',
  'CSE',
  '9733491399',
  'participant'
) ON CONFLICT (id) DO UPDATE SET
  full_name = EXCLUDED.full_name,
  usn = EXCLUDED.usn,
  branch = EXCLUDED.branch,
  role = EXCLUDED.role;


INSERT INTO auth.users (
  id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, updated_at, role, aud
) VALUES (
  '00000000-0000-4000-8000-300000000031',
  '00000000-0000-0000-0000-000000000000',
  'user31@gmail.com',
  crypt('12345678', gen_salt('bf')),
  now(),
  '{"provider":"email","providers":["email"]}',
  '{"full_name": "Akhil Patil", "role": "participant", "usn": "4SC24CS031", "branch": "CSE", "phone": "9126610928"}',
  now(),
  now(),
  'authenticated',
  'authenticated'
) ON CONFLICT (id) DO UPDATE SET encrypted_password = crypt('12345678', gen_salt('bf'));

INSERT INTO public.users (
  id, email, full_name, usn, branch, phone, role
) VALUES (
  '00000000-0000-4000-8000-300000000031',
  'user31@gmail.com',
  'Akhil Patil',
  '4SC24CS031',
  'CSE',
  '9126610928',
  'participant'
) ON CONFLICT (id) DO UPDATE SET
  full_name = EXCLUDED.full_name,
  usn = EXCLUDED.usn,
  branch = EXCLUDED.branch,
  role = EXCLUDED.role;


INSERT INTO auth.users (
  id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, updated_at, role, aud
) VALUES (
  '00000000-0000-4000-8000-300000000032',
  '00000000-0000-0000-0000-000000000000',
  'user32@gmail.com',
  crypt('12345678', gen_salt('bf')),
  now(),
  '{"provider":"email","providers":["email"]}',
  '{"full_name": "Keerthana Gowda", "role": "participant", "usn": "4SC24ME032", "branch": "ME", "phone": "9490388833"}',
  now(),
  now(),
  'authenticated',
  'authenticated'
) ON CONFLICT (id) DO UPDATE SET encrypted_password = crypt('12345678', gen_salt('bf'));

INSERT INTO public.users (
  id, email, full_name, usn, branch, phone, role
) VALUES (
  '00000000-0000-4000-8000-300000000032',
  'user32@gmail.com',
  'Keerthana Gowda',
  '4SC24ME032',
  'ME',
  '9490388833',
  'participant'
) ON CONFLICT (id) DO UPDATE SET
  full_name = EXCLUDED.full_name,
  usn = EXCLUDED.usn,
  branch = EXCLUDED.branch,
  role = EXCLUDED.role;


INSERT INTO auth.users (
  id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, updated_at, role, aud
) VALUES (
  '00000000-0000-4000-8000-300000000033',
  '00000000-0000-0000-0000-000000000000',
  'user33@gmail.com',
  crypt('12345678', gen_salt('bf')),
  now(),
  '{"provider":"email","providers":["email"]}',
  '{"full_name": "Naveen Reddy", "role": "participant", "usn": "4SC24CS033", "branch": "CSE", "phone": "9210156958"}',
  now(),
  now(),
  'authenticated',
  'authenticated'
) ON CONFLICT (id) DO UPDATE SET encrypted_password = crypt('12345678', gen_salt('bf'));

INSERT INTO public.users (
  id, email, full_name, usn, branch, phone, role
) VALUES (
  '00000000-0000-4000-8000-300000000033',
  'user33@gmail.com',
  'Naveen Reddy',
  '4SC24CS033',
  'CSE',
  '9210156958',
  'participant'
) ON CONFLICT (id) DO UPDATE SET
  full_name = EXCLUDED.full_name,
  usn = EXCLUDED.usn,
  branch = EXCLUDED.branch,
  role = EXCLUDED.role;


INSERT INTO auth.users (
  id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, updated_at, role, aud
) VALUES (
  '00000000-0000-4000-8000-300000000034',
  '00000000-0000-0000-0000-000000000000',
  'user34@gmail.com',
  crypt('12345678', gen_salt('bf')),
  now(),
  '{"provider":"email","providers":["email"]}',
  '{"full_name": "Kiran Reddy", "role": "participant", "usn": "4SC24CS034", "branch": "CSE", "phone": "9351720968"}',
  now(),
  now(),
  'authenticated',
  'authenticated'
) ON CONFLICT (id) DO UPDATE SET encrypted_password = crypt('12345678', gen_salt('bf'));

INSERT INTO public.users (
  id, email, full_name, usn, branch, phone, role
) VALUES (
  '00000000-0000-4000-8000-300000000034',
  'user34@gmail.com',
  'Kiran Reddy',
  '4SC24CS034',
  'CSE',
  '9351720968',
  'participant'
) ON CONFLICT (id) DO UPDATE SET
  full_name = EXCLUDED.full_name,
  usn = EXCLUDED.usn,
  branch = EXCLUDED.branch,
  role = EXCLUDED.role;


INSERT INTO auth.users (
  id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, updated_at, role, aud
) VALUES (
  '00000000-0000-4000-8000-300000000035',
  '00000000-0000-0000-0000-000000000000',
  'user35@gmail.com',
  crypt('12345678', gen_salt('bf')),
  now(),
  '{"provider":"email","providers":["email"]}',
  '{"full_name": "Akhil Gowda", "role": "participant", "usn": "4SC24AI035", "branch": "AIML", "phone": "9400902020"}',
  now(),
  now(),
  'authenticated',
  'authenticated'
) ON CONFLICT (id) DO UPDATE SET encrypted_password = crypt('12345678', gen_salt('bf'));

INSERT INTO public.users (
  id, email, full_name, usn, branch, phone, role
) VALUES (
  '00000000-0000-4000-8000-300000000035',
  'user35@gmail.com',
  'Akhil Gowda',
  '4SC24AI035',
  'AIML',
  '9400902020',
  'participant'
) ON CONFLICT (id) DO UPDATE SET
  full_name = EXCLUDED.full_name,
  usn = EXCLUDED.usn,
  branch = EXCLUDED.branch,
  role = EXCLUDED.role;


INSERT INTO auth.users (
  id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, updated_at, role, aud
) VALUES (
  '00000000-0000-4000-8000-300000000036',
  '00000000-0000-0000-0000-000000000000',
  'user36@gmail.com',
  crypt('12345678', gen_salt('bf')),
  now(),
  '{"provider":"email","providers":["email"]}',
  '{"full_name": "Akhil Kumar", "role": "participant", "usn": "4SC24ME036", "branch": "ME", "phone": "9953292326"}',
  now(),
  now(),
  'authenticated',
  'authenticated'
) ON CONFLICT (id) DO UPDATE SET encrypted_password = crypt('12345678', gen_salt('bf'));

INSERT INTO public.users (
  id, email, full_name, usn, branch, phone, role
) VALUES (
  '00000000-0000-4000-8000-300000000036',
  'user36@gmail.com',
  'Akhil Kumar',
  '4SC24ME036',
  'ME',
  '9953292326',
  'participant'
) ON CONFLICT (id) DO UPDATE SET
  full_name = EXCLUDED.full_name,
  usn = EXCLUDED.usn,
  branch = EXCLUDED.branch,
  role = EXCLUDED.role;


INSERT INTO auth.users (
  id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, updated_at, role, aud
) VALUES (
  '00000000-0000-4000-8000-300000000037',
  '00000000-0000-0000-0000-000000000000',
  'user37@gmail.com',
  crypt('12345678', gen_salt('bf')),
  now(),
  '{"provider":"email","providers":["email"]}',
  '{"full_name": "Harsha Kumar", "role": "participant", "usn": "4SC24CS037", "branch": "CSE", "phone": "9337970055"}',
  now(),
  now(),
  'authenticated',
  'authenticated'
) ON CONFLICT (id) DO UPDATE SET encrypted_password = crypt('12345678', gen_salt('bf'));

INSERT INTO public.users (
  id, email, full_name, usn, branch, phone, role
) VALUES (
  '00000000-0000-4000-8000-300000000037',
  'user37@gmail.com',
  'Harsha Kumar',
  '4SC24CS037',
  'CSE',
  '9337970055',
  'participant'
) ON CONFLICT (id) DO UPDATE SET
  full_name = EXCLUDED.full_name,
  usn = EXCLUDED.usn,
  branch = EXCLUDED.branch,
  role = EXCLUDED.role;


INSERT INTO auth.users (
  id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, updated_at, role, aud
) VALUES (
  '00000000-0000-4000-8000-300000000038',
  '00000000-0000-0000-0000-000000000000',
  'user38@gmail.com',
  crypt('12345678', gen_salt('bf')),
  now(),
  '{"provider":"email","providers":["email"]}',
  '{"full_name": "Megha Patil", "role": "participant", "usn": "4SC24EC038", "branch": "ECE", "phone": "9580384891"}',
  now(),
  now(),
  'authenticated',
  'authenticated'
) ON CONFLICT (id) DO UPDATE SET encrypted_password = crypt('12345678', gen_salt('bf'));

INSERT INTO public.users (
  id, email, full_name, usn, branch, phone, role
) VALUES (
  '00000000-0000-4000-8000-300000000038',
  'user38@gmail.com',
  'Megha Patil',
  '4SC24EC038',
  'ECE',
  '9580384891',
  'participant'
) ON CONFLICT (id) DO UPDATE SET
  full_name = EXCLUDED.full_name,
  usn = EXCLUDED.usn,
  branch = EXCLUDED.branch,
  role = EXCLUDED.role;


INSERT INTO auth.users (
  id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, updated_at, role, aud
) VALUES (
  '00000000-0000-4000-8000-300000000039',
  '00000000-0000-0000-0000-000000000000',
  'user39@gmail.com',
  crypt('12345678', gen_salt('bf')),
  now(),
  '{"provider":"email","providers":["email"]}',
  '{"full_name": "Harsha Shetty", "role": "participant", "usn": "4SC24EC039", "branch": "ECE", "phone": "9524606058"}',
  now(),
  now(),
  'authenticated',
  'authenticated'
) ON CONFLICT (id) DO UPDATE SET encrypted_password = crypt('12345678', gen_salt('bf'));

INSERT INTO public.users (
  id, email, full_name, usn, branch, phone, role
) VALUES (
  '00000000-0000-4000-8000-300000000039',
  'user39@gmail.com',
  'Harsha Shetty',
  '4SC24EC039',
  'ECE',
  '9524606058',
  'participant'
) ON CONFLICT (id) DO UPDATE SET
  full_name = EXCLUDED.full_name,
  usn = EXCLUDED.usn,
  branch = EXCLUDED.branch,
  role = EXCLUDED.role;


INSERT INTO auth.users (
  id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, updated_at, role, aud
) VALUES (
  '00000000-0000-4000-8000-300000000040',
  '00000000-0000-0000-0000-000000000000',
  'user40@gmail.com',
  crypt('12345678', gen_salt('bf')),
  now(),
  '{"provider":"email","providers":["email"]}',
  '{"full_name": "Harsha Gowda", "role": "participant", "usn": "4SC24CS040", "branch": "CSE", "phone": "9303441079"}',
  now(),
  now(),
  'authenticated',
  'authenticated'
) ON CONFLICT (id) DO UPDATE SET encrypted_password = crypt('12345678', gen_salt('bf'));

INSERT INTO public.users (
  id, email, full_name, usn, branch, phone, role
) VALUES (
  '00000000-0000-4000-8000-300000000040',
  'user40@gmail.com',
  'Harsha Gowda',
  '4SC24CS040',
  'CSE',
  '9303441079',
  'participant'
) ON CONFLICT (id) DO UPDATE SET
  full_name = EXCLUDED.full_name,
  usn = EXCLUDED.usn,
  branch = EXCLUDED.branch,
  role = EXCLUDED.role;


INSERT INTO auth.users (
  id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, updated_at, role, aud
) VALUES (
  '00000000-0000-4000-8000-300000000041',
  '00000000-0000-0000-0000-000000000000',
  'user41@gmail.com',
  crypt('12345678', gen_salt('bf')),
  now(),
  '{"provider":"email","providers":["email"]}',
  '{"full_name": "Nikhil Naik", "role": "participant", "usn": "4SC24CS041", "branch": "CSE", "phone": "9394778745"}',
  now(),
  now(),
  'authenticated',
  'authenticated'
) ON CONFLICT (id) DO UPDATE SET encrypted_password = crypt('12345678', gen_salt('bf'));

INSERT INTO public.users (
  id, email, full_name, usn, branch, phone, role
) VALUES (
  '00000000-0000-4000-8000-300000000041',
  'user41@gmail.com',
  'Nikhil Naik',
  '4SC24CS041',
  'CSE',
  '9394778745',
  'participant'
) ON CONFLICT (id) DO UPDATE SET
  full_name = EXCLUDED.full_name,
  usn = EXCLUDED.usn,
  branch = EXCLUDED.branch,
  role = EXCLUDED.role;


INSERT INTO auth.users (
  id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, updated_at, role, aud
) VALUES (
  '00000000-0000-4000-8000-300000000042',
  '00000000-0000-0000-0000-000000000000',
  'user42@gmail.com',
  crypt('12345678', gen_salt('bf')),
  now(),
  '{"provider":"email","providers":["email"]}',
  '{"full_name": "Aishwarya Reddy", "role": "participant", "usn": "4SC24CS042", "branch": "CSE", "phone": "9936508597"}',
  now(),
  now(),
  'authenticated',
  'authenticated'
) ON CONFLICT (id) DO UPDATE SET encrypted_password = crypt('12345678', gen_salt('bf'));

INSERT INTO public.users (
  id, email, full_name, usn, branch, phone, role
) VALUES (
  '00000000-0000-4000-8000-300000000042',
  'user42@gmail.com',
  'Aishwarya Reddy',
  '4SC24CS042',
  'CSE',
  '9936508597',
  'participant'
) ON CONFLICT (id) DO UPDATE SET
  full_name = EXCLUDED.full_name,
  usn = EXCLUDED.usn,
  branch = EXCLUDED.branch,
  role = EXCLUDED.role;


INSERT INTO auth.users (
  id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, updated_at, role, aud
) VALUES (
  '00000000-0000-4000-8000-300000000043',
  '00000000-0000-0000-0000-000000000000',
  'user43@gmail.com',
  crypt('12345678', gen_salt('bf')),
  now(),
  '{"provider":"email","providers":["email"]}',
  '{"full_name": "Arjun Nair", "role": "participant", "usn": "4SC24CS043", "branch": "CSE", "phone": "9429319076"}',
  now(),
  now(),
  'authenticated',
  'authenticated'
) ON CONFLICT (id) DO UPDATE SET encrypted_password = crypt('12345678', gen_salt('bf'));

INSERT INTO public.users (
  id, email, full_name, usn, branch, phone, role
) VALUES (
  '00000000-0000-4000-8000-300000000043',
  'user43@gmail.com',
  'Arjun Nair',
  '4SC24CS043',
  'CSE',
  '9429319076',
  'participant'
) ON CONFLICT (id) DO UPDATE SET
  full_name = EXCLUDED.full_name,
  usn = EXCLUDED.usn,
  branch = EXCLUDED.branch,
  role = EXCLUDED.role;


INSERT INTO auth.users (
  id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, updated_at, role, aud
) VALUES (
  '00000000-0000-4000-8000-300000000044',
  '00000000-0000-0000-0000-000000000000',
  'user44@gmail.com',
  crypt('12345678', gen_salt('bf')),
  now(),
  '{"provider":"email","providers":["email"]}',
  '{"full_name": "Priya Gowda", "role": "participant", "usn": "4SC24EC044", "branch": "ECE", "phone": "9862287139"}',
  now(),
  now(),
  'authenticated',
  'authenticated'
) ON CONFLICT (id) DO UPDATE SET encrypted_password = crypt('12345678', gen_salt('bf'));

INSERT INTO public.users (
  id, email, full_name, usn, branch, phone, role
) VALUES (
  '00000000-0000-4000-8000-300000000044',
  'user44@gmail.com',
  'Priya Gowda',
  '4SC24EC044',
  'ECE',
  '9862287139',
  'participant'
) ON CONFLICT (id) DO UPDATE SET
  full_name = EXCLUDED.full_name,
  usn = EXCLUDED.usn,
  branch = EXCLUDED.branch,
  role = EXCLUDED.role;


INSERT INTO auth.users (
  id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, updated_at, role, aud
) VALUES (
  '00000000-0000-4000-8000-300000000045',
  '00000000-0000-0000-0000-000000000000',
  'user45@gmail.com',
  crypt('12345678', gen_salt('bf')),
  now(),
  '{"provider":"email","providers":["email"]}',
  '{"full_name": "Priya Nair", "role": "participant", "usn": "4SC24ME045", "branch": "ME", "phone": "9244607595"}',
  now(),
  now(),
  'authenticated',
  'authenticated'
) ON CONFLICT (id) DO UPDATE SET encrypted_password = crypt('12345678', gen_salt('bf'));

INSERT INTO public.users (
  id, email, full_name, usn, branch, phone, role
) VALUES (
  '00000000-0000-4000-8000-300000000045',
  'user45@gmail.com',
  'Priya Nair',
  '4SC24ME045',
  'ME',
  '9244607595',
  'participant'
) ON CONFLICT (id) DO UPDATE SET
  full_name = EXCLUDED.full_name,
  usn = EXCLUDED.usn,
  branch = EXCLUDED.branch,
  role = EXCLUDED.role;


INSERT INTO auth.users (
  id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, updated_at, role, aud
) VALUES (
  '00000000-0000-4000-8000-300000000046',
  '00000000-0000-0000-0000-000000000000',
  'user46@gmail.com',
  crypt('12345678', gen_salt('bf')),
  now(),
  '{"provider":"email","providers":["email"]}',
  '{"full_name": "Priya Gowda", "role": "participant", "usn": "4SC24AI046", "branch": "AIML", "phone": "9733914869"}',
  now(),
  now(),
  'authenticated',
  'authenticated'
) ON CONFLICT (id) DO UPDATE SET encrypted_password = crypt('12345678', gen_salt('bf'));

INSERT INTO public.users (
  id, email, full_name, usn, branch, phone, role
) VALUES (
  '00000000-0000-4000-8000-300000000046',
  'user46@gmail.com',
  'Priya Gowda',
  '4SC24AI046',
  'AIML',
  '9733914869',
  'participant'
) ON CONFLICT (id) DO UPDATE SET
  full_name = EXCLUDED.full_name,
  usn = EXCLUDED.usn,
  branch = EXCLUDED.branch,
  role = EXCLUDED.role;


INSERT INTO auth.users (
  id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, updated_at, role, aud
) VALUES (
  '00000000-0000-4000-8000-300000000047',
  '00000000-0000-0000-0000-000000000000',
  'user47@gmail.com',
  crypt('12345678', gen_salt('bf')),
  now(),
  '{"provider":"email","providers":["email"]}',
  '{"full_name": "Priya Kumar", "role": "participant", "usn": "4SC24ME047", "branch": "ME", "phone": "9340583428"}',
  now(),
  now(),
  'authenticated',
  'authenticated'
) ON CONFLICT (id) DO UPDATE SET encrypted_password = crypt('12345678', gen_salt('bf'));

INSERT INTO public.users (
  id, email, full_name, usn, branch, phone, role
) VALUES (
  '00000000-0000-4000-8000-300000000047',
  'user47@gmail.com',
  'Priya Kumar',
  '4SC24ME047',
  'ME',
  '9340583428',
  'participant'
) ON CONFLICT (id) DO UPDATE SET
  full_name = EXCLUDED.full_name,
  usn = EXCLUDED.usn,
  branch = EXCLUDED.branch,
  role = EXCLUDED.role;


INSERT INTO auth.users (
  id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, updated_at, role, aud
) VALUES (
  '00000000-0000-4000-8000-300000000048',
  '00000000-0000-0000-0000-000000000000',
  'user48@gmail.com',
  crypt('12345678', gen_salt('bf')),
  now(),
  '{"provider":"email","providers":["email"]}',
  '{"full_name": "Deepak Nair", "role": "participant", "usn": "4SC24CS048", "branch": "CSE", "phone": "9345605738"}',
  now(),
  now(),
  'authenticated',
  'authenticated'
) ON CONFLICT (id) DO UPDATE SET encrypted_password = crypt('12345678', gen_salt('bf'));

INSERT INTO public.users (
  id, email, full_name, usn, branch, phone, role
) VALUES (
  '00000000-0000-4000-8000-300000000048',
  'user48@gmail.com',
  'Deepak Nair',
  '4SC24CS048',
  'CSE',
  '9345605738',
  'participant'
) ON CONFLICT (id) DO UPDATE SET
  full_name = EXCLUDED.full_name,
  usn = EXCLUDED.usn,
  branch = EXCLUDED.branch,
  role = EXCLUDED.role;


INSERT INTO auth.users (
  id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, updated_at, role, aud
) VALUES (
  '00000000-0000-4000-8000-300000000049',
  '00000000-0000-0000-0000-000000000000',
  'user49@gmail.com',
  crypt('12345678', gen_salt('bf')),
  now(),
  '{"provider":"email","providers":["email"]}',
  '{"full_name": "Harsha Shetty", "role": "participant", "usn": "4SC24CS049", "branch": "CSE", "phone": "9902055680"}',
  now(),
  now(),
  'authenticated',
  'authenticated'
) ON CONFLICT (id) DO UPDATE SET encrypted_password = crypt('12345678', gen_salt('bf'));

INSERT INTO public.users (
  id, email, full_name, usn, branch, phone, role
) VALUES (
  '00000000-0000-4000-8000-300000000049',
  'user49@gmail.com',
  'Harsha Shetty',
  '4SC24CS049',
  'CSE',
  '9902055680',
  'participant'
) ON CONFLICT (id) DO UPDATE SET
  full_name = EXCLUDED.full_name,
  usn = EXCLUDED.usn,
  branch = EXCLUDED.branch,
  role = EXCLUDED.role;


INSERT INTO auth.users (
  id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, updated_at, role, aud
) VALUES (
  '00000000-0000-4000-8000-300000000050',
  '00000000-0000-0000-0000-000000000000',
  'user50@gmail.com',
  crypt('12345678', gen_salt('bf')),
  now(),
  '{"provider":"email","providers":["email"]}',
  '{"full_name": "Aishwarya Patil", "role": "participant", "usn": "4SC24CS050", "branch": "CSE", "phone": "9295847267"}',
  now(),
  now(),
  'authenticated',
  'authenticated'
) ON CONFLICT (id) DO UPDATE SET encrypted_password = crypt('12345678', gen_salt('bf'));

INSERT INTO public.users (
  id, email, full_name, usn, branch, phone, role
) VALUES (
  '00000000-0000-4000-8000-300000000050',
  'user50@gmail.com',
  'Aishwarya Patil',
  '4SC24CS050',
  'CSE',
  '9295847267',
  'participant'
) ON CONFLICT (id) DO UPDATE SET
  full_name = EXCLUDED.full_name,
  usn = EXCLUDED.usn,
  branch = EXCLUDED.branch,
  role = EXCLUDED.role;


INSERT INTO auth.users (
  id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, updated_at, role, aud
) VALUES (
  '00000000-0000-4000-8000-300000000051',
  '00000000-0000-0000-0000-000000000000',
  'user51@gmail.com',
  crypt('12345678', gen_salt('bf')),
  now(),
  '{"provider":"email","providers":["email"]}',
  '{"full_name": "Arjun Nair", "role": "participant", "usn": "4SC24ME051", "branch": "ME", "phone": "9721055083"}',
  now(),
  now(),
  'authenticated',
  'authenticated'
) ON CONFLICT (id) DO UPDATE SET encrypted_password = crypt('12345678', gen_salt('bf'));

INSERT INTO public.users (
  id, email, full_name, usn, branch, phone, role
) VALUES (
  '00000000-0000-4000-8000-300000000051',
  'user51@gmail.com',
  'Arjun Nair',
  '4SC24ME051',
  'ME',
  '9721055083',
  'participant'
) ON CONFLICT (id) DO UPDATE SET
  full_name = EXCLUDED.full_name,
  usn = EXCLUDED.usn,
  branch = EXCLUDED.branch,
  role = EXCLUDED.role;


INSERT INTO auth.users (
  id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, updated_at, role, aud
) VALUES (
  '00000000-0000-4000-8000-300000000052',
  '00000000-0000-0000-0000-000000000000',
  'user52@gmail.com',
  crypt('12345678', gen_salt('bf')),
  now(),
  '{"provider":"email","providers":["email"]}',
  '{"full_name": "Ananya Rao", "role": "participant", "usn": "4SC24IS052", "branch": "ISE", "phone": "9729181169"}',
  now(),
  now(),
  'authenticated',
  'authenticated'
) ON CONFLICT (id) DO UPDATE SET encrypted_password = crypt('12345678', gen_salt('bf'));

INSERT INTO public.users (
  id, email, full_name, usn, branch, phone, role
) VALUES (
  '00000000-0000-4000-8000-300000000052',
  'user52@gmail.com',
  'Ananya Rao',
  '4SC24IS052',
  'ISE',
  '9729181169',
  'participant'
) ON CONFLICT (id) DO UPDATE SET
  full_name = EXCLUDED.full_name,
  usn = EXCLUDED.usn,
  branch = EXCLUDED.branch,
  role = EXCLUDED.role;


INSERT INTO auth.users (
  id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, updated_at, role, aud
) VALUES (
  '00000000-0000-4000-8000-300000000053',
  '00000000-0000-0000-0000-000000000000',
  'user53@gmail.com',
  crypt('12345678', gen_salt('bf')),
  now(),
  '{"provider":"email","providers":["email"]}',
  '{"full_name": "Naveen Patil", "role": "participant", "usn": "4SC24CS053", "branch": "CSE", "phone": "9461656870"}',
  now(),
  now(),
  'authenticated',
  'authenticated'
) ON CONFLICT (id) DO UPDATE SET encrypted_password = crypt('12345678', gen_salt('bf'));

INSERT INTO public.users (
  id, email, full_name, usn, branch, phone, role
) VALUES (
  '00000000-0000-4000-8000-300000000053',
  'user53@gmail.com',
  'Naveen Patil',
  '4SC24CS053',
  'CSE',
  '9461656870',
  'participant'
) ON CONFLICT (id) DO UPDATE SET
  full_name = EXCLUDED.full_name,
  usn = EXCLUDED.usn,
  branch = EXCLUDED.branch,
  role = EXCLUDED.role;


INSERT INTO auth.users (
  id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, updated_at, role, aud
) VALUES (
  '00000000-0000-4000-8000-300000000054',
  '00000000-0000-0000-0000-000000000000',
  'user54@gmail.com',
  crypt('12345678', gen_salt('bf')),
  now(),
  '{"provider":"email","providers":["email"]}',
  '{"full_name": "Varun Reddy", "role": "participant", "usn": "4SC24EC054", "branch": "ECE", "phone": "9556260354"}',
  now(),
  now(),
  'authenticated',
  'authenticated'
) ON CONFLICT (id) DO UPDATE SET encrypted_password = crypt('12345678', gen_salt('bf'));

INSERT INTO public.users (
  id, email, full_name, usn, branch, phone, role
) VALUES (
  '00000000-0000-4000-8000-300000000054',
  'user54@gmail.com',
  'Varun Reddy',
  '4SC24EC054',
  'ECE',
  '9556260354',
  'participant'
) ON CONFLICT (id) DO UPDATE SET
  full_name = EXCLUDED.full_name,
  usn = EXCLUDED.usn,
  branch = EXCLUDED.branch,
  role = EXCLUDED.role;


INSERT INTO auth.users (
  id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, updated_at, role, aud
) VALUES (
  '00000000-0000-4000-8000-300000000055',
  '00000000-0000-0000-0000-000000000000',
  'user55@gmail.com',
  crypt('12345678', gen_salt('bf')),
  now(),
  '{"provider":"email","providers":["email"]}',
  '{"full_name": "Varun Shetty", "role": "participant", "usn": "4SC24EC055", "branch": "ECE", "phone": "9762329564"}',
  now(),
  now(),
  'authenticated',
  'authenticated'
) ON CONFLICT (id) DO UPDATE SET encrypted_password = crypt('12345678', gen_salt('bf'));

INSERT INTO public.users (
  id, email, full_name, usn, branch, phone, role
) VALUES (
  '00000000-0000-4000-8000-300000000055',
  'user55@gmail.com',
  'Varun Shetty',
  '4SC24EC055',
  'ECE',
  '9762329564',
  'participant'
) ON CONFLICT (id) DO UPDATE SET
  full_name = EXCLUDED.full_name,
  usn = EXCLUDED.usn,
  branch = EXCLUDED.branch,
  role = EXCLUDED.role;


INSERT INTO auth.users (
  id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, updated_at, role, aud
) VALUES (
  '00000000-0000-4000-8000-300000000056',
  '00000000-0000-0000-0000-000000000000',
  'user56@gmail.com',
  crypt('12345678', gen_salt('bf')),
  now(),
  '{"provider":"email","providers":["email"]}',
  '{"full_name": "Harsha Kulal", "role": "participant", "usn": "4SC24CS056", "branch": "CSE", "phone": "9426973040"}',
  now(),
  now(),
  'authenticated',
  'authenticated'
) ON CONFLICT (id) DO UPDATE SET encrypted_password = crypt('12345678', gen_salt('bf'));

INSERT INTO public.users (
  id, email, full_name, usn, branch, phone, role
) VALUES (
  '00000000-0000-4000-8000-300000000056',
  'user56@gmail.com',
  'Harsha Kulal',
  '4SC24CS056',
  'CSE',
  '9426973040',
  'participant'
) ON CONFLICT (id) DO UPDATE SET
  full_name = EXCLUDED.full_name,
  usn = EXCLUDED.usn,
  branch = EXCLUDED.branch,
  role = EXCLUDED.role;


INSERT INTO auth.users (
  id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, updated_at, role, aud
) VALUES (
  '00000000-0000-4000-8000-300000000057',
  '00000000-0000-0000-0000-000000000000',
  'user57@gmail.com',
  crypt('12345678', gen_salt('bf')),
  now(),
  '{"provider":"email","providers":["email"]}',
  '{"full_name": "Nikhil Rao", "role": "participant", "usn": "4SC24EC057", "branch": "ECE", "phone": "9317876114"}',
  now(),
  now(),
  'authenticated',
  'authenticated'
) ON CONFLICT (id) DO UPDATE SET encrypted_password = crypt('12345678', gen_salt('bf'));

INSERT INTO public.users (
  id, email, full_name, usn, branch, phone, role
) VALUES (
  '00000000-0000-4000-8000-300000000057',
  'user57@gmail.com',
  'Nikhil Rao',
  '4SC24EC057',
  'ECE',
  '9317876114',
  'participant'
) ON CONFLICT (id) DO UPDATE SET
  full_name = EXCLUDED.full_name,
  usn = EXCLUDED.usn,
  branch = EXCLUDED.branch,
  role = EXCLUDED.role;


INSERT INTO auth.users (
  id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, updated_at, role, aud
) VALUES (
  '00000000-0000-4000-8000-300000000058',
  '00000000-0000-0000-0000-000000000000',
  'user58@gmail.com',
  crypt('12345678', gen_salt('bf')),
  now(),
  '{"provider":"email","providers":["email"]}',
  '{"full_name": "Aishwarya Gowda", "role": "participant", "usn": "4SC24AI058", "branch": "AIML", "phone": "9112961268"}',
  now(),
  now(),
  'authenticated',
  'authenticated'
) ON CONFLICT (id) DO UPDATE SET encrypted_password = crypt('12345678', gen_salt('bf'));

INSERT INTO public.users (
  id, email, full_name, usn, branch, phone, role
) VALUES (
  '00000000-0000-4000-8000-300000000058',
  'user58@gmail.com',
  'Aishwarya Gowda',
  '4SC24AI058',
  'AIML',
  '9112961268',
  'participant'
) ON CONFLICT (id) DO UPDATE SET
  full_name = EXCLUDED.full_name,
  usn = EXCLUDED.usn,
  branch = EXCLUDED.branch,
  role = EXCLUDED.role;


INSERT INTO auth.users (
  id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, updated_at, role, aud
) VALUES (
  '00000000-0000-4000-8000-300000000059',
  '00000000-0000-0000-0000-000000000000',
  'user59@gmail.com',
  crypt('12345678', gen_salt('bf')),
  now(),
  '{"provider":"email","providers":["email"]}',
  '{"full_name": "Rahul Kumar", "role": "participant", "usn": "4SC24CS059", "branch": "CSE", "phone": "9311008565"}',
  now(),
  now(),
  'authenticated',
  'authenticated'
) ON CONFLICT (id) DO UPDATE SET encrypted_password = crypt('12345678', gen_salt('bf'));

INSERT INTO public.users (
  id, email, full_name, usn, branch, phone, role
) VALUES (
  '00000000-0000-4000-8000-300000000059',
  'user59@gmail.com',
  'Rahul Kumar',
  '4SC24CS059',
  'CSE',
  '9311008565',
  'participant'
) ON CONFLICT (id) DO UPDATE SET
  full_name = EXCLUDED.full_name,
  usn = EXCLUDED.usn,
  branch = EXCLUDED.branch,
  role = EXCLUDED.role;


INSERT INTO auth.users (
  id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, updated_at, role, aud
) VALUES (
  '00000000-0000-4000-8000-300000000060',
  '00000000-0000-0000-0000-000000000000',
  'user60@gmail.com',
  crypt('12345678', gen_salt('bf')),
  now(),
  '{"provider":"email","providers":["email"]}',
  '{"full_name": "Ananya Nair", "role": "participant", "usn": "4SC24AI060", "branch": "AIML", "phone": "9172148058"}',
  now(),
  now(),
  'authenticated',
  'authenticated'
) ON CONFLICT (id) DO UPDATE SET encrypted_password = crypt('12345678', gen_salt('bf'));

INSERT INTO public.users (
  id, email, full_name, usn, branch, phone, role
) VALUES (
  '00000000-0000-4000-8000-300000000060',
  'user60@gmail.com',
  'Ananya Nair',
  '4SC24AI060',
  'AIML',
  '9172148058',
  'participant'
) ON CONFLICT (id) DO UPDATE SET
  full_name = EXCLUDED.full_name,
  usn = EXCLUDED.usn,
  branch = EXCLUDED.branch,
  role = EXCLUDED.role;


INSERT INTO auth.users (
  id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, updated_at, role, aud
) VALUES (
  '00000000-0000-4000-8000-300000000061',
  '00000000-0000-0000-0000-000000000000',
  'user61@gmail.com',
  crypt('12345678', gen_salt('bf')),
  now(),
  '{"provider":"email","providers":["email"]}',
  '{"full_name": "Sneha Kulal", "role": "participant", "usn": "4SC24EC061", "branch": "ECE", "phone": "9449921181"}',
  now(),
  now(),
  'authenticated',
  'authenticated'
) ON CONFLICT (id) DO UPDATE SET encrypted_password = crypt('12345678', gen_salt('bf'));

INSERT INTO public.users (
  id, email, full_name, usn, branch, phone, role
) VALUES (
  '00000000-0000-4000-8000-300000000061',
  'user61@gmail.com',
  'Sneha Kulal',
  '4SC24EC061',
  'ECE',
  '9449921181',
  'participant'
) ON CONFLICT (id) DO UPDATE SET
  full_name = EXCLUDED.full_name,
  usn = EXCLUDED.usn,
  branch = EXCLUDED.branch,
  role = EXCLUDED.role;


INSERT INTO auth.users (
  id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, updated_at, role, aud
) VALUES (
  '00000000-0000-4000-8000-300000000062',
  '00000000-0000-0000-0000-000000000000',
  'user62@gmail.com',
  crypt('12345678', gen_salt('bf')),
  now(),
  '{"provider":"email","providers":["email"]}',
  '{"full_name": "Kiran Reddy", "role": "participant", "usn": "4SC24ME062", "branch": "ME", "phone": "9348962221"}',
  now(),
  now(),
  'authenticated',
  'authenticated'
) ON CONFLICT (id) DO UPDATE SET encrypted_password = crypt('12345678', gen_salt('bf'));

INSERT INTO public.users (
  id, email, full_name, usn, branch, phone, role
) VALUES (
  '00000000-0000-4000-8000-300000000062',
  'user62@gmail.com',
  'Kiran Reddy',
  '4SC24ME062',
  'ME',
  '9348962221',
  'participant'
) ON CONFLICT (id) DO UPDATE SET
  full_name = EXCLUDED.full_name,
  usn = EXCLUDED.usn,
  branch = EXCLUDED.branch,
  role = EXCLUDED.role;


INSERT INTO auth.users (
  id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, updated_at, role, aud
) VALUES (
  '00000000-0000-4000-8000-300000000063',
  '00000000-0000-0000-0000-000000000000',
  'user63@gmail.com',
  crypt('12345678', gen_salt('bf')),
  now(),
  '{"provider":"email","providers":["email"]}',
  '{"full_name": "Sanjana Reddy", "role": "participant", "usn": "4SC24IS063", "branch": "ISE", "phone": "9831382577"}',
  now(),
  now(),
  'authenticated',
  'authenticated'
) ON CONFLICT (id) DO UPDATE SET encrypted_password = crypt('12345678', gen_salt('bf'));

INSERT INTO public.users (
  id, email, full_name, usn, branch, phone, role
) VALUES (
  '00000000-0000-4000-8000-300000000063',
  'user63@gmail.com',
  'Sanjana Reddy',
  '4SC24IS063',
  'ISE',
  '9831382577',
  'participant'
) ON CONFLICT (id) DO UPDATE SET
  full_name = EXCLUDED.full_name,
  usn = EXCLUDED.usn,
  branch = EXCLUDED.branch,
  role = EXCLUDED.role;


INSERT INTO auth.users (
  id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, updated_at, role, aud
) VALUES (
  '00000000-0000-4000-8000-300000000064',
  '00000000-0000-0000-0000-000000000000',
  'user64@gmail.com',
  crypt('12345678', gen_salt('bf')),
  now(),
  '{"provider":"email","providers":["email"]}',
  '{"full_name": "Harsha Bhat", "role": "participant", "usn": "4SC24EC064", "branch": "ECE", "phone": "9433287819"}',
  now(),
  now(),
  'authenticated',
  'authenticated'
) ON CONFLICT (id) DO UPDATE SET encrypted_password = crypt('12345678', gen_salt('bf'));

INSERT INTO public.users (
  id, email, full_name, usn, branch, phone, role
) VALUES (
  '00000000-0000-4000-8000-300000000064',
  'user64@gmail.com',
  'Harsha Bhat',
  '4SC24EC064',
  'ECE',
  '9433287819',
  'participant'
) ON CONFLICT (id) DO UPDATE SET
  full_name = EXCLUDED.full_name,
  usn = EXCLUDED.usn,
  branch = EXCLUDED.branch,
  role = EXCLUDED.role;


INSERT INTO auth.users (
  id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, updated_at, role, aud
) VALUES (
  '00000000-0000-4000-8000-300000000065',
  '00000000-0000-0000-0000-000000000000',
  'user65@gmail.com',
  crypt('12345678', gen_salt('bf')),
  now(),
  '{"provider":"email","providers":["email"]}',
  '{"full_name": "Keerthana Nair", "role": "participant", "usn": "4SC24AI065", "branch": "AIML", "phone": "9337691608"}',
  now(),
  now(),
  'authenticated',
  'authenticated'
) ON CONFLICT (id) DO UPDATE SET encrypted_password = crypt('12345678', gen_salt('bf'));

INSERT INTO public.users (
  id, email, full_name, usn, branch, phone, role
) VALUES (
  '00000000-0000-4000-8000-300000000065',
  'user65@gmail.com',
  'Keerthana Nair',
  '4SC24AI065',
  'AIML',
  '9337691608',
  'participant'
) ON CONFLICT (id) DO UPDATE SET
  full_name = EXCLUDED.full_name,
  usn = EXCLUDED.usn,
  branch = EXCLUDED.branch,
  role = EXCLUDED.role;


INSERT INTO auth.users (
  id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, updated_at, role, aud
) VALUES (
  '00000000-0000-4000-8000-300000000066',
  '00000000-0000-0000-0000-000000000000',
  'user66@gmail.com',
  crypt('12345678', gen_salt('bf')),
  now(),
  '{"provider":"email","providers":["email"]}',
  '{"full_name": "Harsha Kulal", "role": "participant", "usn": "4SC24IS066", "branch": "ISE", "phone": "9648065548"}',
  now(),
  now(),
  'authenticated',
  'authenticated'
) ON CONFLICT (id) DO UPDATE SET encrypted_password = crypt('12345678', gen_salt('bf'));

INSERT INTO public.users (
  id, email, full_name, usn, branch, phone, role
) VALUES (
  '00000000-0000-4000-8000-300000000066',
  'user66@gmail.com',
  'Harsha Kulal',
  '4SC24IS066',
  'ISE',
  '9648065548',
  'participant'
) ON CONFLICT (id) DO UPDATE SET
  full_name = EXCLUDED.full_name,
  usn = EXCLUDED.usn,
  branch = EXCLUDED.branch,
  role = EXCLUDED.role;


INSERT INTO auth.users (
  id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, updated_at, role, aud
) VALUES (
  '00000000-0000-4000-8000-300000000067',
  '00000000-0000-0000-0000-000000000000',
  'user67@gmail.com',
  crypt('12345678', gen_salt('bf')),
  now(),
  '{"provider":"email","providers":["email"]}',
  '{"full_name": "Keerthana Bhat", "role": "participant", "usn": "4SC24AI067", "branch": "AIML", "phone": "9589215610"}',
  now(),
  now(),
  'authenticated',
  'authenticated'
) ON CONFLICT (id) DO UPDATE SET encrypted_password = crypt('12345678', gen_salt('bf'));

INSERT INTO public.users (
  id, email, full_name, usn, branch, phone, role
) VALUES (
  '00000000-0000-4000-8000-300000000067',
  'user67@gmail.com',
  'Keerthana Bhat',
  '4SC24AI067',
  'AIML',
  '9589215610',
  'participant'
) ON CONFLICT (id) DO UPDATE SET
  full_name = EXCLUDED.full_name,
  usn = EXCLUDED.usn,
  branch = EXCLUDED.branch,
  role = EXCLUDED.role;


INSERT INTO auth.users (
  id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, updated_at, role, aud
) VALUES (
  '00000000-0000-4000-8000-300000000068',
  '00000000-0000-0000-0000-000000000000',
  'user68@gmail.com',
  crypt('12345678', gen_salt('bf')),
  now(),
  '{"provider":"email","providers":["email"]}',
  '{"full_name": "Deepak Naik", "role": "participant", "usn": "4SC24IS068", "branch": "ISE", "phone": "9719699798"}',
  now(),
  now(),
  'authenticated',
  'authenticated'
) ON CONFLICT (id) DO UPDATE SET encrypted_password = crypt('12345678', gen_salt('bf'));

INSERT INTO public.users (
  id, email, full_name, usn, branch, phone, role
) VALUES (
  '00000000-0000-4000-8000-300000000068',
  'user68@gmail.com',
  'Deepak Naik',
  '4SC24IS068',
  'ISE',
  '9719699798',
  'participant'
) ON CONFLICT (id) DO UPDATE SET
  full_name = EXCLUDED.full_name,
  usn = EXCLUDED.usn,
  branch = EXCLUDED.branch,
  role = EXCLUDED.role;


INSERT INTO auth.users (
  id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, updated_at, role, aud
) VALUES (
  '00000000-0000-4000-8000-300000000069',
  '00000000-0000-0000-0000-000000000000',
  'user69@gmail.com',
  crypt('12345678', gen_salt('bf')),
  now(),
  '{"provider":"email","providers":["email"]}',
  '{"full_name": "Deepak Gowda", "role": "participant", "usn": "4SC24AI069", "branch": "AIML", "phone": "9195586789"}',
  now(),
  now(),
  'authenticated',
  'authenticated'
) ON CONFLICT (id) DO UPDATE SET encrypted_password = crypt('12345678', gen_salt('bf'));

INSERT INTO public.users (
  id, email, full_name, usn, branch, phone, role
) VALUES (
  '00000000-0000-4000-8000-300000000069',
  'user69@gmail.com',
  'Deepak Gowda',
  '4SC24AI069',
  'AIML',
  '9195586789',
  'participant'
) ON CONFLICT (id) DO UPDATE SET
  full_name = EXCLUDED.full_name,
  usn = EXCLUDED.usn,
  branch = EXCLUDED.branch,
  role = EXCLUDED.role;


INSERT INTO auth.users (
  id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, updated_at, role, aud
) VALUES (
  '00000000-0000-4000-8000-300000000070',
  '00000000-0000-0000-0000-000000000000',
  'user70@gmail.com',
  crypt('12345678', gen_salt('bf')),
  now(),
  '{"provider":"email","providers":["email"]}',
  '{"full_name": "Deepak Bhat", "role": "participant", "usn": "4SC24IS070", "branch": "ISE", "phone": "9314473952"}',
  now(),
  now(),
  'authenticated',
  'authenticated'
) ON CONFLICT (id) DO UPDATE SET encrypted_password = crypt('12345678', gen_salt('bf'));

INSERT INTO public.users (
  id, email, full_name, usn, branch, phone, role
) VALUES (
  '00000000-0000-4000-8000-300000000070',
  'user70@gmail.com',
  'Deepak Bhat',
  '4SC24IS070',
  'ISE',
  '9314473952',
  'participant'
) ON CONFLICT (id) DO UPDATE SET
  full_name = EXCLUDED.full_name,
  usn = EXCLUDED.usn,
  branch = EXCLUDED.branch,
  role = EXCLUDED.role;


INSERT INTO auth.users (
  id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, updated_at, role, aud
) VALUES (
  '00000000-0000-4000-8000-300000000071',
  '00000000-0000-0000-0000-000000000000',
  'user71@gmail.com',
  crypt('12345678', gen_salt('bf')),
  now(),
  '{"provider":"email","providers":["email"]}',
  '{"full_name": "Priya Naik", "role": "participant", "usn": "4SC24CS071", "branch": "CSE", "phone": "9589000424"}',
  now(),
  now(),
  'authenticated',
  'authenticated'
) ON CONFLICT (id) DO UPDATE SET encrypted_password = crypt('12345678', gen_salt('bf'));

INSERT INTO public.users (
  id, email, full_name, usn, branch, phone, role
) VALUES (
  '00000000-0000-4000-8000-300000000071',
  'user71@gmail.com',
  'Priya Naik',
  '4SC24CS071',
  'CSE',
  '9589000424',
  'participant'
) ON CONFLICT (id) DO UPDATE SET
  full_name = EXCLUDED.full_name,
  usn = EXCLUDED.usn,
  branch = EXCLUDED.branch,
  role = EXCLUDED.role;


INSERT INTO auth.users (
  id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, updated_at, role, aud
) VALUES (
  '00000000-0000-4000-8000-300000000072',
  '00000000-0000-0000-0000-000000000000',
  'user72@gmail.com',
  crypt('12345678', gen_salt('bf')),
  now(),
  '{"provider":"email","providers":["email"]}',
  '{"full_name": "Priya Nair", "role": "participant", "usn": "4SC24ME072", "branch": "ME", "phone": "9450759597"}',
  now(),
  now(),
  'authenticated',
  'authenticated'
) ON CONFLICT (id) DO UPDATE SET encrypted_password = crypt('12345678', gen_salt('bf'));

INSERT INTO public.users (
  id, email, full_name, usn, branch, phone, role
) VALUES (
  '00000000-0000-4000-8000-300000000072',
  'user72@gmail.com',
  'Priya Nair',
  '4SC24ME072',
  'ME',
  '9450759597',
  'participant'
) ON CONFLICT (id) DO UPDATE SET
  full_name = EXCLUDED.full_name,
  usn = EXCLUDED.usn,
  branch = EXCLUDED.branch,
  role = EXCLUDED.role;


INSERT INTO auth.users (
  id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, updated_at, role, aud
) VALUES (
  '00000000-0000-4000-8000-300000000073',
  '00000000-0000-0000-0000-000000000000',
  'user73@gmail.com',
  crypt('12345678', gen_salt('bf')),
  now(),
  '{"provider":"email","providers":["email"]}',
  '{"full_name": "Keerthana Gowda", "role": "participant", "usn": "4SC24CS073", "branch": "CSE", "phone": "9621284509"}',
  now(),
  now(),
  'authenticated',
  'authenticated'
) ON CONFLICT (id) DO UPDATE SET encrypted_password = crypt('12345678', gen_salt('bf'));

INSERT INTO public.users (
  id, email, full_name, usn, branch, phone, role
) VALUES (
  '00000000-0000-4000-8000-300000000073',
  'user73@gmail.com',
  'Keerthana Gowda',
  '4SC24CS073',
  'CSE',
  '9621284509',
  'participant'
) ON CONFLICT (id) DO UPDATE SET
  full_name = EXCLUDED.full_name,
  usn = EXCLUDED.usn,
  branch = EXCLUDED.branch,
  role = EXCLUDED.role;


INSERT INTO auth.users (
  id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, updated_at, role, aud
) VALUES (
  '00000000-0000-4000-8000-300000000074',
  '00000000-0000-0000-0000-000000000000',
  'user74@gmail.com',
  crypt('12345678', gen_salt('bf')),
  now(),
  '{"provider":"email","providers":["email"]}',
  '{"full_name": "Rohan Kumar", "role": "participant", "usn": "4SC24IS074", "branch": "ISE", "phone": "9986258962"}',
  now(),
  now(),
  'authenticated',
  'authenticated'
) ON CONFLICT (id) DO UPDATE SET encrypted_password = crypt('12345678', gen_salt('bf'));

INSERT INTO public.users (
  id, email, full_name, usn, branch, phone, role
) VALUES (
  '00000000-0000-4000-8000-300000000074',
  'user74@gmail.com',
  'Rohan Kumar',
  '4SC24IS074',
  'ISE',
  '9986258962',
  'participant'
) ON CONFLICT (id) DO UPDATE SET
  full_name = EXCLUDED.full_name,
  usn = EXCLUDED.usn,
  branch = EXCLUDED.branch,
  role = EXCLUDED.role;


INSERT INTO auth.users (
  id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, updated_at, role, aud
) VALUES (
  '00000000-0000-4000-8000-300000000075',
  '00000000-0000-0000-0000-000000000000',
  'user75@gmail.com',
  crypt('12345678', gen_salt('bf')),
  now(),
  '{"provider":"email","providers":["email"]}',
  '{"full_name": "Priya Shetty", "role": "participant", "usn": "4SC24IS075", "branch": "ISE", "phone": "9433131639"}',
  now(),
  now(),
  'authenticated',
  'authenticated'
) ON CONFLICT (id) DO UPDATE SET encrypted_password = crypt('12345678', gen_salt('bf'));

INSERT INTO public.users (
  id, email, full_name, usn, branch, phone, role
) VALUES (
  '00000000-0000-4000-8000-300000000075',
  'user75@gmail.com',
  'Priya Shetty',
  '4SC24IS075',
  'ISE',
  '9433131639',
  'participant'
) ON CONFLICT (id) DO UPDATE SET
  full_name = EXCLUDED.full_name,
  usn = EXCLUDED.usn,
  branch = EXCLUDED.branch,
  role = EXCLUDED.role;


INSERT INTO auth.users (
  id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, updated_at, role, aud
) VALUES (
  '00000000-0000-4000-8000-300000000076',
  '00000000-0000-0000-0000-000000000000',
  'user76@gmail.com',
  crypt('12345678', gen_salt('bf')),
  now(),
  '{"provider":"email","providers":["email"]}',
  '{"full_name": "Rohan Kulal", "role": "participant", "usn": "4SC24ME076", "branch": "ME", "phone": "9142790752"}',
  now(),
  now(),
  'authenticated',
  'authenticated'
) ON CONFLICT (id) DO UPDATE SET encrypted_password = crypt('12345678', gen_salt('bf'));

INSERT INTO public.users (
  id, email, full_name, usn, branch, phone, role
) VALUES (
  '00000000-0000-4000-8000-300000000076',
  'user76@gmail.com',
  'Rohan Kulal',
  '4SC24ME076',
  'ME',
  '9142790752',
  'participant'
) ON CONFLICT (id) DO UPDATE SET
  full_name = EXCLUDED.full_name,
  usn = EXCLUDED.usn,
  branch = EXCLUDED.branch,
  role = EXCLUDED.role;


INSERT INTO auth.users (
  id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, updated_at, role, aud
) VALUES (
  '00000000-0000-4000-8000-300000000077',
  '00000000-0000-0000-0000-000000000000',
  'user77@gmail.com',
  crypt('12345678', gen_salt('bf')),
  now(),
  '{"provider":"email","providers":["email"]}',
  '{"full_name": "Pooja Nair", "role": "participant", "usn": "4SC24IS077", "branch": "ISE", "phone": "9215865298"}',
  now(),
  now(),
  'authenticated',
  'authenticated'
) ON CONFLICT (id) DO UPDATE SET encrypted_password = crypt('12345678', gen_salt('bf'));

INSERT INTO public.users (
  id, email, full_name, usn, branch, phone, role
) VALUES (
  '00000000-0000-4000-8000-300000000077',
  'user77@gmail.com',
  'Pooja Nair',
  '4SC24IS077',
  'ISE',
  '9215865298',
  'participant'
) ON CONFLICT (id) DO UPDATE SET
  full_name = EXCLUDED.full_name,
  usn = EXCLUDED.usn,
  branch = EXCLUDED.branch,
  role = EXCLUDED.role;


INSERT INTO auth.users (
  id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, updated_at, role, aud
) VALUES (
  '00000000-0000-4000-8000-300000000078',
  '00000000-0000-0000-0000-000000000000',
  'user78@gmail.com',
  crypt('12345678', gen_salt('bf')),
  now(),
  '{"provider":"email","providers":["email"]}',
  '{"full_name": "Akhil Shetty", "role": "participant", "usn": "4SC24AI078", "branch": "AIML", "phone": "9511181816"}',
  now(),
  now(),
  'authenticated',
  'authenticated'
) ON CONFLICT (id) DO UPDATE SET encrypted_password = crypt('12345678', gen_salt('bf'));

INSERT INTO public.users (
  id, email, full_name, usn, branch, phone, role
) VALUES (
  '00000000-0000-4000-8000-300000000078',
  'user78@gmail.com',
  'Akhil Shetty',
  '4SC24AI078',
  'AIML',
  '9511181816',
  'participant'
) ON CONFLICT (id) DO UPDATE SET
  full_name = EXCLUDED.full_name,
  usn = EXCLUDED.usn,
  branch = EXCLUDED.branch,
  role = EXCLUDED.role;


INSERT INTO auth.users (
  id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, updated_at, role, aud
) VALUES (
  '00000000-0000-4000-8000-300000000079',
  '00000000-0000-0000-0000-000000000000',
  'user79@gmail.com',
  crypt('12345678', gen_salt('bf')),
  now(),
  '{"provider":"email","providers":["email"]}',
  '{"full_name": "Pooja Rao", "role": "participant", "usn": "4SC24ME079", "branch": "ME", "phone": "9468715704"}',
  now(),
  now(),
  'authenticated',
  'authenticated'
) ON CONFLICT (id) DO UPDATE SET encrypted_password = crypt('12345678', gen_salt('bf'));

INSERT INTO public.users (
  id, email, full_name, usn, branch, phone, role
) VALUES (
  '00000000-0000-4000-8000-300000000079',
  'user79@gmail.com',
  'Pooja Rao',
  '4SC24ME079',
  'ME',
  '9468715704',
  'participant'
) ON CONFLICT (id) DO UPDATE SET
  full_name = EXCLUDED.full_name,
  usn = EXCLUDED.usn,
  branch = EXCLUDED.branch,
  role = EXCLUDED.role;


INSERT INTO auth.users (
  id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, updated_at, role, aud
) VALUES (
  '00000000-0000-4000-8000-300000000080',
  '00000000-0000-0000-0000-000000000000',
  'user80@gmail.com',
  crypt('12345678', gen_salt('bf')),
  now(),
  '{"provider":"email","providers":["email"]}',
  '{"full_name": "Aditya Patil", "role": "participant", "usn": "4SC24CS080", "branch": "CSE", "phone": "9906426158"}',
  now(),
  now(),
  'authenticated',
  'authenticated'
) ON CONFLICT (id) DO UPDATE SET encrypted_password = crypt('12345678', gen_salt('bf'));

INSERT INTO public.users (
  id, email, full_name, usn, branch, phone, role
) VALUES (
  '00000000-0000-4000-8000-300000000080',
  'user80@gmail.com',
  'Aditya Patil',
  '4SC24CS080',
  'CSE',
  '9906426158',
  'participant'
) ON CONFLICT (id) DO UPDATE SET
  full_name = EXCLUDED.full_name,
  usn = EXCLUDED.usn,
  branch = EXCLUDED.branch,
  role = EXCLUDED.role;


INSERT INTO auth.users (
  id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, updated_at, role, aud
) VALUES (
  '00000000-0000-4000-8000-300000000081',
  '00000000-0000-0000-0000-000000000000',
  'user81@gmail.com',
  crypt('12345678', gen_salt('bf')),
  now(),
  '{"provider":"email","providers":["email"]}',
  '{"full_name": "Pooja Kulal", "role": "participant", "usn": "4SC24CS081", "branch": "CSE", "phone": "9962174384"}',
  now(),
  now(),
  'authenticated',
  'authenticated'
) ON CONFLICT (id) DO UPDATE SET encrypted_password = crypt('12345678', gen_salt('bf'));

INSERT INTO public.users (
  id, email, full_name, usn, branch, phone, role
) VALUES (
  '00000000-0000-4000-8000-300000000081',
  'user81@gmail.com',
  'Pooja Kulal',
  '4SC24CS081',
  'CSE',
  '9962174384',
  'participant'
) ON CONFLICT (id) DO UPDATE SET
  full_name = EXCLUDED.full_name,
  usn = EXCLUDED.usn,
  branch = EXCLUDED.branch,
  role = EXCLUDED.role;


INSERT INTO auth.users (
  id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, updated_at, role, aud
) VALUES (
  '00000000-0000-4000-8000-300000000082',
  '00000000-0000-0000-0000-000000000000',
  'user82@gmail.com',
  crypt('12345678', gen_salt('bf')),
  now(),
  '{"provider":"email","providers":["email"]}',
  '{"full_name": "Keerthana Gowda", "role": "participant", "usn": "4SC24AI082", "branch": "AIML", "phone": "9374071308"}',
  now(),
  now(),
  'authenticated',
  'authenticated'
) ON CONFLICT (id) DO UPDATE SET encrypted_password = crypt('12345678', gen_salt('bf'));

INSERT INTO public.users (
  id, email, full_name, usn, branch, phone, role
) VALUES (
  '00000000-0000-4000-8000-300000000082',
  'user82@gmail.com',
  'Keerthana Gowda',
  '4SC24AI082',
  'AIML',
  '9374071308',
  'participant'
) ON CONFLICT (id) DO UPDATE SET
  full_name = EXCLUDED.full_name,
  usn = EXCLUDED.usn,
  branch = EXCLUDED.branch,
  role = EXCLUDED.role;


INSERT INTO auth.users (
  id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, updated_at, role, aud
) VALUES (
  '00000000-0000-4000-8000-300000000083',
  '00000000-0000-0000-0000-000000000000',
  'user83@gmail.com',
  crypt('12345678', gen_salt('bf')),
  now(),
  '{"provider":"email","providers":["email"]}',
  '{"full_name": "Kiran Nair", "role": "participant", "usn": "4SC24IS083", "branch": "ISE", "phone": "9538160433"}',
  now(),
  now(),
  'authenticated',
  'authenticated'
) ON CONFLICT (id) DO UPDATE SET encrypted_password = crypt('12345678', gen_salt('bf'));

INSERT INTO public.users (
  id, email, full_name, usn, branch, phone, role
) VALUES (
  '00000000-0000-4000-8000-300000000083',
  'user83@gmail.com',
  'Kiran Nair',
  '4SC24IS083',
  'ISE',
  '9538160433',
  'participant'
) ON CONFLICT (id) DO UPDATE SET
  full_name = EXCLUDED.full_name,
  usn = EXCLUDED.usn,
  branch = EXCLUDED.branch,
  role = EXCLUDED.role;


INSERT INTO auth.users (
  id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, updated_at, role, aud
) VALUES (
  '00000000-0000-4000-8000-300000000084',
  '00000000-0000-0000-0000-000000000000',
  'user84@gmail.com',
  crypt('12345678', gen_salt('bf')),
  now(),
  '{"provider":"email","providers":["email"]}',
  '{"full_name": "Megha Gowda", "role": "participant", "usn": "4SC24IS084", "branch": "ISE", "phone": "9616156213"}',
  now(),
  now(),
  'authenticated',
  'authenticated'
) ON CONFLICT (id) DO UPDATE SET encrypted_password = crypt('12345678', gen_salt('bf'));

INSERT INTO public.users (
  id, email, full_name, usn, branch, phone, role
) VALUES (
  '00000000-0000-4000-8000-300000000084',
  'user84@gmail.com',
  'Megha Gowda',
  '4SC24IS084',
  'ISE',
  '9616156213',
  'participant'
) ON CONFLICT (id) DO UPDATE SET
  full_name = EXCLUDED.full_name,
  usn = EXCLUDED.usn,
  branch = EXCLUDED.branch,
  role = EXCLUDED.role;


INSERT INTO auth.users (
  id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, updated_at, role, aud
) VALUES (
  '00000000-0000-4000-8000-300000000085',
  '00000000-0000-0000-0000-000000000000',
  'user85@gmail.com',
  crypt('12345678', gen_salt('bf')),
  now(),
  '{"provider":"email","providers":["email"]}',
  '{"full_name": "Ananya Kumar", "role": "participant", "usn": "4SC24ME085", "branch": "ME", "phone": "9462602236"}',
  now(),
  now(),
  'authenticated',
  'authenticated'
) ON CONFLICT (id) DO UPDATE SET encrypted_password = crypt('12345678', gen_salt('bf'));

INSERT INTO public.users (
  id, email, full_name, usn, branch, phone, role
) VALUES (
  '00000000-0000-4000-8000-300000000085',
  'user85@gmail.com',
  'Ananya Kumar',
  '4SC24ME085',
  'ME',
  '9462602236',
  'participant'
) ON CONFLICT (id) DO UPDATE SET
  full_name = EXCLUDED.full_name,
  usn = EXCLUDED.usn,
  branch = EXCLUDED.branch,
  role = EXCLUDED.role;


INSERT INTO auth.users (
  id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, updated_at, role, aud
) VALUES (
  '00000000-0000-4000-8000-300000000086',
  '00000000-0000-0000-0000-000000000000',
  'user86@gmail.com',
  crypt('12345678', gen_salt('bf')),
  now(),
  '{"provider":"email","providers":["email"]}',
  '{"full_name": "Varun Reddy", "role": "participant", "usn": "4SC24CS086", "branch": "CSE", "phone": "9347641673"}',
  now(),
  now(),
  'authenticated',
  'authenticated'
) ON CONFLICT (id) DO UPDATE SET encrypted_password = crypt('12345678', gen_salt('bf'));

INSERT INTO public.users (
  id, email, full_name, usn, branch, phone, role
) VALUES (
  '00000000-0000-4000-8000-300000000086',
  'user86@gmail.com',
  'Varun Reddy',
  '4SC24CS086',
  'CSE',
  '9347641673',
  'participant'
) ON CONFLICT (id) DO UPDATE SET
  full_name = EXCLUDED.full_name,
  usn = EXCLUDED.usn,
  branch = EXCLUDED.branch,
  role = EXCLUDED.role;


INSERT INTO auth.users (
  id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, updated_at, role, aud
) VALUES (
  '00000000-0000-4000-8000-300000000087',
  '00000000-0000-0000-0000-000000000000',
  'user87@gmail.com',
  crypt('12345678', gen_salt('bf')),
  now(),
  '{"provider":"email","providers":["email"]}',
  '{"full_name": "Kiran Naik", "role": "participant", "usn": "4SC24EC087", "branch": "ECE", "phone": "9711350561"}',
  now(),
  now(),
  'authenticated',
  'authenticated'
) ON CONFLICT (id) DO UPDATE SET encrypted_password = crypt('12345678', gen_salt('bf'));

INSERT INTO public.users (
  id, email, full_name, usn, branch, phone, role
) VALUES (
  '00000000-0000-4000-8000-300000000087',
  'user87@gmail.com',
  'Kiran Naik',
  '4SC24EC087',
  'ECE',
  '9711350561',
  'participant'
) ON CONFLICT (id) DO UPDATE SET
  full_name = EXCLUDED.full_name,
  usn = EXCLUDED.usn,
  branch = EXCLUDED.branch,
  role = EXCLUDED.role;


INSERT INTO auth.users (
  id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, updated_at, role, aud
) VALUES (
  '00000000-0000-4000-8000-300000000088',
  '00000000-0000-0000-0000-000000000000',
  'user88@gmail.com',
  crypt('12345678', gen_salt('bf')),
  now(),
  '{"provider":"email","providers":["email"]}',
  '{"full_name": "Arjun Kumar", "role": "participant", "usn": "4SC24AI088", "branch": "AIML", "phone": "9414577324"}',
  now(),
  now(),
  'authenticated',
  'authenticated'
) ON CONFLICT (id) DO UPDATE SET encrypted_password = crypt('12345678', gen_salt('bf'));

INSERT INTO public.users (
  id, email, full_name, usn, branch, phone, role
) VALUES (
  '00000000-0000-4000-8000-300000000088',
  'user88@gmail.com',
  'Arjun Kumar',
  '4SC24AI088',
  'AIML',
  '9414577324',
  'participant'
) ON CONFLICT (id) DO UPDATE SET
  full_name = EXCLUDED.full_name,
  usn = EXCLUDED.usn,
  branch = EXCLUDED.branch,
  role = EXCLUDED.role;


INSERT INTO auth.users (
  id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, updated_at, role, aud
) VALUES (
  '00000000-0000-4000-8000-300000000089',
  '00000000-0000-0000-0000-000000000000',
  'user89@gmail.com',
  crypt('12345678', gen_salt('bf')),
  now(),
  '{"provider":"email","providers":["email"]}',
  '{"full_name": "Sanjana Reddy", "role": "participant", "usn": "4SC24CS089", "branch": "CSE", "phone": "9659743230"}',
  now(),
  now(),
  'authenticated',
  'authenticated'
) ON CONFLICT (id) DO UPDATE SET encrypted_password = crypt('12345678', gen_salt('bf'));

INSERT INTO public.users (
  id, email, full_name, usn, branch, phone, role
) VALUES (
  '00000000-0000-4000-8000-300000000089',
  'user89@gmail.com',
  'Sanjana Reddy',
  '4SC24CS089',
  'CSE',
  '9659743230',
  'participant'
) ON CONFLICT (id) DO UPDATE SET
  full_name = EXCLUDED.full_name,
  usn = EXCLUDED.usn,
  branch = EXCLUDED.branch,
  role = EXCLUDED.role;


INSERT INTO auth.users (
  id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, updated_at, role, aud
) VALUES (
  '00000000-0000-4000-8000-300000000090',
  '00000000-0000-0000-0000-000000000000',
  'user90@gmail.com',
  crypt('12345678', gen_salt('bf')),
  now(),
  '{"provider":"email","providers":["email"]}',
  '{"full_name": "Akhil Rao", "role": "participant", "usn": "4SC24CS090", "branch": "CSE", "phone": "9853890038"}',
  now(),
  now(),
  'authenticated',
  'authenticated'
) ON CONFLICT (id) DO UPDATE SET encrypted_password = crypt('12345678', gen_salt('bf'));

INSERT INTO public.users (
  id, email, full_name, usn, branch, phone, role
) VALUES (
  '00000000-0000-4000-8000-300000000090',
  'user90@gmail.com',
  'Akhil Rao',
  '4SC24CS090',
  'CSE',
  '9853890038',
  'participant'
) ON CONFLICT (id) DO UPDATE SET
  full_name = EXCLUDED.full_name,
  usn = EXCLUDED.usn,
  branch = EXCLUDED.branch,
  role = EXCLUDED.role;


INSERT INTO auth.users (
  id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, updated_at, role, aud
) VALUES (
  '00000000-0000-4000-8000-300000000091',
  '00000000-0000-0000-0000-000000000000',
  'user91@gmail.com',
  crypt('12345678', gen_salt('bf')),
  now(),
  '{"provider":"email","providers":["email"]}',
  '{"full_name": "Nikhil Patil", "role": "participant", "usn": "4SC24CS091", "branch": "CSE", "phone": "9696350225"}',
  now(),
  now(),
  'authenticated',
  'authenticated'
) ON CONFLICT (id) DO UPDATE SET encrypted_password = crypt('12345678', gen_salt('bf'));

INSERT INTO public.users (
  id, email, full_name, usn, branch, phone, role
) VALUES (
  '00000000-0000-4000-8000-300000000091',
  'user91@gmail.com',
  'Nikhil Patil',
  '4SC24CS091',
  'CSE',
  '9696350225',
  'participant'
) ON CONFLICT (id) DO UPDATE SET
  full_name = EXCLUDED.full_name,
  usn = EXCLUDED.usn,
  branch = EXCLUDED.branch,
  role = EXCLUDED.role;


INSERT INTO auth.users (
  id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, updated_at, role, aud
) VALUES (
  '00000000-0000-4000-8000-300000000092',
  '00000000-0000-0000-0000-000000000000',
  'user92@gmail.com',
  crypt('12345678', gen_salt('bf')),
  now(),
  '{"provider":"email","providers":["email"]}',
  '{"full_name": "Ananya Kulal", "role": "participant", "usn": "4SC24ME092", "branch": "ME", "phone": "9649470915"}',
  now(),
  now(),
  'authenticated',
  'authenticated'
) ON CONFLICT (id) DO UPDATE SET encrypted_password = crypt('12345678', gen_salt('bf'));

INSERT INTO public.users (
  id, email, full_name, usn, branch, phone, role
) VALUES (
  '00000000-0000-4000-8000-300000000092',
  'user92@gmail.com',
  'Ananya Kulal',
  '4SC24ME092',
  'ME',
  '9649470915',
  'participant'
) ON CONFLICT (id) DO UPDATE SET
  full_name = EXCLUDED.full_name,
  usn = EXCLUDED.usn,
  branch = EXCLUDED.branch,
  role = EXCLUDED.role;


INSERT INTO auth.users (
  id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, updated_at, role, aud
) VALUES (
  '00000000-0000-4000-8000-300000000093',
  '00000000-0000-0000-0000-000000000000',
  'user93@gmail.com',
  crypt('12345678', gen_salt('bf')),
  now(),
  '{"provider":"email","providers":["email"]}',
  '{"full_name": "Pooja Patil", "role": "participant", "usn": "4SC24ME093", "branch": "ME", "phone": "9615837894"}',
  now(),
  now(),
  'authenticated',
  'authenticated'
) ON CONFLICT (id) DO UPDATE SET encrypted_password = crypt('12345678', gen_salt('bf'));

INSERT INTO public.users (
  id, email, full_name, usn, branch, phone, role
) VALUES (
  '00000000-0000-4000-8000-300000000093',
  'user93@gmail.com',
  'Pooja Patil',
  '4SC24ME093',
  'ME',
  '9615837894',
  'participant'
) ON CONFLICT (id) DO UPDATE SET
  full_name = EXCLUDED.full_name,
  usn = EXCLUDED.usn,
  branch = EXCLUDED.branch,
  role = EXCLUDED.role;


INSERT INTO auth.users (
  id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, updated_at, role, aud
) VALUES (
  '00000000-0000-4000-8000-300000000094',
  '00000000-0000-0000-0000-000000000000',
  'user94@gmail.com',
  crypt('12345678', gen_salt('bf')),
  now(),
  '{"provider":"email","providers":["email"]}',
  '{"full_name": "Arjun Gowda", "role": "participant", "usn": "4SC24AI094", "branch": "AIML", "phone": "9735940568"}',
  now(),
  now(),
  'authenticated',
  'authenticated'
) ON CONFLICT (id) DO UPDATE SET encrypted_password = crypt('12345678', gen_salt('bf'));

INSERT INTO public.users (
  id, email, full_name, usn, branch, phone, role
) VALUES (
  '00000000-0000-4000-8000-300000000094',
  'user94@gmail.com',
  'Arjun Gowda',
  '4SC24AI094',
  'AIML',
  '9735940568',
  'participant'
) ON CONFLICT (id) DO UPDATE SET
  full_name = EXCLUDED.full_name,
  usn = EXCLUDED.usn,
  branch = EXCLUDED.branch,
  role = EXCLUDED.role;


INSERT INTO auth.users (
  id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, updated_at, role, aud
) VALUES (
  '00000000-0000-4000-8000-300000000095',
  '00000000-0000-0000-0000-000000000000',
  'user95@gmail.com',
  crypt('12345678', gen_salt('bf')),
  now(),
  '{"provider":"email","providers":["email"]}',
  '{"full_name": "Harsha Reddy", "role": "participant", "usn": "4SC24IS095", "branch": "ISE", "phone": "9727687121"}',
  now(),
  now(),
  'authenticated',
  'authenticated'
) ON CONFLICT (id) DO UPDATE SET encrypted_password = crypt('12345678', gen_salt('bf'));

INSERT INTO public.users (
  id, email, full_name, usn, branch, phone, role
) VALUES (
  '00000000-0000-4000-8000-300000000095',
  'user95@gmail.com',
  'Harsha Reddy',
  '4SC24IS095',
  'ISE',
  '9727687121',
  'participant'
) ON CONFLICT (id) DO UPDATE SET
  full_name = EXCLUDED.full_name,
  usn = EXCLUDED.usn,
  branch = EXCLUDED.branch,
  role = EXCLUDED.role;


INSERT INTO auth.users (
  id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, updated_at, role, aud
) VALUES (
  '00000000-0000-4000-8000-300000000096',
  '00000000-0000-0000-0000-000000000000',
  'user96@gmail.com',
  crypt('12345678', gen_salt('bf')),
  now(),
  '{"provider":"email","providers":["email"]}',
  '{"full_name": "Varun Patil", "role": "participant", "usn": "4SC24EC096", "branch": "ECE", "phone": "9531277565"}',
  now(),
  now(),
  'authenticated',
  'authenticated'
) ON CONFLICT (id) DO UPDATE SET encrypted_password = crypt('12345678', gen_salt('bf'));

INSERT INTO public.users (
  id, email, full_name, usn, branch, phone, role
) VALUES (
  '00000000-0000-4000-8000-300000000096',
  'user96@gmail.com',
  'Varun Patil',
  '4SC24EC096',
  'ECE',
  '9531277565',
  'participant'
) ON CONFLICT (id) DO UPDATE SET
  full_name = EXCLUDED.full_name,
  usn = EXCLUDED.usn,
  branch = EXCLUDED.branch,
  role = EXCLUDED.role;


INSERT INTO auth.users (
  id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, updated_at, role, aud
) VALUES (
  '00000000-0000-4000-8000-300000000097',
  '00000000-0000-0000-0000-000000000000',
  'user97@gmail.com',
  crypt('12345678', gen_salt('bf')),
  now(),
  '{"provider":"email","providers":["email"]}',
  '{"full_name": "Nikhil Bhat", "role": "participant", "usn": "4SC24AI097", "branch": "AIML", "phone": "9242144285"}',
  now(),
  now(),
  'authenticated',
  'authenticated'
) ON CONFLICT (id) DO UPDATE SET encrypted_password = crypt('12345678', gen_salt('bf'));

INSERT INTO public.users (
  id, email, full_name, usn, branch, phone, role
) VALUES (
  '00000000-0000-4000-8000-300000000097',
  'user97@gmail.com',
  'Nikhil Bhat',
  '4SC24AI097',
  'AIML',
  '9242144285',
  'participant'
) ON CONFLICT (id) DO UPDATE SET
  full_name = EXCLUDED.full_name,
  usn = EXCLUDED.usn,
  branch = EXCLUDED.branch,
  role = EXCLUDED.role;


INSERT INTO auth.users (
  id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, updated_at, role, aud
) VALUES (
  '00000000-0000-4000-8000-300000000098',
  '00000000-0000-0000-0000-000000000000',
  'user98@gmail.com',
  crypt('12345678', gen_salt('bf')),
  now(),
  '{"provider":"email","providers":["email"]}',
  '{"full_name": "Akhil Naik", "role": "participant", "usn": "4SC24ME098", "branch": "ME", "phone": "9453798498"}',
  now(),
  now(),
  'authenticated',
  'authenticated'
) ON CONFLICT (id) DO UPDATE SET encrypted_password = crypt('12345678', gen_salt('bf'));

INSERT INTO public.users (
  id, email, full_name, usn, branch, phone, role
) VALUES (
  '00000000-0000-4000-8000-300000000098',
  'user98@gmail.com',
  'Akhil Naik',
  '4SC24ME098',
  'ME',
  '9453798498',
  'participant'
) ON CONFLICT (id) DO UPDATE SET
  full_name = EXCLUDED.full_name,
  usn = EXCLUDED.usn,
  branch = EXCLUDED.branch,
  role = EXCLUDED.role;


INSERT INTO auth.users (
  id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, updated_at, role, aud
) VALUES (
  '00000000-0000-4000-8000-300000000099',
  '00000000-0000-0000-0000-000000000000',
  'user99@gmail.com',
  crypt('12345678', gen_salt('bf')),
  now(),
  '{"provider":"email","providers":["email"]}',
  '{"full_name": "Megha Gowda", "role": "participant", "usn": "4SC24EC099", "branch": "ECE", "phone": "9174808149"}',
  now(),
  now(),
  'authenticated',
  'authenticated'
) ON CONFLICT (id) DO UPDATE SET encrypted_password = crypt('12345678', gen_salt('bf'));

INSERT INTO public.users (
  id, email, full_name, usn, branch, phone, role
) VALUES (
  '00000000-0000-4000-8000-300000000099',
  'user99@gmail.com',
  'Megha Gowda',
  '4SC24EC099',
  'ECE',
  '9174808149',
  'participant'
) ON CONFLICT (id) DO UPDATE SET
  full_name = EXCLUDED.full_name,
  usn = EXCLUDED.usn,
  branch = EXCLUDED.branch,
  role = EXCLUDED.role;


INSERT INTO auth.users (
  id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, updated_at, role, aud
) VALUES (
  '00000000-0000-4000-8000-300000000100',
  '00000000-0000-0000-0000-000000000000',
  'user100@gmail.com',
  crypt('12345678', gen_salt('bf')),
  now(),
  '{"provider":"email","providers":["email"]}',
  '{"full_name": "Rohan Reddy", "role": "participant", "usn": "4SC24EC100", "branch": "ECE", "phone": "9385836647"}',
  now(),
  now(),
  'authenticated',
  'authenticated'
) ON CONFLICT (id) DO UPDATE SET encrypted_password = crypt('12345678', gen_salt('bf'));

INSERT INTO public.users (
  id, email, full_name, usn, branch, phone, role
) VALUES (
  '00000000-0000-4000-8000-300000000100',
  'user100@gmail.com',
  'Rohan Reddy',
  '4SC24EC100',
  'ECE',
  '9385836647',
  'participant'
) ON CONFLICT (id) DO UPDATE SET
  full_name = EXCLUDED.full_name,
  usn = EXCLUDED.usn,
  branch = EXCLUDED.branch,
  role = EXCLUDED.role;


INSERT INTO public.events (
  id, title, description, location, venue, start_time, end_time, capacity, organizer_id, status, is_registration_open
) VALUES (
  '00000000-0000-4000-8000-400000000001',
  'AI Hackathon',
  'Official campus event: AI Hackathon. Join talks, interactive sessions, and practical track activities.',
  'Main Campus',
  'Seminar Hall 1',
  '2026-08-06T09:00:00.000Z',
  '2026-08-06T17:00:00.000Z',
  210,
  '00000000-0000-4000-8000-100000000001',
  'published',
  TRUE
) ON CONFLICT (id) DO NOTHING;


INSERT INTO public.events (
  id, title, description, location, venue, start_time, end_time, capacity, organizer_id, status, is_registration_open
) VALUES (
  '00000000-0000-4000-8000-400000000002',
  'Web Development Workshop',
  'Official campus event: Web Development Workshop. Join talks, interactive sessions, and practical track activities.',
  'Main Campus',
  'Seminar Hall 2',
  '2026-08-09T09:00:00.000Z',
  '2026-08-09T17:00:00.000Z',
  220,
  '00000000-0000-4000-8000-100000000002',
  'published',
  TRUE
) ON CONFLICT (id) DO NOTHING;


INSERT INTO public.events (
  id, title, description, location, venue, start_time, end_time, capacity, organizer_id, status, is_registration_open
) VALUES (
  '00000000-0000-4000-8000-400000000003',
  'Cyber Security Bootcamp',
  'Official campus event: Cyber Security Bootcamp. Join talks, interactive sessions, and practical track activities.',
  'Main Campus',
  'Seminar Hall 3',
  '2026-08-12T09:00:00.000Z',
  '2026-08-12T17:00:00.000Z',
  230,
  '00000000-0000-4000-8000-100000000003',
  'published',
  TRUE
) ON CONFLICT (id) DO NOTHING;


INSERT INTO public.events (
  id, title, description, location, venue, start_time, end_time, capacity, organizer_id, status, is_registration_open
) VALUES (
  '00000000-0000-4000-8000-400000000004',
  'Data Science Summit',
  'Official campus event: Data Science Summit. Join talks, interactive sessions, and practical track activities.',
  'Main Campus',
  'Seminar Hall 4',
  '2026-08-15T09:00:00.000Z',
  '2026-08-15T17:00:00.000Z',
  240,
  '00000000-0000-4000-8000-100000000004',
  'published',
  TRUE
) ON CONFLICT (id) DO NOTHING;


INSERT INTO public.events (
  id, title, description, location, venue, start_time, end_time, capacity, organizer_id, status, is_registration_open
) VALUES (
  '00000000-0000-4000-8000-400000000005',
  'Cloud Computing',
  'Official campus event: Cloud Computing. Join talks, interactive sessions, and practical track activities.',
  'Main Campus',
  'Seminar Hall 5',
  '2026-08-18T09:00:00.000Z',
  '2026-08-18T17:00:00.000Z',
  250,
  '00000000-0000-4000-8000-100000000005',
  'published',
  TRUE
) ON CONFLICT (id) DO NOTHING;


INSERT INTO public.events (
  id, title, description, location, venue, start_time, end_time, capacity, organizer_id, status, is_registration_open
) VALUES (
  '00000000-0000-4000-8000-400000000006',
  'ML Workshop',
  'Official campus event: ML Workshop. Join talks, interactive sessions, and practical track activities.',
  'Main Campus',
  'Seminar Hall 6',
  '2026-08-21T09:00:00.000Z',
  '2026-08-21T17:00:00.000Z',
  260,
  '00000000-0000-4000-8000-100000000001',
  'published',
  TRUE
) ON CONFLICT (id) DO NOTHING;


INSERT INTO public.events (
  id, title, description, location, venue, start_time, end_time, capacity, organizer_id, status, is_registration_open
) VALUES (
  '00000000-0000-4000-8000-400000000007',
  'UI UX Sprint',
  'Official campus event: UI UX Sprint. Join talks, interactive sessions, and practical track activities.',
  'Main Campus',
  'Seminar Hall 7',
  '2026-08-24T09:00:00.000Z',
  '2026-08-24T17:00:00.000Z',
  270,
  '00000000-0000-4000-8000-100000000002',
  'published',
  TRUE
) ON CONFLICT (id) DO NOTHING;


INSERT INTO public.events (
  id, title, description, location, venue, start_time, end_time, capacity, organizer_id, status, is_registration_open
) VALUES (
  '00000000-0000-4000-8000-400000000008',
  'IoT Expo',
  'Official campus event: IoT Expo. Join talks, interactive sessions, and practical track activities.',
  'Main Campus',
  'Seminar Hall 8',
  '2026-08-27T09:00:00.000Z',
  '2026-08-27T17:00:00.000Z',
  280,
  '00000000-0000-4000-8000-100000000003',
  'published',
  TRUE
) ON CONFLICT (id) DO NOTHING;


INSERT INTO public.events (
  id, title, description, location, venue, start_time, end_time, capacity, organizer_id, status, is_registration_open
) VALUES (
  '00000000-0000-4000-8000-400000000009',
  'Robotics Challenge',
  'Official campus event: Robotics Challenge. Join talks, interactive sessions, and practical track activities.',
  'Main Campus',
  'Seminar Hall 9',
  '2026-08-30T09:00:00.000Z',
  '2026-08-30T17:00:00.000Z',
  290,
  '00000000-0000-4000-8000-100000000004',
  'published',
  TRUE
) ON CONFLICT (id) DO NOTHING;


INSERT INTO public.events (
  id, title, description, location, venue, start_time, end_time, capacity, organizer_id, status, is_registration_open
) VALUES (
  '00000000-0000-4000-8000-400000000010',
  'Startup Pitch',
  'Official campus event: Startup Pitch. Join talks, interactive sessions, and practical track activities.',
  'Main Campus',
  'Seminar Hall 10',
  '2026-09-02T09:00:00.000Z',
  '2026-09-02T17:00:00.000Z',
  300,
  '00000000-0000-4000-8000-100000000005',
  'published',
  TRUE
) ON CONFLICT (id) DO NOTHING;


INSERT INTO public.registrations (
  id, event_id, participant_id, qr_token, qr_version, status, registered_at
) VALUES (
  '00000000-0000-4000-8000-500000000001',
  '00000000-0000-4000-8000-400000000006',
  '00000000-0000-4000-8000-300000000001',
  '2f80fd60c7a19cffe2da045aeb1acf0b',
  1,
  'checked_in',
  '2026-08-21T09:00:00.000Z'
) ON CONFLICT (id) DO UPDATE SET status = EXCLUDED.status;


INSERT INTO public.registrations (
  id, event_id, participant_id, qr_token, qr_version, status, registered_at
) VALUES (
  '00000000-0000-4000-8000-500000000002',
  '00000000-0000-4000-8000-400000000007',
  '00000000-0000-4000-8000-300000000001',
  '24760bded1bc1a75e80698d6d2e6b5cd',
  1,
  'registered',
  '2026-08-24T09:00:00.000Z'
) ON CONFLICT (id) DO UPDATE SET status = EXCLUDED.status;


INSERT INTO public.registrations (
  id, event_id, participant_id, qr_token, qr_version, status, registered_at
) VALUES (
  '00000000-0000-4000-8000-500000000003',
  '00000000-0000-4000-8000-400000000010',
  '00000000-0000-4000-8000-300000000001',
  '98b81fc2e63fbf5cdce8b860422ad66a',
  1,
  'registered',
  '2026-09-02T09:00:00.000Z'
) ON CONFLICT (id) DO UPDATE SET status = EXCLUDED.status;


INSERT INTO public.registrations (
  id, event_id, participant_id, qr_token, qr_version, status, registered_at
) VALUES (
  '00000000-0000-4000-8000-500000000004',
  '00000000-0000-4000-8000-400000000004',
  '00000000-0000-4000-8000-300000000002',
  'a59e38b30ecfc40f0d347164685d0fed',
  1,
  'registered',
  '2026-08-15T09:00:00.000Z'
) ON CONFLICT (id) DO UPDATE SET status = EXCLUDED.status;


INSERT INTO public.registrations (
  id, event_id, participant_id, qr_token, qr_version, status, registered_at
) VALUES (
  '00000000-0000-4000-8000-500000000005',
  '00000000-0000-4000-8000-400000000010',
  '00000000-0000-4000-8000-300000000002',
  '9ea70efa8cf62d3aa49357498ed86885',
  1,
  'registered',
  '2026-09-02T09:00:00.000Z'
) ON CONFLICT (id) DO UPDATE SET status = EXCLUDED.status;


INSERT INTO public.registrations (
  id, event_id, participant_id, qr_token, qr_version, status, registered_at
) VALUES (
  '00000000-0000-4000-8000-500000000006',
  '00000000-0000-4000-8000-400000000009',
  '00000000-0000-4000-8000-300000000002',
  'a6f90df3374eae3e21afe1eb53b9b87e',
  1,
  'checked_in',
  '2026-08-30T09:00:00.000Z'
) ON CONFLICT (id) DO UPDATE SET status = EXCLUDED.status;


INSERT INTO public.registrations (
  id, event_id, participant_id, qr_token, qr_version, status, registered_at
) VALUES (
  '00000000-0000-4000-8000-500000000007',
  '00000000-0000-4000-8000-400000000006',
  '00000000-0000-4000-8000-300000000003',
  '00c1043c1c564bc22a5bba3f0793141b',
  1,
  'registered',
  '2026-08-21T09:00:00.000Z'
) ON CONFLICT (id) DO UPDATE SET status = EXCLUDED.status;


INSERT INTO public.registrations (
  id, event_id, participant_id, qr_token, qr_version, status, registered_at
) VALUES (
  '00000000-0000-4000-8000-500000000008',
  '00000000-0000-4000-8000-400000000002',
  '00000000-0000-4000-8000-300000000003',
  'a5c3dd53a09a2aacaa62bd459a48f764',
  1,
  'checked_in',
  '2026-08-09T09:00:00.000Z'
) ON CONFLICT (id) DO UPDATE SET status = EXCLUDED.status;


INSERT INTO public.registrations (
  id, event_id, participant_id, qr_token, qr_version, status, registered_at
) VALUES (
  '00000000-0000-4000-8000-500000000009',
  '00000000-0000-4000-8000-400000000005',
  '00000000-0000-4000-8000-300000000003',
  '864fdd1b0befc8f087f6504521869bb1',
  1,
  'checked_in',
  '2026-08-18T09:00:00.000Z'
) ON CONFLICT (id) DO UPDATE SET status = EXCLUDED.status;


INSERT INTO public.registrations (
  id, event_id, participant_id, qr_token, qr_version, status, registered_at
) VALUES (
  '00000000-0000-4000-8000-500000000010',
  '00000000-0000-4000-8000-400000000002',
  '00000000-0000-4000-8000-300000000004',
  '9d7c8e846d24880826cce77768f422f3',
  1,
  'checked_in',
  '2026-08-09T09:00:00.000Z'
) ON CONFLICT (id) DO UPDATE SET status = EXCLUDED.status;


INSERT INTO public.registrations (
  id, event_id, participant_id, qr_token, qr_version, status, registered_at
) VALUES (
  '00000000-0000-4000-8000-500000000011',
  '00000000-0000-4000-8000-400000000004',
  '00000000-0000-4000-8000-300000000004',
  'fed615a541d48dc0b35d6792a2367e30',
  1,
  'checked_in',
  '2026-08-15T09:00:00.000Z'
) ON CONFLICT (id) DO UPDATE SET status = EXCLUDED.status;


INSERT INTO public.registrations (
  id, event_id, participant_id, qr_token, qr_version, status, registered_at
) VALUES (
  '00000000-0000-4000-8000-500000000012',
  '00000000-0000-4000-8000-400000000010',
  '00000000-0000-4000-8000-300000000004',
  '60a69da1daa0a505d14d753cdf3fe220',
  1,
  'registered',
  '2026-09-02T09:00:00.000Z'
) ON CONFLICT (id) DO UPDATE SET status = EXCLUDED.status;


INSERT INTO public.registrations (
  id, event_id, participant_id, qr_token, qr_version, status, registered_at
) VALUES (
  '00000000-0000-4000-8000-500000000013',
  '00000000-0000-4000-8000-400000000002',
  '00000000-0000-4000-8000-300000000005',
  '94b25db8115ce857df51ae27ddd7dc88',
  1,
  'checked_in',
  '2026-08-09T09:00:00.000Z'
) ON CONFLICT (id) DO UPDATE SET status = EXCLUDED.status;


INSERT INTO public.registrations (
  id, event_id, participant_id, qr_token, qr_version, status, registered_at
) VALUES (
  '00000000-0000-4000-8000-500000000014',
  '00000000-0000-4000-8000-400000000006',
  '00000000-0000-4000-8000-300000000005',
  '69194772d5808f1ca06ee87c7f311326',
  1,
  'checked_in',
  '2026-08-21T09:00:00.000Z'
) ON CONFLICT (id) DO UPDATE SET status = EXCLUDED.status;


INSERT INTO public.registrations (
  id, event_id, participant_id, qr_token, qr_version, status, registered_at
) VALUES (
  '00000000-0000-4000-8000-500000000015',
  '00000000-0000-4000-8000-400000000005',
  '00000000-0000-4000-8000-300000000005',
  '1f2c2b656f49cf70898b3d22eade6f4d',
  1,
  'checked_in',
  '2026-08-18T09:00:00.000Z'
) ON CONFLICT (id) DO UPDATE SET status = EXCLUDED.status;


INSERT INTO public.registrations (
  id, event_id, participant_id, qr_token, qr_version, status, registered_at
) VALUES (
  '00000000-0000-4000-8000-500000000016',
  '00000000-0000-4000-8000-400000000008',
  '00000000-0000-4000-8000-300000000006',
  'b6ef294866a12a72e4621f41ad3a9e2e',
  1,
  'registered',
  '2026-08-27T09:00:00.000Z'
) ON CONFLICT (id) DO UPDATE SET status = EXCLUDED.status;


INSERT INTO public.registrations (
  id, event_id, participant_id, qr_token, qr_version, status, registered_at
) VALUES (
  '00000000-0000-4000-8000-500000000017',
  '00000000-0000-4000-8000-400000000004',
  '00000000-0000-4000-8000-300000000006',
  '71ef99d31c55e6bbeb78d8ecde6bfee3',
  1,
  'checked_in',
  '2026-08-15T09:00:00.000Z'
) ON CONFLICT (id) DO UPDATE SET status = EXCLUDED.status;


INSERT INTO public.registrations (
  id, event_id, participant_id, qr_token, qr_version, status, registered_at
) VALUES (
  '00000000-0000-4000-8000-500000000018',
  '00000000-0000-4000-8000-400000000005',
  '00000000-0000-4000-8000-300000000006',
  '8cd2bf75444f4c0c010ebb61980aaacb',
  1,
  'registered',
  '2026-08-18T09:00:00.000Z'
) ON CONFLICT (id) DO UPDATE SET status = EXCLUDED.status;


INSERT INTO public.registrations (
  id, event_id, participant_id, qr_token, qr_version, status, registered_at
) VALUES (
  '00000000-0000-4000-8000-500000000019',
  '00000000-0000-4000-8000-400000000005',
  '00000000-0000-4000-8000-300000000007',
  'b4b8edef1b41d43393ac13ec5b3b6363',
  1,
  'registered',
  '2026-08-18T09:00:00.000Z'
) ON CONFLICT (id) DO UPDATE SET status = EXCLUDED.status;


INSERT INTO public.registrations (
  id, event_id, participant_id, qr_token, qr_version, status, registered_at
) VALUES (
  '00000000-0000-4000-8000-500000000020',
  '00000000-0000-4000-8000-400000000006',
  '00000000-0000-4000-8000-300000000007',
  '00989c7832c6caae3732086d2241fe28',
  1,
  'registered',
  '2026-08-21T09:00:00.000Z'
) ON CONFLICT (id) DO UPDATE SET status = EXCLUDED.status;


INSERT INTO public.registrations (
  id, event_id, participant_id, qr_token, qr_version, status, registered_at
) VALUES (
  '00000000-0000-4000-8000-500000000021',
  '00000000-0000-4000-8000-400000000004',
  '00000000-0000-4000-8000-300000000007',
  'e10f231590a378ced341b99c635b0ae2',
  1,
  'registered',
  '2026-08-15T09:00:00.000Z'
) ON CONFLICT (id) DO UPDATE SET status = EXCLUDED.status;


INSERT INTO public.registrations (
  id, event_id, participant_id, qr_token, qr_version, status, registered_at
) VALUES (
  '00000000-0000-4000-8000-500000000022',
  '00000000-0000-4000-8000-400000000008',
  '00000000-0000-4000-8000-300000000008',
  'd862f0cfbdd1b0c0c77df4945db01b74',
  1,
  'registered',
  '2026-08-27T09:00:00.000Z'
) ON CONFLICT (id) DO UPDATE SET status = EXCLUDED.status;


INSERT INTO public.registrations (
  id, event_id, participant_id, qr_token, qr_version, status, registered_at
) VALUES (
  '00000000-0000-4000-8000-500000000023',
  '00000000-0000-4000-8000-400000000003',
  '00000000-0000-4000-8000-300000000008',
  '058c6a14538a2e35fc9d022984c4604a',
  1,
  'registered',
  '2026-08-12T09:00:00.000Z'
) ON CONFLICT (id) DO UPDATE SET status = EXCLUDED.status;


INSERT INTO public.registrations (
  id, event_id, participant_id, qr_token, qr_version, status, registered_at
) VALUES (
  '00000000-0000-4000-8000-500000000024',
  '00000000-0000-4000-8000-400000000010',
  '00000000-0000-4000-8000-300000000008',
  '0bed77b606b6e218ce6b89383df0ba16',
  1,
  'checked_in',
  '2026-09-02T09:00:00.000Z'
) ON CONFLICT (id) DO UPDATE SET status = EXCLUDED.status;


INSERT INTO public.registrations (
  id, event_id, participant_id, qr_token, qr_version, status, registered_at
) VALUES (
  '00000000-0000-4000-8000-500000000025',
  '00000000-0000-4000-8000-400000000007',
  '00000000-0000-4000-8000-300000000009',
  'fb34c99b4cfa945278393448756ea1b7',
  1,
  'checked_in',
  '2026-08-24T09:00:00.000Z'
) ON CONFLICT (id) DO UPDATE SET status = EXCLUDED.status;


INSERT INTO public.registrations (
  id, event_id, participant_id, qr_token, qr_version, status, registered_at
) VALUES (
  '00000000-0000-4000-8000-500000000026',
  '00000000-0000-4000-8000-400000000006',
  '00000000-0000-4000-8000-300000000009',
  '1ac17818e706ae26976465808ec1a9b4',
  1,
  'checked_in',
  '2026-08-21T09:00:00.000Z'
) ON CONFLICT (id) DO UPDATE SET status = EXCLUDED.status;


INSERT INTO public.registrations (
  id, event_id, participant_id, qr_token, qr_version, status, registered_at
) VALUES (
  '00000000-0000-4000-8000-500000000027',
  '00000000-0000-4000-8000-400000000004',
  '00000000-0000-4000-8000-300000000009',
  '600b3112b8e2c1fd5052b23b32290beb',
  1,
  'checked_in',
  '2026-08-15T09:00:00.000Z'
) ON CONFLICT (id) DO UPDATE SET status = EXCLUDED.status;


INSERT INTO public.registrations (
  id, event_id, participant_id, qr_token, qr_version, status, registered_at
) VALUES (
  '00000000-0000-4000-8000-500000000028',
  '00000000-0000-4000-8000-400000000009',
  '00000000-0000-4000-8000-300000000010',
  '075179587d1419235a7d33d4fe408702',
  1,
  'checked_in',
  '2026-08-30T09:00:00.000Z'
) ON CONFLICT (id) DO UPDATE SET status = EXCLUDED.status;


INSERT INTO public.registrations (
  id, event_id, participant_id, qr_token, qr_version, status, registered_at
) VALUES (
  '00000000-0000-4000-8000-500000000029',
  '00000000-0000-4000-8000-400000000002',
  '00000000-0000-4000-8000-300000000010',
  '9cd6ecd684feb01b5ff14e1674965a96',
  1,
  'checked_in',
  '2026-08-09T09:00:00.000Z'
) ON CONFLICT (id) DO UPDATE SET status = EXCLUDED.status;


INSERT INTO public.registrations (
  id, event_id, participant_id, qr_token, qr_version, status, registered_at
) VALUES (
  '00000000-0000-4000-8000-500000000030',
  '00000000-0000-4000-8000-400000000010',
  '00000000-0000-4000-8000-300000000010',
  '2154b742881d4722e98f1af801c0a439',
  1,
  'registered',
  '2026-09-02T09:00:00.000Z'
) ON CONFLICT (id) DO UPDATE SET status = EXCLUDED.status;


INSERT INTO public.registrations (
  id, event_id, participant_id, qr_token, qr_version, status, registered_at
) VALUES (
  '00000000-0000-4000-8000-500000000031',
  '00000000-0000-4000-8000-400000000004',
  '00000000-0000-4000-8000-300000000011',
  '75dd2612f53acd65d6c4e253f208744f',
  1,
  'registered',
  '2026-08-15T09:00:00.000Z'
) ON CONFLICT (id) DO UPDATE SET status = EXCLUDED.status;


INSERT INTO public.registrations (
  id, event_id, participant_id, qr_token, qr_version, status, registered_at
) VALUES (
  '00000000-0000-4000-8000-500000000032',
  '00000000-0000-4000-8000-400000000009',
  '00000000-0000-4000-8000-300000000011',
  '43946354dec3ce0da7280647ed593204',
  1,
  'registered',
  '2026-08-30T09:00:00.000Z'
) ON CONFLICT (id) DO UPDATE SET status = EXCLUDED.status;


INSERT INTO public.registrations (
  id, event_id, participant_id, qr_token, qr_version, status, registered_at
) VALUES (
  '00000000-0000-4000-8000-500000000033',
  '00000000-0000-4000-8000-400000000008',
  '00000000-0000-4000-8000-300000000011',
  'c4160a4c1d2001d676bf1964770d0a96',
  1,
  'registered',
  '2026-08-27T09:00:00.000Z'
) ON CONFLICT (id) DO UPDATE SET status = EXCLUDED.status;


INSERT INTO public.registrations (
  id, event_id, participant_id, qr_token, qr_version, status, registered_at
) VALUES (
  '00000000-0000-4000-8000-500000000034',
  '00000000-0000-4000-8000-400000000009',
  '00000000-0000-4000-8000-300000000012',
  '4908f2712a9c761a3d742cb176a3b496',
  1,
  'checked_in',
  '2026-08-30T09:00:00.000Z'
) ON CONFLICT (id) DO UPDATE SET status = EXCLUDED.status;


INSERT INTO public.registrations (
  id, event_id, participant_id, qr_token, qr_version, status, registered_at
) VALUES (
  '00000000-0000-4000-8000-500000000035',
  '00000000-0000-4000-8000-400000000007',
  '00000000-0000-4000-8000-300000000012',
  'af15c8f671b85b559e419d3b9fe8e2cd',
  1,
  'registered',
  '2026-08-24T09:00:00.000Z'
) ON CONFLICT (id) DO UPDATE SET status = EXCLUDED.status;


INSERT INTO public.registrations (
  id, event_id, participant_id, qr_token, qr_version, status, registered_at
) VALUES (
  '00000000-0000-4000-8000-500000000036',
  '00000000-0000-4000-8000-400000000010',
  '00000000-0000-4000-8000-300000000012',
  '1fff9e3335fbfbc16a3f8e21f7e0a2fc',
  1,
  'registered',
  '2026-09-02T09:00:00.000Z'
) ON CONFLICT (id) DO UPDATE SET status = EXCLUDED.status;


INSERT INTO public.registrations (
  id, event_id, participant_id, qr_token, qr_version, status, registered_at
) VALUES (
  '00000000-0000-4000-8000-500000000037',
  '00000000-0000-4000-8000-400000000009',
  '00000000-0000-4000-8000-300000000013',
  '876845d3021cbf13ccb03e521b733955',
  1,
  'registered',
  '2026-08-30T09:00:00.000Z'
) ON CONFLICT (id) DO UPDATE SET status = EXCLUDED.status;


INSERT INTO public.registrations (
  id, event_id, participant_id, qr_token, qr_version, status, registered_at
) VALUES (
  '00000000-0000-4000-8000-500000000038',
  '00000000-0000-4000-8000-400000000003',
  '00000000-0000-4000-8000-300000000013',
  '0bc27415462c643ac87afcf9890dea2b',
  1,
  'checked_in',
  '2026-08-12T09:00:00.000Z'
) ON CONFLICT (id) DO UPDATE SET status = EXCLUDED.status;


INSERT INTO public.registrations (
  id, event_id, participant_id, qr_token, qr_version, status, registered_at
) VALUES (
  '00000000-0000-4000-8000-500000000039',
  '00000000-0000-4000-8000-400000000010',
  '00000000-0000-4000-8000-300000000013',
  '6fd31d12e2b044dfe52c4a5df5eb41ca',
  1,
  'registered',
  '2026-09-02T09:00:00.000Z'
) ON CONFLICT (id) DO UPDATE SET status = EXCLUDED.status;


INSERT INTO public.registrations (
  id, event_id, participant_id, qr_token, qr_version, status, registered_at
) VALUES (
  '00000000-0000-4000-8000-500000000040',
  '00000000-0000-4000-8000-400000000008',
  '00000000-0000-4000-8000-300000000014',
  '255a8b5581fa3ffe996d3672b7e6586f',
  1,
  'registered',
  '2026-08-27T09:00:00.000Z'
) ON CONFLICT (id) DO UPDATE SET status = EXCLUDED.status;


INSERT INTO public.registrations (
  id, event_id, participant_id, qr_token, qr_version, status, registered_at
) VALUES (
  '00000000-0000-4000-8000-500000000041',
  '00000000-0000-4000-8000-400000000003',
  '00000000-0000-4000-8000-300000000014',
  '4114ca3c3276206e1d2b4c850320d39b',
  1,
  'checked_in',
  '2026-08-12T09:00:00.000Z'
) ON CONFLICT (id) DO UPDATE SET status = EXCLUDED.status;


INSERT INTO public.registrations (
  id, event_id, participant_id, qr_token, qr_version, status, registered_at
) VALUES (
  '00000000-0000-4000-8000-500000000042',
  '00000000-0000-4000-8000-400000000006',
  '00000000-0000-4000-8000-300000000014',
  '2aed0e687a00dfd65914f5427ff0bff0',
  1,
  'registered',
  '2026-08-21T09:00:00.000Z'
) ON CONFLICT (id) DO UPDATE SET status = EXCLUDED.status;


INSERT INTO public.registrations (
  id, event_id, participant_id, qr_token, qr_version, status, registered_at
) VALUES (
  '00000000-0000-4000-8000-500000000043',
  '00000000-0000-4000-8000-400000000006',
  '00000000-0000-4000-8000-300000000015',
  '5cd2c5d6eae4d9802f44636785884a90',
  1,
  'checked_in',
  '2026-08-21T09:00:00.000Z'
) ON CONFLICT (id) DO UPDATE SET status = EXCLUDED.status;


INSERT INTO public.registrations (
  id, event_id, participant_id, qr_token, qr_version, status, registered_at
) VALUES (
  '00000000-0000-4000-8000-500000000044',
  '00000000-0000-4000-8000-400000000007',
  '00000000-0000-4000-8000-300000000015',
  '1dfcfccb52b0dae123f3f527d312fc67',
  1,
  'registered',
  '2026-08-24T09:00:00.000Z'
) ON CONFLICT (id) DO UPDATE SET status = EXCLUDED.status;


INSERT INTO public.registrations (
  id, event_id, participant_id, qr_token, qr_version, status, registered_at
) VALUES (
  '00000000-0000-4000-8000-500000000045',
  '00000000-0000-4000-8000-400000000003',
  '00000000-0000-4000-8000-300000000015',
  'd83c8e890cc82665cdc421691f55d9aa',
  1,
  'registered',
  '2026-08-12T09:00:00.000Z'
) ON CONFLICT (id) DO UPDATE SET status = EXCLUDED.status;


INSERT INTO public.registrations (
  id, event_id, participant_id, qr_token, qr_version, status, registered_at
) VALUES (
  '00000000-0000-4000-8000-500000000046',
  '00000000-0000-4000-8000-400000000003',
  '00000000-0000-4000-8000-300000000016',
  'fe303cfe7309ecf6a202fd39a1339e92',
  1,
  'checked_in',
  '2026-08-12T09:00:00.000Z'
) ON CONFLICT (id) DO UPDATE SET status = EXCLUDED.status;


INSERT INTO public.registrations (
  id, event_id, participant_id, qr_token, qr_version, status, registered_at
) VALUES (
  '00000000-0000-4000-8000-500000000047',
  '00000000-0000-4000-8000-400000000001',
  '00000000-0000-4000-8000-300000000016',
  'a0d80248dcadd0ec14187f530249f4aa',
  1,
  'registered',
  '2026-08-06T09:00:00.000Z'
) ON CONFLICT (id) DO UPDATE SET status = EXCLUDED.status;


INSERT INTO public.registrations (
  id, event_id, participant_id, qr_token, qr_version, status, registered_at
) VALUES (
  '00000000-0000-4000-8000-500000000048',
  '00000000-0000-4000-8000-400000000006',
  '00000000-0000-4000-8000-300000000016',
  'dbfd114c7d268420ee5f5fd621fead57',
  1,
  'registered',
  '2026-08-21T09:00:00.000Z'
) ON CONFLICT (id) DO UPDATE SET status = EXCLUDED.status;


INSERT INTO public.registrations (
  id, event_id, participant_id, qr_token, qr_version, status, registered_at
) VALUES (
  '00000000-0000-4000-8000-500000000049',
  '00000000-0000-4000-8000-400000000006',
  '00000000-0000-4000-8000-300000000017',
  '4f9498c74adcea967c9a4f2a1381917b',
  1,
  'registered',
  '2026-08-21T09:00:00.000Z'
) ON CONFLICT (id) DO UPDATE SET status = EXCLUDED.status;


INSERT INTO public.registrations (
  id, event_id, participant_id, qr_token, qr_version, status, registered_at
) VALUES (
  '00000000-0000-4000-8000-500000000050',
  '00000000-0000-4000-8000-400000000002',
  '00000000-0000-4000-8000-300000000017',
  '6762e28b0ce472b0e6d780b74c381a1d',
  1,
  'registered',
  '2026-08-09T09:00:00.000Z'
) ON CONFLICT (id) DO UPDATE SET status = EXCLUDED.status;


INSERT INTO public.registrations (
  id, event_id, participant_id, qr_token, qr_version, status, registered_at
) VALUES (
  '00000000-0000-4000-8000-500000000051',
  '00000000-0000-4000-8000-400000000010',
  '00000000-0000-4000-8000-300000000017',
  'b985230df6828eafb16f54f3977228ca',
  1,
  'checked_in',
  '2026-09-02T09:00:00.000Z'
) ON CONFLICT (id) DO UPDATE SET status = EXCLUDED.status;


INSERT INTO public.registrations (
  id, event_id, participant_id, qr_token, qr_version, status, registered_at
) VALUES (
  '00000000-0000-4000-8000-500000000052',
  '00000000-0000-4000-8000-400000000007',
  '00000000-0000-4000-8000-300000000018',
  '403e7a32cd48942301c8d829366980b3',
  1,
  'registered',
  '2026-08-24T09:00:00.000Z'
) ON CONFLICT (id) DO UPDATE SET status = EXCLUDED.status;


INSERT INTO public.registrations (
  id, event_id, participant_id, qr_token, qr_version, status, registered_at
) VALUES (
  '00000000-0000-4000-8000-500000000053',
  '00000000-0000-4000-8000-400000000006',
  '00000000-0000-4000-8000-300000000018',
  '0a9ee9e1487d8d265a25708d86ccbfb0',
  1,
  'checked_in',
  '2026-08-21T09:00:00.000Z'
) ON CONFLICT (id) DO UPDATE SET status = EXCLUDED.status;


INSERT INTO public.registrations (
  id, event_id, participant_id, qr_token, qr_version, status, registered_at
) VALUES (
  '00000000-0000-4000-8000-500000000054',
  '00000000-0000-4000-8000-400000000010',
  '00000000-0000-4000-8000-300000000018',
  'c1340524b1df8cd1bbe9199da1f4b2f4',
  1,
  'registered',
  '2026-09-02T09:00:00.000Z'
) ON CONFLICT (id) DO UPDATE SET status = EXCLUDED.status;


INSERT INTO public.registrations (
  id, event_id, participant_id, qr_token, qr_version, status, registered_at
) VALUES (
  '00000000-0000-4000-8000-500000000055',
  '00000000-0000-4000-8000-400000000004',
  '00000000-0000-4000-8000-300000000019',
  'a6063591ef07d0f051f88641805f0b3d',
  1,
  'checked_in',
  '2026-08-15T09:00:00.000Z'
) ON CONFLICT (id) DO UPDATE SET status = EXCLUDED.status;


INSERT INTO public.registrations (
  id, event_id, participant_id, qr_token, qr_version, status, registered_at
) VALUES (
  '00000000-0000-4000-8000-500000000056',
  '00000000-0000-4000-8000-400000000010',
  '00000000-0000-4000-8000-300000000019',
  'c8398a65607c2db5ecd4761f74cc9295',
  1,
  'checked_in',
  '2026-09-02T09:00:00.000Z'
) ON CONFLICT (id) DO UPDATE SET status = EXCLUDED.status;


INSERT INTO public.registrations (
  id, event_id, participant_id, qr_token, qr_version, status, registered_at
) VALUES (
  '00000000-0000-4000-8000-500000000057',
  '00000000-0000-4000-8000-400000000009',
  '00000000-0000-4000-8000-300000000019',
  '802964ff5de3794fc4aea85eebd85855',
  1,
  'registered',
  '2026-08-30T09:00:00.000Z'
) ON CONFLICT (id) DO UPDATE SET status = EXCLUDED.status;


INSERT INTO public.registrations (
  id, event_id, participant_id, qr_token, qr_version, status, registered_at
) VALUES (
  '00000000-0000-4000-8000-500000000058',
  '00000000-0000-4000-8000-400000000009',
  '00000000-0000-4000-8000-300000000020',
  'bbf4a64f6f15d589dce597bebfe7849a',
  1,
  'registered',
  '2026-08-30T09:00:00.000Z'
) ON CONFLICT (id) DO UPDATE SET status = EXCLUDED.status;


INSERT INTO public.registrations (
  id, event_id, participant_id, qr_token, qr_version, status, registered_at
) VALUES (
  '00000000-0000-4000-8000-500000000059',
  '00000000-0000-4000-8000-400000000005',
  '00000000-0000-4000-8000-300000000020',
  '7d951617ee35282058a8799600910531',
  1,
  'checked_in',
  '2026-08-18T09:00:00.000Z'
) ON CONFLICT (id) DO UPDATE SET status = EXCLUDED.status;


INSERT INTO public.registrations (
  id, event_id, participant_id, qr_token, qr_version, status, registered_at
) VALUES (
  '00000000-0000-4000-8000-500000000060',
  '00000000-0000-4000-8000-400000000002',
  '00000000-0000-4000-8000-300000000020',
  '949f353b4f07bf0f4b6abc33ab6f88c1',
  1,
  'registered',
  '2026-08-09T09:00:00.000Z'
) ON CONFLICT (id) DO UPDATE SET status = EXCLUDED.status;


INSERT INTO public.registrations (
  id, event_id, participant_id, qr_token, qr_version, status, registered_at
) VALUES (
  '00000000-0000-4000-8000-500000000061',
  '00000000-0000-4000-8000-400000000008',
  '00000000-0000-4000-8000-300000000021',
  '2abcc0715f7230016ff45c4d943f0f42',
  1,
  'checked_in',
  '2026-08-27T09:00:00.000Z'
) ON CONFLICT (id) DO UPDATE SET status = EXCLUDED.status;


INSERT INTO public.registrations (
  id, event_id, participant_id, qr_token, qr_version, status, registered_at
) VALUES (
  '00000000-0000-4000-8000-500000000062',
  '00000000-0000-4000-8000-400000000005',
  '00000000-0000-4000-8000-300000000021',
  '230c4c492f7fb61bbf145690b935dafd',
  1,
  'registered',
  '2026-08-18T09:00:00.000Z'
) ON CONFLICT (id) DO UPDATE SET status = EXCLUDED.status;


INSERT INTO public.registrations (
  id, event_id, participant_id, qr_token, qr_version, status, registered_at
) VALUES (
  '00000000-0000-4000-8000-500000000063',
  '00000000-0000-4000-8000-400000000010',
  '00000000-0000-4000-8000-300000000021',
  '72fd830f438199ec442e37311d40576e',
  1,
  'checked_in',
  '2026-09-02T09:00:00.000Z'
) ON CONFLICT (id) DO UPDATE SET status = EXCLUDED.status;


INSERT INTO public.registrations (
  id, event_id, participant_id, qr_token, qr_version, status, registered_at
) VALUES (
  '00000000-0000-4000-8000-500000000064',
  '00000000-0000-4000-8000-400000000006',
  '00000000-0000-4000-8000-300000000022',
  '1fe76a1d635eae07f43487f71b1e695a',
  1,
  'checked_in',
  '2026-08-21T09:00:00.000Z'
) ON CONFLICT (id) DO UPDATE SET status = EXCLUDED.status;


INSERT INTO public.registrations (
  id, event_id, participant_id, qr_token, qr_version, status, registered_at
) VALUES (
  '00000000-0000-4000-8000-500000000065',
  '00000000-0000-4000-8000-400000000003',
  '00000000-0000-4000-8000-300000000022',
  '280cb7671ec036d2f1b9a1817b0d2cf1',
  1,
  'checked_in',
  '2026-08-12T09:00:00.000Z'
) ON CONFLICT (id) DO UPDATE SET status = EXCLUDED.status;


INSERT INTO public.registrations (
  id, event_id, participant_id, qr_token, qr_version, status, registered_at
) VALUES (
  '00000000-0000-4000-8000-500000000066',
  '00000000-0000-4000-8000-400000000007',
  '00000000-0000-4000-8000-300000000022',
  'f420793dc2f64a178e6a69a411dc5b6b',
  1,
  'checked_in',
  '2026-08-24T09:00:00.000Z'
) ON CONFLICT (id) DO UPDATE SET status = EXCLUDED.status;


INSERT INTO public.registrations (
  id, event_id, participant_id, qr_token, qr_version, status, registered_at
) VALUES (
  '00000000-0000-4000-8000-500000000067',
  '00000000-0000-4000-8000-400000000005',
  '00000000-0000-4000-8000-300000000023',
  '6c85b6df65af51f21dc954b1ab3eb519',
  1,
  'checked_in',
  '2026-08-18T09:00:00.000Z'
) ON CONFLICT (id) DO UPDATE SET status = EXCLUDED.status;


INSERT INTO public.registrations (
  id, event_id, participant_id, qr_token, qr_version, status, registered_at
) VALUES (
  '00000000-0000-4000-8000-500000000068',
  '00000000-0000-4000-8000-400000000002',
  '00000000-0000-4000-8000-300000000023',
  '509f0595340cdcc7557c0eb4a66963ef',
  1,
  'checked_in',
  '2026-08-09T09:00:00.000Z'
) ON CONFLICT (id) DO UPDATE SET status = EXCLUDED.status;


INSERT INTO public.registrations (
  id, event_id, participant_id, qr_token, qr_version, status, registered_at
) VALUES (
  '00000000-0000-4000-8000-500000000069',
  '00000000-0000-4000-8000-400000000009',
  '00000000-0000-4000-8000-300000000023',
  '2fe81e3d634b1f2c70dc3e4f14caa90e',
  1,
  'registered',
  '2026-08-30T09:00:00.000Z'
) ON CONFLICT (id) DO UPDATE SET status = EXCLUDED.status;


INSERT INTO public.registrations (
  id, event_id, participant_id, qr_token, qr_version, status, registered_at
) VALUES (
  '00000000-0000-4000-8000-500000000070',
  '00000000-0000-4000-8000-400000000005',
  '00000000-0000-4000-8000-300000000024',
  'ebc552b48111d4d41cd6d6e385af4c47',
  1,
  'registered',
  '2026-08-18T09:00:00.000Z'
) ON CONFLICT (id) DO UPDATE SET status = EXCLUDED.status;


INSERT INTO public.registrations (
  id, event_id, participant_id, qr_token, qr_version, status, registered_at
) VALUES (
  '00000000-0000-4000-8000-500000000071',
  '00000000-0000-4000-8000-400000000010',
  '00000000-0000-4000-8000-300000000024',
  'f7a56e5eb621a5ba5f3aa20df9cb67b4',
  1,
  'checked_in',
  '2026-09-02T09:00:00.000Z'
) ON CONFLICT (id) DO UPDATE SET status = EXCLUDED.status;


INSERT INTO public.registrations (
  id, event_id, participant_id, qr_token, qr_version, status, registered_at
) VALUES (
  '00000000-0000-4000-8000-500000000072',
  '00000000-0000-4000-8000-400000000007',
  '00000000-0000-4000-8000-300000000024',
  '2348bd10bf73d6188529a1905d6dd19b',
  1,
  'registered',
  '2026-08-24T09:00:00.000Z'
) ON CONFLICT (id) DO UPDATE SET status = EXCLUDED.status;


INSERT INTO public.registrations (
  id, event_id, participant_id, qr_token, qr_version, status, registered_at
) VALUES (
  '00000000-0000-4000-8000-500000000073',
  '00000000-0000-4000-8000-400000000001',
  '00000000-0000-4000-8000-300000000025',
  '47d212e3e8dc998cd9e604d7524e76e2',
  1,
  'checked_in',
  '2026-08-06T09:00:00.000Z'
) ON CONFLICT (id) DO UPDATE SET status = EXCLUDED.status;


INSERT INTO public.registrations (
  id, event_id, participant_id, qr_token, qr_version, status, registered_at
) VALUES (
  '00000000-0000-4000-8000-500000000074',
  '00000000-0000-4000-8000-400000000003',
  '00000000-0000-4000-8000-300000000025',
  'fc86a04a852a43d5af486fda07c5f9a4',
  1,
  'checked_in',
  '2026-08-12T09:00:00.000Z'
) ON CONFLICT (id) DO UPDATE SET status = EXCLUDED.status;


INSERT INTO public.registrations (
  id, event_id, participant_id, qr_token, qr_version, status, registered_at
) VALUES (
  '00000000-0000-4000-8000-500000000075',
  '00000000-0000-4000-8000-400000000010',
  '00000000-0000-4000-8000-300000000025',
  '60174bf0fef8453c7ac8ccdc339b085f',
  1,
  'checked_in',
  '2026-09-02T09:00:00.000Z'
) ON CONFLICT (id) DO UPDATE SET status = EXCLUDED.status;


INSERT INTO public.registrations (
  id, event_id, participant_id, qr_token, qr_version, status, registered_at
) VALUES (
  '00000000-0000-4000-8000-500000000076',
  '00000000-0000-4000-8000-400000000008',
  '00000000-0000-4000-8000-300000000026',
  '43f65aa924f546ef2b4f185589681aea',
  1,
  'checked_in',
  '2026-08-27T09:00:00.000Z'
) ON CONFLICT (id) DO UPDATE SET status = EXCLUDED.status;


INSERT INTO public.registrations (
  id, event_id, participant_id, qr_token, qr_version, status, registered_at
) VALUES (
  '00000000-0000-4000-8000-500000000077',
  '00000000-0000-4000-8000-400000000010',
  '00000000-0000-4000-8000-300000000026',
  '976821320e388def59f85e60e41f5faf',
  1,
  'registered',
  '2026-09-02T09:00:00.000Z'
) ON CONFLICT (id) DO UPDATE SET status = EXCLUDED.status;


INSERT INTO public.registrations (
  id, event_id, participant_id, qr_token, qr_version, status, registered_at
) VALUES (
  '00000000-0000-4000-8000-500000000078',
  '00000000-0000-4000-8000-400000000005',
  '00000000-0000-4000-8000-300000000026',
  '867963df90f3ef42a8c5cfc224396621',
  1,
  'registered',
  '2026-08-18T09:00:00.000Z'
) ON CONFLICT (id) DO UPDATE SET status = EXCLUDED.status;


INSERT INTO public.registrations (
  id, event_id, participant_id, qr_token, qr_version, status, registered_at
) VALUES (
  '00000000-0000-4000-8000-500000000079',
  '00000000-0000-4000-8000-400000000006',
  '00000000-0000-4000-8000-300000000027',
  '792bc7f33983c479f3f64e176c82a1d7',
  1,
  'checked_in',
  '2026-08-21T09:00:00.000Z'
) ON CONFLICT (id) DO UPDATE SET status = EXCLUDED.status;


INSERT INTO public.registrations (
  id, event_id, participant_id, qr_token, qr_version, status, registered_at
) VALUES (
  '00000000-0000-4000-8000-500000000080',
  '00000000-0000-4000-8000-400000000004',
  '00000000-0000-4000-8000-300000000027',
  '1f89a523f5bd2987552606b581b9cca3',
  1,
  'checked_in',
  '2026-08-15T09:00:00.000Z'
) ON CONFLICT (id) DO UPDATE SET status = EXCLUDED.status;


INSERT INTO public.registrations (
  id, event_id, participant_id, qr_token, qr_version, status, registered_at
) VALUES (
  '00000000-0000-4000-8000-500000000081',
  '00000000-0000-4000-8000-400000000002',
  '00000000-0000-4000-8000-300000000027',
  '47d2de690c4de1d943846dd235ede6f2',
  1,
  'checked_in',
  '2026-08-09T09:00:00.000Z'
) ON CONFLICT (id) DO UPDATE SET status = EXCLUDED.status;


INSERT INTO public.registrations (
  id, event_id, participant_id, qr_token, qr_version, status, registered_at
) VALUES (
  '00000000-0000-4000-8000-500000000082',
  '00000000-0000-4000-8000-400000000008',
  '00000000-0000-4000-8000-300000000028',
  'cdb647c82b4486b7ffb775659fa7154c',
  1,
  'registered',
  '2026-08-27T09:00:00.000Z'
) ON CONFLICT (id) DO UPDATE SET status = EXCLUDED.status;


INSERT INTO public.registrations (
  id, event_id, participant_id, qr_token, qr_version, status, registered_at
) VALUES (
  '00000000-0000-4000-8000-500000000083',
  '00000000-0000-4000-8000-400000000001',
  '00000000-0000-4000-8000-300000000028',
  '710a988857619d143cac99741c3ef49a',
  1,
  'registered',
  '2026-08-06T09:00:00.000Z'
) ON CONFLICT (id) DO UPDATE SET status = EXCLUDED.status;


INSERT INTO public.registrations (
  id, event_id, participant_id, qr_token, qr_version, status, registered_at
) VALUES (
  '00000000-0000-4000-8000-500000000084',
  '00000000-0000-4000-8000-400000000002',
  '00000000-0000-4000-8000-300000000028',
  'cb177092aa6bdb0d64c7522ff6a80041',
  1,
  'checked_in',
  '2026-08-09T09:00:00.000Z'
) ON CONFLICT (id) DO UPDATE SET status = EXCLUDED.status;


INSERT INTO public.registrations (
  id, event_id, participant_id, qr_token, qr_version, status, registered_at
) VALUES (
  '00000000-0000-4000-8000-500000000085',
  '00000000-0000-4000-8000-400000000010',
  '00000000-0000-4000-8000-300000000029',
  '9f1ee173e8bbfdce0968cc4c958f2e08',
  1,
  'registered',
  '2026-09-02T09:00:00.000Z'
) ON CONFLICT (id) DO UPDATE SET status = EXCLUDED.status;


INSERT INTO public.registrations (
  id, event_id, participant_id, qr_token, qr_version, status, registered_at
) VALUES (
  '00000000-0000-4000-8000-500000000086',
  '00000000-0000-4000-8000-400000000002',
  '00000000-0000-4000-8000-300000000029',
  'fa9270ff016f8b83da5423a772707add',
  1,
  'registered',
  '2026-08-09T09:00:00.000Z'
) ON CONFLICT (id) DO UPDATE SET status = EXCLUDED.status;


INSERT INTO public.registrations (
  id, event_id, participant_id, qr_token, qr_version, status, registered_at
) VALUES (
  '00000000-0000-4000-8000-500000000087',
  '00000000-0000-4000-8000-400000000008',
  '00000000-0000-4000-8000-300000000029',
  '9408b70d837ad2399f0666f3efe3869e',
  1,
  'checked_in',
  '2026-08-27T09:00:00.000Z'
) ON CONFLICT (id) DO UPDATE SET status = EXCLUDED.status;


INSERT INTO public.registrations (
  id, event_id, participant_id, qr_token, qr_version, status, registered_at
) VALUES (
  '00000000-0000-4000-8000-500000000088',
  '00000000-0000-4000-8000-400000000006',
  '00000000-0000-4000-8000-300000000030',
  '236b84ab8064e5d8c91bd1b4c925497b',
  1,
  'registered',
  '2026-08-21T09:00:00.000Z'
) ON CONFLICT (id) DO UPDATE SET status = EXCLUDED.status;


INSERT INTO public.registrations (
  id, event_id, participant_id, qr_token, qr_version, status, registered_at
) VALUES (
  '00000000-0000-4000-8000-500000000089',
  '00000000-0000-4000-8000-400000000007',
  '00000000-0000-4000-8000-300000000030',
  '4702b9c712c6da0869717c0ccf78b10f',
  1,
  'checked_in',
  '2026-08-24T09:00:00.000Z'
) ON CONFLICT (id) DO UPDATE SET status = EXCLUDED.status;


INSERT INTO public.registrations (
  id, event_id, participant_id, qr_token, qr_version, status, registered_at
) VALUES (
  '00000000-0000-4000-8000-500000000090',
  '00000000-0000-4000-8000-400000000005',
  '00000000-0000-4000-8000-300000000030',
  '3e5d757e0bcff8884ea5ead947164201',
  1,
  'registered',
  '2026-08-18T09:00:00.000Z'
) ON CONFLICT (id) DO UPDATE SET status = EXCLUDED.status;


INSERT INTO public.registrations (
  id, event_id, participant_id, qr_token, qr_version, status, registered_at
) VALUES (
  '00000000-0000-4000-8000-500000000091',
  '00000000-0000-4000-8000-400000000006',
  '00000000-0000-4000-8000-300000000031',
  '230f255073dd40fe64d08ab4f4521659',
  1,
  'checked_in',
  '2026-08-21T09:00:00.000Z'
) ON CONFLICT (id) DO UPDATE SET status = EXCLUDED.status;


INSERT INTO public.registrations (
  id, event_id, participant_id, qr_token, qr_version, status, registered_at
) VALUES (
  '00000000-0000-4000-8000-500000000092',
  '00000000-0000-4000-8000-400000000005',
  '00000000-0000-4000-8000-300000000031',
  '20c52f1dc8cfec5a902e564a819e0fbb',
  1,
  'checked_in',
  '2026-08-18T09:00:00.000Z'
) ON CONFLICT (id) DO UPDATE SET status = EXCLUDED.status;


INSERT INTO public.registrations (
  id, event_id, participant_id, qr_token, qr_version, status, registered_at
) VALUES (
  '00000000-0000-4000-8000-500000000093',
  '00000000-0000-4000-8000-400000000004',
  '00000000-0000-4000-8000-300000000031',
  '0f8c87798f9fa8a739a70ec4d8b891ce',
  1,
  'registered',
  '2026-08-15T09:00:00.000Z'
) ON CONFLICT (id) DO UPDATE SET status = EXCLUDED.status;


INSERT INTO public.registrations (
  id, event_id, participant_id, qr_token, qr_version, status, registered_at
) VALUES (
  '00000000-0000-4000-8000-500000000094',
  '00000000-0000-4000-8000-400000000004',
  '00000000-0000-4000-8000-300000000032',
  'f889b51336deb5e01c992fb2c272e178',
  1,
  'checked_in',
  '2026-08-15T09:00:00.000Z'
) ON CONFLICT (id) DO UPDATE SET status = EXCLUDED.status;


INSERT INTO public.registrations (
  id, event_id, participant_id, qr_token, qr_version, status, registered_at
) VALUES (
  '00000000-0000-4000-8000-500000000095',
  '00000000-0000-4000-8000-400000000001',
  '00000000-0000-4000-8000-300000000032',
  '2733bcc8b13e23ac05930cabed68b2a4',
  1,
  'checked_in',
  '2026-08-06T09:00:00.000Z'
) ON CONFLICT (id) DO UPDATE SET status = EXCLUDED.status;


INSERT INTO public.registrations (
  id, event_id, participant_id, qr_token, qr_version, status, registered_at
) VALUES (
  '00000000-0000-4000-8000-500000000096',
  '00000000-0000-4000-8000-400000000010',
  '00000000-0000-4000-8000-300000000032',
  '38f443ed28995f4075bc485235d9f68d',
  1,
  'checked_in',
  '2026-09-02T09:00:00.000Z'
) ON CONFLICT (id) DO UPDATE SET status = EXCLUDED.status;


INSERT INTO public.registrations (
  id, event_id, participant_id, qr_token, qr_version, status, registered_at
) VALUES (
  '00000000-0000-4000-8000-500000000097',
  '00000000-0000-4000-8000-400000000005',
  '00000000-0000-4000-8000-300000000033',
  '62a8886eede54353ed6a00c61766dd5f',
  1,
  'registered',
  '2026-08-18T09:00:00.000Z'
) ON CONFLICT (id) DO UPDATE SET status = EXCLUDED.status;


INSERT INTO public.registrations (
  id, event_id, participant_id, qr_token, qr_version, status, registered_at
) VALUES (
  '00000000-0000-4000-8000-500000000098',
  '00000000-0000-4000-8000-400000000010',
  '00000000-0000-4000-8000-300000000033',
  '2e0c0034fdd1588c7cd9caf9527b4926',
  1,
  'registered',
  '2026-09-02T09:00:00.000Z'
) ON CONFLICT (id) DO UPDATE SET status = EXCLUDED.status;


INSERT INTO public.registrations (
  id, event_id, participant_id, qr_token, qr_version, status, registered_at
) VALUES (
  '00000000-0000-4000-8000-500000000099',
  '00000000-0000-4000-8000-400000000008',
  '00000000-0000-4000-8000-300000000033',
  'dda8001fc5d9596f31932c59ff4214b7',
  1,
  'checked_in',
  '2026-08-27T09:00:00.000Z'
) ON CONFLICT (id) DO UPDATE SET status = EXCLUDED.status;


INSERT INTO public.registrations (
  id, event_id, participant_id, qr_token, qr_version, status, registered_at
) VALUES (
  '00000000-0000-4000-8000-500000000100',
  '00000000-0000-4000-8000-400000000009',
  '00000000-0000-4000-8000-300000000034',
  '7ebcf873f4d156a2e86b5d3befc5884d',
  1,
  'registered',
  '2026-08-30T09:00:00.000Z'
) ON CONFLICT (id) DO UPDATE SET status = EXCLUDED.status;


INSERT INTO public.registrations (
  id, event_id, participant_id, qr_token, qr_version, status, registered_at
) VALUES (
  '00000000-0000-4000-8000-500000000101',
  '00000000-0000-4000-8000-400000000008',
  '00000000-0000-4000-8000-300000000034',
  '8067d8707d3ff3e933b4853ca065a5e0',
  1,
  'registered',
  '2026-08-27T09:00:00.000Z'
) ON CONFLICT (id) DO UPDATE SET status = EXCLUDED.status;


INSERT INTO public.registrations (
  id, event_id, participant_id, qr_token, qr_version, status, registered_at
) VALUES (
  '00000000-0000-4000-8000-500000000102',
  '00000000-0000-4000-8000-400000000002',
  '00000000-0000-4000-8000-300000000034',
  '426db316228e7fab8e7225fe28cd178e',
  1,
  'checked_in',
  '2026-08-09T09:00:00.000Z'
) ON CONFLICT (id) DO UPDATE SET status = EXCLUDED.status;


INSERT INTO public.registrations (
  id, event_id, participant_id, qr_token, qr_version, status, registered_at
) VALUES (
  '00000000-0000-4000-8000-500000000103',
  '00000000-0000-4000-8000-400000000006',
  '00000000-0000-4000-8000-300000000035',
  '2fb5a055bdd5201604550f73ea9c93dc',
  1,
  'checked_in',
  '2026-08-21T09:00:00.000Z'
) ON CONFLICT (id) DO UPDATE SET status = EXCLUDED.status;


INSERT INTO public.registrations (
  id, event_id, participant_id, qr_token, qr_version, status, registered_at
) VALUES (
  '00000000-0000-4000-8000-500000000104',
  '00000000-0000-4000-8000-400000000004',
  '00000000-0000-4000-8000-300000000035',
  'ee4c34dc17ff687e430c36565225b1e0',
  1,
  'registered',
  '2026-08-15T09:00:00.000Z'
) ON CONFLICT (id) DO UPDATE SET status = EXCLUDED.status;


INSERT INTO public.registrations (
  id, event_id, participant_id, qr_token, qr_version, status, registered_at
) VALUES (
  '00000000-0000-4000-8000-500000000105',
  '00000000-0000-4000-8000-400000000009',
  '00000000-0000-4000-8000-300000000035',
  '98b366d1de5aab316ee2e83cd4a77ec1',
  1,
  'checked_in',
  '2026-08-30T09:00:00.000Z'
) ON CONFLICT (id) DO UPDATE SET status = EXCLUDED.status;


INSERT INTO public.registrations (
  id, event_id, participant_id, qr_token, qr_version, status, registered_at
) VALUES (
  '00000000-0000-4000-8000-500000000106',
  '00000000-0000-4000-8000-400000000005',
  '00000000-0000-4000-8000-300000000036',
  'ca2050c33b26d4970cd0801dac2c13e2',
  1,
  'registered',
  '2026-08-18T09:00:00.000Z'
) ON CONFLICT (id) DO UPDATE SET status = EXCLUDED.status;


INSERT INTO public.registrations (
  id, event_id, participant_id, qr_token, qr_version, status, registered_at
) VALUES (
  '00000000-0000-4000-8000-500000000107',
  '00000000-0000-4000-8000-400000000008',
  '00000000-0000-4000-8000-300000000036',
  'e1e075e74a518d4d607f95fe5997c4c5',
  1,
  'registered',
  '2026-08-27T09:00:00.000Z'
) ON CONFLICT (id) DO UPDATE SET status = EXCLUDED.status;


INSERT INTO public.registrations (
  id, event_id, participant_id, qr_token, qr_version, status, registered_at
) VALUES (
  '00000000-0000-4000-8000-500000000108',
  '00000000-0000-4000-8000-400000000004',
  '00000000-0000-4000-8000-300000000036',
  'f0b3f5431ba8f1a2ff5122d45f2b48ef',
  1,
  'checked_in',
  '2026-08-15T09:00:00.000Z'
) ON CONFLICT (id) DO UPDATE SET status = EXCLUDED.status;


INSERT INTO public.registrations (
  id, event_id, participant_id, qr_token, qr_version, status, registered_at
) VALUES (
  '00000000-0000-4000-8000-500000000109',
  '00000000-0000-4000-8000-400000000003',
  '00000000-0000-4000-8000-300000000037',
  '14606172dafccf68f6a638b3c6099664',
  1,
  'registered',
  '2026-08-12T09:00:00.000Z'
) ON CONFLICT (id) DO UPDATE SET status = EXCLUDED.status;


INSERT INTO public.registrations (
  id, event_id, participant_id, qr_token, qr_version, status, registered_at
) VALUES (
  '00000000-0000-4000-8000-500000000110',
  '00000000-0000-4000-8000-400000000005',
  '00000000-0000-4000-8000-300000000037',
  '652fa59cdc431de32ff5059e0d78c301',
  1,
  'checked_in',
  '2026-08-18T09:00:00.000Z'
) ON CONFLICT (id) DO UPDATE SET status = EXCLUDED.status;


INSERT INTO public.registrations (
  id, event_id, participant_id, qr_token, qr_version, status, registered_at
) VALUES (
  '00000000-0000-4000-8000-500000000111',
  '00000000-0000-4000-8000-400000000007',
  '00000000-0000-4000-8000-300000000037',
  '7835b0c8aa38d0b9fe20c4fcfd7428d7',
  1,
  'checked_in',
  '2026-08-24T09:00:00.000Z'
) ON CONFLICT (id) DO UPDATE SET status = EXCLUDED.status;


INSERT INTO public.registrations (
  id, event_id, participant_id, qr_token, qr_version, status, registered_at
) VALUES (
  '00000000-0000-4000-8000-500000000112',
  '00000000-0000-4000-8000-400000000010',
  '00000000-0000-4000-8000-300000000038',
  'ea94ff2646b86de33211c58ea14760ce',
  1,
  'registered',
  '2026-09-02T09:00:00.000Z'
) ON CONFLICT (id) DO UPDATE SET status = EXCLUDED.status;


INSERT INTO public.registrations (
  id, event_id, participant_id, qr_token, qr_version, status, registered_at
) VALUES (
  '00000000-0000-4000-8000-500000000113',
  '00000000-0000-4000-8000-400000000009',
  '00000000-0000-4000-8000-300000000038',
  '36343472bb1abcc6e151338c1a93d26c',
  1,
  'registered',
  '2026-08-30T09:00:00.000Z'
) ON CONFLICT (id) DO UPDATE SET status = EXCLUDED.status;


INSERT INTO public.registrations (
  id, event_id, participant_id, qr_token, qr_version, status, registered_at
) VALUES (
  '00000000-0000-4000-8000-500000000114',
  '00000000-0000-4000-8000-400000000001',
  '00000000-0000-4000-8000-300000000038',
  '2c731f1df39542993699c34ca252ae2d',
  1,
  'registered',
  '2026-08-06T09:00:00.000Z'
) ON CONFLICT (id) DO UPDATE SET status = EXCLUDED.status;


INSERT INTO public.registrations (
  id, event_id, participant_id, qr_token, qr_version, status, registered_at
) VALUES (
  '00000000-0000-4000-8000-500000000115',
  '00000000-0000-4000-8000-400000000007',
  '00000000-0000-4000-8000-300000000039',
  'a9894b6cacd9c3fdc7538890af0c9a9b',
  1,
  'checked_in',
  '2026-08-24T09:00:00.000Z'
) ON CONFLICT (id) DO UPDATE SET status = EXCLUDED.status;


INSERT INTO public.registrations (
  id, event_id, participant_id, qr_token, qr_version, status, registered_at
) VALUES (
  '00000000-0000-4000-8000-500000000116',
  '00000000-0000-4000-8000-400000000008',
  '00000000-0000-4000-8000-300000000039',
  'bff211513be5bb9393b986c333c61537',
  1,
  'registered',
  '2026-08-27T09:00:00.000Z'
) ON CONFLICT (id) DO UPDATE SET status = EXCLUDED.status;


INSERT INTO public.registrations (
  id, event_id, participant_id, qr_token, qr_version, status, registered_at
) VALUES (
  '00000000-0000-4000-8000-500000000117',
  '00000000-0000-4000-8000-400000000009',
  '00000000-0000-4000-8000-300000000039',
  '29cb08083f10b01936dcc30d8f2d0029',
  1,
  'checked_in',
  '2026-08-30T09:00:00.000Z'
) ON CONFLICT (id) DO UPDATE SET status = EXCLUDED.status;


INSERT INTO public.registrations (
  id, event_id, participant_id, qr_token, qr_version, status, registered_at
) VALUES (
  '00000000-0000-4000-8000-500000000118',
  '00000000-0000-4000-8000-400000000004',
  '00000000-0000-4000-8000-300000000040',
  'b5d423c4622c97abda228fa774770178',
  1,
  'registered',
  '2026-08-15T09:00:00.000Z'
) ON CONFLICT (id) DO UPDATE SET status = EXCLUDED.status;


INSERT INTO public.registrations (
  id, event_id, participant_id, qr_token, qr_version, status, registered_at
) VALUES (
  '00000000-0000-4000-8000-500000000119',
  '00000000-0000-4000-8000-400000000007',
  '00000000-0000-4000-8000-300000000040',
  '6395766f484672eeb0e3b1d1b75d52a8',
  1,
  'checked_in',
  '2026-08-24T09:00:00.000Z'
) ON CONFLICT (id) DO UPDATE SET status = EXCLUDED.status;


INSERT INTO public.registrations (
  id, event_id, participant_id, qr_token, qr_version, status, registered_at
) VALUES (
  '00000000-0000-4000-8000-500000000120',
  '00000000-0000-4000-8000-400000000005',
  '00000000-0000-4000-8000-300000000040',
  '5d7447358cc0a3fd31cef4515a23aafb',
  1,
  'checked_in',
  '2026-08-18T09:00:00.000Z'
) ON CONFLICT (id) DO UPDATE SET status = EXCLUDED.status;


INSERT INTO public.registrations (
  id, event_id, participant_id, qr_token, qr_version, status, registered_at
) VALUES (
  '00000000-0000-4000-8000-500000000121',
  '00000000-0000-4000-8000-400000000001',
  '00000000-0000-4000-8000-300000000041',
  'b43465a5a1ff6bf820609e4943239e0b',
  1,
  'checked_in',
  '2026-08-06T09:00:00.000Z'
) ON CONFLICT (id) DO UPDATE SET status = EXCLUDED.status;


INSERT INTO public.registrations (
  id, event_id, participant_id, qr_token, qr_version, status, registered_at
) VALUES (
  '00000000-0000-4000-8000-500000000122',
  '00000000-0000-4000-8000-400000000008',
  '00000000-0000-4000-8000-300000000041',
  '8cc3d89be344836ecfd07949870cf792',
  1,
  'checked_in',
  '2026-08-27T09:00:00.000Z'
) ON CONFLICT (id) DO UPDATE SET status = EXCLUDED.status;


INSERT INTO public.registrations (
  id, event_id, participant_id, qr_token, qr_version, status, registered_at
) VALUES (
  '00000000-0000-4000-8000-500000000123',
  '00000000-0000-4000-8000-400000000005',
  '00000000-0000-4000-8000-300000000041',
  'da82e11932574d4207515520e6b55750',
  1,
  'registered',
  '2026-08-18T09:00:00.000Z'
) ON CONFLICT (id) DO UPDATE SET status = EXCLUDED.status;


INSERT INTO public.registrations (
  id, event_id, participant_id, qr_token, qr_version, status, registered_at
) VALUES (
  '00000000-0000-4000-8000-500000000124',
  '00000000-0000-4000-8000-400000000010',
  '00000000-0000-4000-8000-300000000042',
  '9e0b41ce57831dfdd173c27885e489ed',
  1,
  'checked_in',
  '2026-09-02T09:00:00.000Z'
) ON CONFLICT (id) DO UPDATE SET status = EXCLUDED.status;


INSERT INTO public.registrations (
  id, event_id, participant_id, qr_token, qr_version, status, registered_at
) VALUES (
  '00000000-0000-4000-8000-500000000125',
  '00000000-0000-4000-8000-400000000009',
  '00000000-0000-4000-8000-300000000042',
  '75ea3c9df4a5bb0ca9e8e50240f172fb',
  1,
  'registered',
  '2026-08-30T09:00:00.000Z'
) ON CONFLICT (id) DO UPDATE SET status = EXCLUDED.status;


INSERT INTO public.registrations (
  id, event_id, participant_id, qr_token, qr_version, status, registered_at
) VALUES (
  '00000000-0000-4000-8000-500000000126',
  '00000000-0000-4000-8000-400000000004',
  '00000000-0000-4000-8000-300000000042',
  '3cad510e0266553df937754624d3f552',
  1,
  'registered',
  '2026-08-15T09:00:00.000Z'
) ON CONFLICT (id) DO UPDATE SET status = EXCLUDED.status;


INSERT INTO public.registrations (
  id, event_id, participant_id, qr_token, qr_version, status, registered_at
) VALUES (
  '00000000-0000-4000-8000-500000000127',
  '00000000-0000-4000-8000-400000000006',
  '00000000-0000-4000-8000-300000000043',
  'dbcd77e7e2971f3fbbfd830e54a28fe5',
  1,
  'checked_in',
  '2026-08-21T09:00:00.000Z'
) ON CONFLICT (id) DO UPDATE SET status = EXCLUDED.status;


INSERT INTO public.registrations (
  id, event_id, participant_id, qr_token, qr_version, status, registered_at
) VALUES (
  '00000000-0000-4000-8000-500000000128',
  '00000000-0000-4000-8000-400000000002',
  '00000000-0000-4000-8000-300000000043',
  '5d5037612273319771230bf21f43ceac',
  1,
  'registered',
  '2026-08-09T09:00:00.000Z'
) ON CONFLICT (id) DO UPDATE SET status = EXCLUDED.status;


INSERT INTO public.registrations (
  id, event_id, participant_id, qr_token, qr_version, status, registered_at
) VALUES (
  '00000000-0000-4000-8000-500000000129',
  '00000000-0000-4000-8000-400000000005',
  '00000000-0000-4000-8000-300000000043',
  'e617768481e68d9bd0488a74df81b6d9',
  1,
  'registered',
  '2026-08-18T09:00:00.000Z'
) ON CONFLICT (id) DO UPDATE SET status = EXCLUDED.status;


INSERT INTO public.registrations (
  id, event_id, participant_id, qr_token, qr_version, status, registered_at
) VALUES (
  '00000000-0000-4000-8000-500000000130',
  '00000000-0000-4000-8000-400000000008',
  '00000000-0000-4000-8000-300000000044',
  '5cfe99543fc9776649a8a55cbdd40dd2',
  1,
  'registered',
  '2026-08-27T09:00:00.000Z'
) ON CONFLICT (id) DO UPDATE SET status = EXCLUDED.status;


INSERT INTO public.registrations (
  id, event_id, participant_id, qr_token, qr_version, status, registered_at
) VALUES (
  '00000000-0000-4000-8000-500000000131',
  '00000000-0000-4000-8000-400000000005',
  '00000000-0000-4000-8000-300000000044',
  '03ef1e19a2ba970078273083bfbd7ebc',
  1,
  'checked_in',
  '2026-08-18T09:00:00.000Z'
) ON CONFLICT (id) DO UPDATE SET status = EXCLUDED.status;


INSERT INTO public.registrations (
  id, event_id, participant_id, qr_token, qr_version, status, registered_at
) VALUES (
  '00000000-0000-4000-8000-500000000132',
  '00000000-0000-4000-8000-400000000007',
  '00000000-0000-4000-8000-300000000044',
  'ee0dc0f365d400d9ae9fedea7224edf8',
  1,
  'checked_in',
  '2026-08-24T09:00:00.000Z'
) ON CONFLICT (id) DO UPDATE SET status = EXCLUDED.status;


INSERT INTO public.registrations (
  id, event_id, participant_id, qr_token, qr_version, status, registered_at
) VALUES (
  '00000000-0000-4000-8000-500000000133',
  '00000000-0000-4000-8000-400000000009',
  '00000000-0000-4000-8000-300000000045',
  '5dd1b5e40084b4f74349bff328b3ef7f',
  1,
  'checked_in',
  '2026-08-30T09:00:00.000Z'
) ON CONFLICT (id) DO UPDATE SET status = EXCLUDED.status;


INSERT INTO public.registrations (
  id, event_id, participant_id, qr_token, qr_version, status, registered_at
) VALUES (
  '00000000-0000-4000-8000-500000000134',
  '00000000-0000-4000-8000-400000000010',
  '00000000-0000-4000-8000-300000000045',
  'b404212c7ab12514d09373e96e3af25c',
  1,
  'checked_in',
  '2026-09-02T09:00:00.000Z'
) ON CONFLICT (id) DO UPDATE SET status = EXCLUDED.status;


INSERT INTO public.registrations (
  id, event_id, participant_id, qr_token, qr_version, status, registered_at
) VALUES (
  '00000000-0000-4000-8000-500000000135',
  '00000000-0000-4000-8000-400000000002',
  '00000000-0000-4000-8000-300000000045',
  '49471fb58d18e61f3d57b0e0282ae789',
  1,
  'registered',
  '2026-08-09T09:00:00.000Z'
) ON CONFLICT (id) DO UPDATE SET status = EXCLUDED.status;


INSERT INTO public.registrations (
  id, event_id, participant_id, qr_token, qr_version, status, registered_at
) VALUES (
  '00000000-0000-4000-8000-500000000136',
  '00000000-0000-4000-8000-400000000008',
  '00000000-0000-4000-8000-300000000046',
  '35a5f0a8d46b809bd8598c7af948e6d0',
  1,
  'checked_in',
  '2026-08-27T09:00:00.000Z'
) ON CONFLICT (id) DO UPDATE SET status = EXCLUDED.status;


INSERT INTO public.registrations (
  id, event_id, participant_id, qr_token, qr_version, status, registered_at
) VALUES (
  '00000000-0000-4000-8000-500000000137',
  '00000000-0000-4000-8000-400000000002',
  '00000000-0000-4000-8000-300000000046',
  'c07686b94d00ad38a985ffec741f959c',
  1,
  'checked_in',
  '2026-08-09T09:00:00.000Z'
) ON CONFLICT (id) DO UPDATE SET status = EXCLUDED.status;


INSERT INTO public.registrations (
  id, event_id, participant_id, qr_token, qr_version, status, registered_at
) VALUES (
  '00000000-0000-4000-8000-500000000138',
  '00000000-0000-4000-8000-400000000006',
  '00000000-0000-4000-8000-300000000046',
  '7ac3e1e23ef826ed23bae387707a0c74',
  1,
  'registered',
  '2026-08-21T09:00:00.000Z'
) ON CONFLICT (id) DO UPDATE SET status = EXCLUDED.status;


INSERT INTO public.registrations (
  id, event_id, participant_id, qr_token, qr_version, status, registered_at
) VALUES (
  '00000000-0000-4000-8000-500000000139',
  '00000000-0000-4000-8000-400000000004',
  '00000000-0000-4000-8000-300000000047',
  'f2bcc07dd8dcc38ea6d49a16634b153a',
  1,
  'registered',
  '2026-08-15T09:00:00.000Z'
) ON CONFLICT (id) DO UPDATE SET status = EXCLUDED.status;


INSERT INTO public.registrations (
  id, event_id, participant_id, qr_token, qr_version, status, registered_at
) VALUES (
  '00000000-0000-4000-8000-500000000140',
  '00000000-0000-4000-8000-400000000006',
  '00000000-0000-4000-8000-300000000047',
  'fc95846178a506dd8bf33a073ddd7be8',
  1,
  'registered',
  '2026-08-21T09:00:00.000Z'
) ON CONFLICT (id) DO UPDATE SET status = EXCLUDED.status;


INSERT INTO public.registrations (
  id, event_id, participant_id, qr_token, qr_version, status, registered_at
) VALUES (
  '00000000-0000-4000-8000-500000000141',
  '00000000-0000-4000-8000-400000000008',
  '00000000-0000-4000-8000-300000000047',
  'cfde2376c6d14c1bd825390ae5c730f7',
  1,
  'registered',
  '2026-08-27T09:00:00.000Z'
) ON CONFLICT (id) DO UPDATE SET status = EXCLUDED.status;


INSERT INTO public.registrations (
  id, event_id, participant_id, qr_token, qr_version, status, registered_at
) VALUES (
  '00000000-0000-4000-8000-500000000142',
  '00000000-0000-4000-8000-400000000006',
  '00000000-0000-4000-8000-300000000048',
  '13fda99f701186caf0b452bf0e8d09aa',
  1,
  'checked_in',
  '2026-08-21T09:00:00.000Z'
) ON CONFLICT (id) DO UPDATE SET status = EXCLUDED.status;


INSERT INTO public.registrations (
  id, event_id, participant_id, qr_token, qr_version, status, registered_at
) VALUES (
  '00000000-0000-4000-8000-500000000143',
  '00000000-0000-4000-8000-400000000003',
  '00000000-0000-4000-8000-300000000048',
  'df4c00ec1ec964a2a6475ef9641ef465',
  1,
  'checked_in',
  '2026-08-12T09:00:00.000Z'
) ON CONFLICT (id) DO UPDATE SET status = EXCLUDED.status;


INSERT INTO public.registrations (
  id, event_id, participant_id, qr_token, qr_version, status, registered_at
) VALUES (
  '00000000-0000-4000-8000-500000000144',
  '00000000-0000-4000-8000-400000000009',
  '00000000-0000-4000-8000-300000000048',
  'de02fb7f430e26c4c6a0785fb2cc8ed2',
  1,
  'registered',
  '2026-08-30T09:00:00.000Z'
) ON CONFLICT (id) DO UPDATE SET status = EXCLUDED.status;


INSERT INTO public.registrations (
  id, event_id, participant_id, qr_token, qr_version, status, registered_at
) VALUES (
  '00000000-0000-4000-8000-500000000145',
  '00000000-0000-4000-8000-400000000006',
  '00000000-0000-4000-8000-300000000049',
  '91d133369cf0c332055fd4a2d2a815f6',
  1,
  'registered',
  '2026-08-21T09:00:00.000Z'
) ON CONFLICT (id) DO UPDATE SET status = EXCLUDED.status;


INSERT INTO public.registrations (
  id, event_id, participant_id, qr_token, qr_version, status, registered_at
) VALUES (
  '00000000-0000-4000-8000-500000000146',
  '00000000-0000-4000-8000-400000000003',
  '00000000-0000-4000-8000-300000000049',
  '15dee0af495b7603a560355145130ab1',
  1,
  'checked_in',
  '2026-08-12T09:00:00.000Z'
) ON CONFLICT (id) DO UPDATE SET status = EXCLUDED.status;


INSERT INTO public.registrations (
  id, event_id, participant_id, qr_token, qr_version, status, registered_at
) VALUES (
  '00000000-0000-4000-8000-500000000147',
  '00000000-0000-4000-8000-400000000004',
  '00000000-0000-4000-8000-300000000049',
  '2fd78a88cbb42c88530d1ad4a6a9bfd1',
  1,
  'checked_in',
  '2026-08-15T09:00:00.000Z'
) ON CONFLICT (id) DO UPDATE SET status = EXCLUDED.status;


INSERT INTO public.registrations (
  id, event_id, participant_id, qr_token, qr_version, status, registered_at
) VALUES (
  '00000000-0000-4000-8000-500000000148',
  '00000000-0000-4000-8000-400000000004',
  '00000000-0000-4000-8000-300000000050',
  '55078bd5e5af5e335a7848b120e9fad8',
  1,
  'registered',
  '2026-08-15T09:00:00.000Z'
) ON CONFLICT (id) DO UPDATE SET status = EXCLUDED.status;


INSERT INTO public.registrations (
  id, event_id, participant_id, qr_token, qr_version, status, registered_at
) VALUES (
  '00000000-0000-4000-8000-500000000149',
  '00000000-0000-4000-8000-400000000009',
  '00000000-0000-4000-8000-300000000050',
  '9d65c636cf2b42c2bc23f225d5bb2a5f',
  1,
  'registered',
  '2026-08-30T09:00:00.000Z'
) ON CONFLICT (id) DO UPDATE SET status = EXCLUDED.status;


INSERT INTO public.registrations (
  id, event_id, participant_id, qr_token, qr_version, status, registered_at
) VALUES (
  '00000000-0000-4000-8000-500000000150',
  '00000000-0000-4000-8000-400000000010',
  '00000000-0000-4000-8000-300000000050',
  'b338a8ec07e6ca1b61469f717538ba3c',
  1,
  'registered',
  '2026-09-02T09:00:00.000Z'
) ON CONFLICT (id) DO UPDATE SET status = EXCLUDED.status;


INSERT INTO public.registrations (
  id, event_id, participant_id, qr_token, qr_version, status, registered_at
) VALUES (
  '00000000-0000-4000-8000-500000000151',
  '00000000-0000-4000-8000-400000000004',
  '00000000-0000-4000-8000-300000000051',
  '2338963b5b9add798a40fea6776e5bb5',
  1,
  'registered',
  '2026-08-15T09:00:00.000Z'
) ON CONFLICT (id) DO UPDATE SET status = EXCLUDED.status;


INSERT INTO public.registrations (
  id, event_id, participant_id, qr_token, qr_version, status, registered_at
) VALUES (
  '00000000-0000-4000-8000-500000000152',
  '00000000-0000-4000-8000-400000000010',
  '00000000-0000-4000-8000-300000000051',
  '010e4c60c3bf258286bff6ee9ab85f4b',
  1,
  'checked_in',
  '2026-09-02T09:00:00.000Z'
) ON CONFLICT (id) DO UPDATE SET status = EXCLUDED.status;


INSERT INTO public.registrations (
  id, event_id, participant_id, qr_token, qr_version, status, registered_at
) VALUES (
  '00000000-0000-4000-8000-500000000153',
  '00000000-0000-4000-8000-400000000007',
  '00000000-0000-4000-8000-300000000051',
  '470c857a6917ab28946914d0894bb90e',
  1,
  'registered',
  '2026-08-24T09:00:00.000Z'
) ON CONFLICT (id) DO UPDATE SET status = EXCLUDED.status;


INSERT INTO public.registrations (
  id, event_id, participant_id, qr_token, qr_version, status, registered_at
) VALUES (
  '00000000-0000-4000-8000-500000000154',
  '00000000-0000-4000-8000-400000000003',
  '00000000-0000-4000-8000-300000000052',
  'a846de74a7f0c9dbe209eb4cc34efc08',
  1,
  'registered',
  '2026-08-12T09:00:00.000Z'
) ON CONFLICT (id) DO UPDATE SET status = EXCLUDED.status;


INSERT INTO public.registrations (
  id, event_id, participant_id, qr_token, qr_version, status, registered_at
) VALUES (
  '00000000-0000-4000-8000-500000000155',
  '00000000-0000-4000-8000-400000000004',
  '00000000-0000-4000-8000-300000000052',
  'ec8476e8749f28baf31c0cb362156980',
  1,
  'registered',
  '2026-08-15T09:00:00.000Z'
) ON CONFLICT (id) DO UPDATE SET status = EXCLUDED.status;


INSERT INTO public.registrations (
  id, event_id, participant_id, qr_token, qr_version, status, registered_at
) VALUES (
  '00000000-0000-4000-8000-500000000156',
  '00000000-0000-4000-8000-400000000009',
  '00000000-0000-4000-8000-300000000052',
  '7438b8f46f11f661b10a4bf3527cc201',
  1,
  'checked_in',
  '2026-08-30T09:00:00.000Z'
) ON CONFLICT (id) DO UPDATE SET status = EXCLUDED.status;


INSERT INTO public.registrations (
  id, event_id, participant_id, qr_token, qr_version, status, registered_at
) VALUES (
  '00000000-0000-4000-8000-500000000157',
  '00000000-0000-4000-8000-400000000001',
  '00000000-0000-4000-8000-300000000053',
  '2beb2a8cd67192f04c7d38839fab4d8b',
  1,
  'checked_in',
  '2026-08-06T09:00:00.000Z'
) ON CONFLICT (id) DO UPDATE SET status = EXCLUDED.status;


INSERT INTO public.registrations (
  id, event_id, participant_id, qr_token, qr_version, status, registered_at
) VALUES (
  '00000000-0000-4000-8000-500000000158',
  '00000000-0000-4000-8000-400000000006',
  '00000000-0000-4000-8000-300000000053',
  'a2b6a129095729f18ce3e320a6c996f1',
  1,
  'checked_in',
  '2026-08-21T09:00:00.000Z'
) ON CONFLICT (id) DO UPDATE SET status = EXCLUDED.status;


INSERT INTO public.registrations (
  id, event_id, participant_id, qr_token, qr_version, status, registered_at
) VALUES (
  '00000000-0000-4000-8000-500000000159',
  '00000000-0000-4000-8000-400000000009',
  '00000000-0000-4000-8000-300000000053',
  '28bb688ab02034df0596e88424a94429',
  1,
  'registered',
  '2026-08-30T09:00:00.000Z'
) ON CONFLICT (id) DO UPDATE SET status = EXCLUDED.status;


INSERT INTO public.registrations (
  id, event_id, participant_id, qr_token, qr_version, status, registered_at
) VALUES (
  '00000000-0000-4000-8000-500000000160',
  '00000000-0000-4000-8000-400000000008',
  '00000000-0000-4000-8000-300000000054',
  '9be6b980eb881365601257044cb063fd',
  1,
  'registered',
  '2026-08-27T09:00:00.000Z'
) ON CONFLICT (id) DO UPDATE SET status = EXCLUDED.status;


INSERT INTO public.registrations (
  id, event_id, participant_id, qr_token, qr_version, status, registered_at
) VALUES (
  '00000000-0000-4000-8000-500000000161',
  '00000000-0000-4000-8000-400000000002',
  '00000000-0000-4000-8000-300000000054',
  '14b36ea58de8f69a7bb06ce1efc62ce4',
  1,
  'checked_in',
  '2026-08-09T09:00:00.000Z'
) ON CONFLICT (id) DO UPDATE SET status = EXCLUDED.status;


INSERT INTO public.registrations (
  id, event_id, participant_id, qr_token, qr_version, status, registered_at
) VALUES (
  '00000000-0000-4000-8000-500000000162',
  '00000000-0000-4000-8000-400000000010',
  '00000000-0000-4000-8000-300000000054',
  'c402fe298b94d4250a252ae26913365c',
  1,
  'registered',
  '2026-09-02T09:00:00.000Z'
) ON CONFLICT (id) DO UPDATE SET status = EXCLUDED.status;


INSERT INTO public.registrations (
  id, event_id, participant_id, qr_token, qr_version, status, registered_at
) VALUES (
  '00000000-0000-4000-8000-500000000163',
  '00000000-0000-4000-8000-400000000010',
  '00000000-0000-4000-8000-300000000055',
  'a5f7355fda5599331e7ae58de5a412da',
  1,
  'checked_in',
  '2026-09-02T09:00:00.000Z'
) ON CONFLICT (id) DO UPDATE SET status = EXCLUDED.status;


INSERT INTO public.registrations (
  id, event_id, participant_id, qr_token, qr_version, status, registered_at
) VALUES (
  '00000000-0000-4000-8000-500000000164',
  '00000000-0000-4000-8000-400000000002',
  '00000000-0000-4000-8000-300000000055',
  '6ff29d2e458f571bb13a490899c34ac9',
  1,
  'registered',
  '2026-08-09T09:00:00.000Z'
) ON CONFLICT (id) DO UPDATE SET status = EXCLUDED.status;


INSERT INTO public.registrations (
  id, event_id, participant_id, qr_token, qr_version, status, registered_at
) VALUES (
  '00000000-0000-4000-8000-500000000165',
  '00000000-0000-4000-8000-400000000008',
  '00000000-0000-4000-8000-300000000055',
  'b14ae870e7aa7dbe2253d785fee9a684',
  1,
  'registered',
  '2026-08-27T09:00:00.000Z'
) ON CONFLICT (id) DO UPDATE SET status = EXCLUDED.status;


INSERT INTO public.registrations (
  id, event_id, participant_id, qr_token, qr_version, status, registered_at
) VALUES (
  '00000000-0000-4000-8000-500000000166',
  '00000000-0000-4000-8000-400000000001',
  '00000000-0000-4000-8000-300000000056',
  '4bc87c63f0a3f829902cbebca4d0c4b2',
  1,
  'registered',
  '2026-08-06T09:00:00.000Z'
) ON CONFLICT (id) DO UPDATE SET status = EXCLUDED.status;


INSERT INTO public.registrations (
  id, event_id, participant_id, qr_token, qr_version, status, registered_at
) VALUES (
  '00000000-0000-4000-8000-500000000167',
  '00000000-0000-4000-8000-400000000005',
  '00000000-0000-4000-8000-300000000056',
  '0c667e9b4449b5fd5b6580dbca9cb06c',
  1,
  'checked_in',
  '2026-08-18T09:00:00.000Z'
) ON CONFLICT (id) DO UPDATE SET status = EXCLUDED.status;


INSERT INTO public.registrations (
  id, event_id, participant_id, qr_token, qr_version, status, registered_at
) VALUES (
  '00000000-0000-4000-8000-500000000168',
  '00000000-0000-4000-8000-400000000008',
  '00000000-0000-4000-8000-300000000056',
  'a2f23176ff46426fdcded0ee3543c6a6',
  1,
  'checked_in',
  '2026-08-27T09:00:00.000Z'
) ON CONFLICT (id) DO UPDATE SET status = EXCLUDED.status;


INSERT INTO public.registrations (
  id, event_id, participant_id, qr_token, qr_version, status, registered_at
) VALUES (
  '00000000-0000-4000-8000-500000000169',
  '00000000-0000-4000-8000-400000000005',
  '00000000-0000-4000-8000-300000000057',
  'ab33a959b5da49e5345aeb742bdc3d90',
  1,
  'registered',
  '2026-08-18T09:00:00.000Z'
) ON CONFLICT (id) DO UPDATE SET status = EXCLUDED.status;


INSERT INTO public.registrations (
  id, event_id, participant_id, qr_token, qr_version, status, registered_at
) VALUES (
  '00000000-0000-4000-8000-500000000170',
  '00000000-0000-4000-8000-400000000003',
  '00000000-0000-4000-8000-300000000057',
  '6d49d6919b9ab6e5f0b2bfd046415a9d',
  1,
  'registered',
  '2026-08-12T09:00:00.000Z'
) ON CONFLICT (id) DO UPDATE SET status = EXCLUDED.status;


INSERT INTO public.registrations (
  id, event_id, participant_id, qr_token, qr_version, status, registered_at
) VALUES (
  '00000000-0000-4000-8000-500000000171',
  '00000000-0000-4000-8000-400000000008',
  '00000000-0000-4000-8000-300000000057',
  '8455fa3abaf7bce55ee9f5b07e32b051',
  1,
  'registered',
  '2026-08-27T09:00:00.000Z'
) ON CONFLICT (id) DO UPDATE SET status = EXCLUDED.status;


INSERT INTO public.registrations (
  id, event_id, participant_id, qr_token, qr_version, status, registered_at
) VALUES (
  '00000000-0000-4000-8000-500000000172',
  '00000000-0000-4000-8000-400000000006',
  '00000000-0000-4000-8000-300000000058',
  'd38d337f0a93d828e6b0068244e919e0',
  1,
  'checked_in',
  '2026-08-21T09:00:00.000Z'
) ON CONFLICT (id) DO UPDATE SET status = EXCLUDED.status;


INSERT INTO public.registrations (
  id, event_id, participant_id, qr_token, qr_version, status, registered_at
) VALUES (
  '00000000-0000-4000-8000-500000000173',
  '00000000-0000-4000-8000-400000000004',
  '00000000-0000-4000-8000-300000000058',
  'c16f5dcdefc174e7d7e7fe5fd898ab4c',
  1,
  'registered',
  '2026-08-15T09:00:00.000Z'
) ON CONFLICT (id) DO UPDATE SET status = EXCLUDED.status;


INSERT INTO public.registrations (
  id, event_id, participant_id, qr_token, qr_version, status, registered_at
) VALUES (
  '00000000-0000-4000-8000-500000000174',
  '00000000-0000-4000-8000-400000000001',
  '00000000-0000-4000-8000-300000000058',
  '1bc5047bbace5060d4d772d1971810c0',
  1,
  'registered',
  '2026-08-06T09:00:00.000Z'
) ON CONFLICT (id) DO UPDATE SET status = EXCLUDED.status;


INSERT INTO public.registrations (
  id, event_id, participant_id, qr_token, qr_version, status, registered_at
) VALUES (
  '00000000-0000-4000-8000-500000000175',
  '00000000-0000-4000-8000-400000000003',
  '00000000-0000-4000-8000-300000000059',
  '7e08768f41e5ce77f0088008db8d22ab',
  1,
  'checked_in',
  '2026-08-12T09:00:00.000Z'
) ON CONFLICT (id) DO UPDATE SET status = EXCLUDED.status;


INSERT INTO public.registrations (
  id, event_id, participant_id, qr_token, qr_version, status, registered_at
) VALUES (
  '00000000-0000-4000-8000-500000000176',
  '00000000-0000-4000-8000-400000000010',
  '00000000-0000-4000-8000-300000000059',
  '6ebda9d720e41a0f352222b22ff6c1d4',
  1,
  'checked_in',
  '2026-09-02T09:00:00.000Z'
) ON CONFLICT (id) DO UPDATE SET status = EXCLUDED.status;


INSERT INTO public.registrations (
  id, event_id, participant_id, qr_token, qr_version, status, registered_at
) VALUES (
  '00000000-0000-4000-8000-500000000177',
  '00000000-0000-4000-8000-400000000005',
  '00000000-0000-4000-8000-300000000059',
  'e4680c6b6b7374ab479273f91c0e32af',
  1,
  'registered',
  '2026-08-18T09:00:00.000Z'
) ON CONFLICT (id) DO UPDATE SET status = EXCLUDED.status;


INSERT INTO public.registrations (
  id, event_id, participant_id, qr_token, qr_version, status, registered_at
) VALUES (
  '00000000-0000-4000-8000-500000000178',
  '00000000-0000-4000-8000-400000000004',
  '00000000-0000-4000-8000-300000000060',
  '199b0b5154754527b99ba2cb9484eb33',
  1,
  'checked_in',
  '2026-08-15T09:00:00.000Z'
) ON CONFLICT (id) DO UPDATE SET status = EXCLUDED.status;


INSERT INTO public.registrations (
  id, event_id, participant_id, qr_token, qr_version, status, registered_at
) VALUES (
  '00000000-0000-4000-8000-500000000179',
  '00000000-0000-4000-8000-400000000005',
  '00000000-0000-4000-8000-300000000060',
  '3ee82f304ef711dba5bdf2d917ddd03b',
  1,
  'checked_in',
  '2026-08-18T09:00:00.000Z'
) ON CONFLICT (id) DO UPDATE SET status = EXCLUDED.status;


INSERT INTO public.registrations (
  id, event_id, participant_id, qr_token, qr_version, status, registered_at
) VALUES (
  '00000000-0000-4000-8000-500000000180',
  '00000000-0000-4000-8000-400000000006',
  '00000000-0000-4000-8000-300000000060',
  '4b944962bec8c32baecbcc2facbc59f9',
  1,
  'checked_in',
  '2026-08-21T09:00:00.000Z'
) ON CONFLICT (id) DO UPDATE SET status = EXCLUDED.status;


INSERT INTO public.registrations (
  id, event_id, participant_id, qr_token, qr_version, status, registered_at
) VALUES (
  '00000000-0000-4000-8000-500000000181',
  '00000000-0000-4000-8000-400000000004',
  '00000000-0000-4000-8000-300000000061',
  '57e3d9ef14e00f755998b9bcabbb0095',
  1,
  'checked_in',
  '2026-08-15T09:00:00.000Z'
) ON CONFLICT (id) DO UPDATE SET status = EXCLUDED.status;


INSERT INTO public.registrations (
  id, event_id, participant_id, qr_token, qr_version, status, registered_at
) VALUES (
  '00000000-0000-4000-8000-500000000182',
  '00000000-0000-4000-8000-400000000009',
  '00000000-0000-4000-8000-300000000061',
  'aaa6383bf895babc2205818270124fbf',
  1,
  'checked_in',
  '2026-08-30T09:00:00.000Z'
) ON CONFLICT (id) DO UPDATE SET status = EXCLUDED.status;


INSERT INTO public.registrations (
  id, event_id, participant_id, qr_token, qr_version, status, registered_at
) VALUES (
  '00000000-0000-4000-8000-500000000183',
  '00000000-0000-4000-8000-400000000003',
  '00000000-0000-4000-8000-300000000061',
  'ec566af9adf185c31803574883c25c5f',
  1,
  'registered',
  '2026-08-12T09:00:00.000Z'
) ON CONFLICT (id) DO UPDATE SET status = EXCLUDED.status;


INSERT INTO public.registrations (
  id, event_id, participant_id, qr_token, qr_version, status, registered_at
) VALUES (
  '00000000-0000-4000-8000-500000000184',
  '00000000-0000-4000-8000-400000000007',
  '00000000-0000-4000-8000-300000000062',
  '2bda90d196cbc486def1f03a318f0918',
  1,
  'checked_in',
  '2026-08-24T09:00:00.000Z'
) ON CONFLICT (id) DO UPDATE SET status = EXCLUDED.status;


INSERT INTO public.registrations (
  id, event_id, participant_id, qr_token, qr_version, status, registered_at
) VALUES (
  '00000000-0000-4000-8000-500000000185',
  '00000000-0000-4000-8000-400000000004',
  '00000000-0000-4000-8000-300000000062',
  '6c1835eb875dc4e59ede3dc417c2350e',
  1,
  'registered',
  '2026-08-15T09:00:00.000Z'
) ON CONFLICT (id) DO UPDATE SET status = EXCLUDED.status;


INSERT INTO public.registrations (
  id, event_id, participant_id, qr_token, qr_version, status, registered_at
) VALUES (
  '00000000-0000-4000-8000-500000000186',
  '00000000-0000-4000-8000-400000000003',
  '00000000-0000-4000-8000-300000000062',
  '1f8d62bac79e72ec54dd60762497468c',
  1,
  'registered',
  '2026-08-12T09:00:00.000Z'
) ON CONFLICT (id) DO UPDATE SET status = EXCLUDED.status;


INSERT INTO public.registrations (
  id, event_id, participant_id, qr_token, qr_version, status, registered_at
) VALUES (
  '00000000-0000-4000-8000-500000000187',
  '00000000-0000-4000-8000-400000000002',
  '00000000-0000-4000-8000-300000000063',
  '40129731da7370570631cceb783b51bd',
  1,
  'checked_in',
  '2026-08-09T09:00:00.000Z'
) ON CONFLICT (id) DO UPDATE SET status = EXCLUDED.status;


INSERT INTO public.registrations (
  id, event_id, participant_id, qr_token, qr_version, status, registered_at
) VALUES (
  '00000000-0000-4000-8000-500000000188',
  '00000000-0000-4000-8000-400000000006',
  '00000000-0000-4000-8000-300000000063',
  'babd32dc1b487c5f527fb67c6bd15552',
  1,
  'registered',
  '2026-08-21T09:00:00.000Z'
) ON CONFLICT (id) DO UPDATE SET status = EXCLUDED.status;


INSERT INTO public.registrations (
  id, event_id, participant_id, qr_token, qr_version, status, registered_at
) VALUES (
  '00000000-0000-4000-8000-500000000189',
  '00000000-0000-4000-8000-400000000007',
  '00000000-0000-4000-8000-300000000063',
  'd2b7753aa3695eb3cdfcf5f5b8396fa0',
  1,
  'registered',
  '2026-08-24T09:00:00.000Z'
) ON CONFLICT (id) DO UPDATE SET status = EXCLUDED.status;


INSERT INTO public.registrations (
  id, event_id, participant_id, qr_token, qr_version, status, registered_at
) VALUES (
  '00000000-0000-4000-8000-500000000190',
  '00000000-0000-4000-8000-400000000002',
  '00000000-0000-4000-8000-300000000064',
  'a05e44daf1a35f58cf9d5ccb5180a113',
  1,
  'checked_in',
  '2026-08-09T09:00:00.000Z'
) ON CONFLICT (id) DO UPDATE SET status = EXCLUDED.status;


INSERT INTO public.registrations (
  id, event_id, participant_id, qr_token, qr_version, status, registered_at
) VALUES (
  '00000000-0000-4000-8000-500000000191',
  '00000000-0000-4000-8000-400000000009',
  '00000000-0000-4000-8000-300000000064',
  'e1d10e5dcd9a0634f8368f4c3b5dafef',
  1,
  'registered',
  '2026-08-30T09:00:00.000Z'
) ON CONFLICT (id) DO UPDATE SET status = EXCLUDED.status;


INSERT INTO public.registrations (
  id, event_id, participant_id, qr_token, qr_version, status, registered_at
) VALUES (
  '00000000-0000-4000-8000-500000000192',
  '00000000-0000-4000-8000-400000000005',
  '00000000-0000-4000-8000-300000000064',
  '8da96cc84073306bfba870ee2b73c7c9',
  1,
  'checked_in',
  '2026-08-18T09:00:00.000Z'
) ON CONFLICT (id) DO UPDATE SET status = EXCLUDED.status;


INSERT INTO public.registrations (
  id, event_id, participant_id, qr_token, qr_version, status, registered_at
) VALUES (
  '00000000-0000-4000-8000-500000000193',
  '00000000-0000-4000-8000-400000000006',
  '00000000-0000-4000-8000-300000000065',
  'd137133537ffbff95c88b13c96de7b8d',
  1,
  'registered',
  '2026-08-21T09:00:00.000Z'
) ON CONFLICT (id) DO UPDATE SET status = EXCLUDED.status;


INSERT INTO public.registrations (
  id, event_id, participant_id, qr_token, qr_version, status, registered_at
) VALUES (
  '00000000-0000-4000-8000-500000000194',
  '00000000-0000-4000-8000-400000000004',
  '00000000-0000-4000-8000-300000000065',
  '47dd343da994218c331a96f1c2679af3',
  1,
  'checked_in',
  '2026-08-15T09:00:00.000Z'
) ON CONFLICT (id) DO UPDATE SET status = EXCLUDED.status;


INSERT INTO public.registrations (
  id, event_id, participant_id, qr_token, qr_version, status, registered_at
) VALUES (
  '00000000-0000-4000-8000-500000000195',
  '00000000-0000-4000-8000-400000000003',
  '00000000-0000-4000-8000-300000000065',
  '7288cd596d1d9998e303d1acc14bfd9f',
  1,
  'checked_in',
  '2026-08-12T09:00:00.000Z'
) ON CONFLICT (id) DO UPDATE SET status = EXCLUDED.status;


INSERT INTO public.registrations (
  id, event_id, participant_id, qr_token, qr_version, status, registered_at
) VALUES (
  '00000000-0000-4000-8000-500000000196',
  '00000000-0000-4000-8000-400000000009',
  '00000000-0000-4000-8000-300000000066',
  '385dc8b33bb21d32f0c5e127489b03d7',
  1,
  'registered',
  '2026-08-30T09:00:00.000Z'
) ON CONFLICT (id) DO UPDATE SET status = EXCLUDED.status;


INSERT INTO public.registrations (
  id, event_id, participant_id, qr_token, qr_version, status, registered_at
) VALUES (
  '00000000-0000-4000-8000-500000000197',
  '00000000-0000-4000-8000-400000000003',
  '00000000-0000-4000-8000-300000000066',
  '8b347bab15ac18afa161c78dd66a4f30',
  1,
  'checked_in',
  '2026-08-12T09:00:00.000Z'
) ON CONFLICT (id) DO UPDATE SET status = EXCLUDED.status;


INSERT INTO public.registrations (
  id, event_id, participant_id, qr_token, qr_version, status, registered_at
) VALUES (
  '00000000-0000-4000-8000-500000000198',
  '00000000-0000-4000-8000-400000000008',
  '00000000-0000-4000-8000-300000000066',
  '3c58c11c985c3353ee14e8db76ce6ccc',
  1,
  'checked_in',
  '2026-08-27T09:00:00.000Z'
) ON CONFLICT (id) DO UPDATE SET status = EXCLUDED.status;


INSERT INTO public.registrations (
  id, event_id, participant_id, qr_token, qr_version, status, registered_at
) VALUES (
  '00000000-0000-4000-8000-500000000199',
  '00000000-0000-4000-8000-400000000006',
  '00000000-0000-4000-8000-300000000067',
  '0ac95b3b692af552c079f6f63eb7f580',
  1,
  'checked_in',
  '2026-08-21T09:00:00.000Z'
) ON CONFLICT (id) DO UPDATE SET status = EXCLUDED.status;


INSERT INTO public.registrations (
  id, event_id, participant_id, qr_token, qr_version, status, registered_at
) VALUES (
  '00000000-0000-4000-8000-500000000200',
  '00000000-0000-4000-8000-400000000003',
  '00000000-0000-4000-8000-300000000067',
  '054b275ef1ee235649a3442dd9ff2375',
  1,
  'checked_in',
  '2026-08-12T09:00:00.000Z'
) ON CONFLICT (id) DO UPDATE SET status = EXCLUDED.status;


INSERT INTO public.registrations (
  id, event_id, participant_id, qr_token, qr_version, status, registered_at
) VALUES (
  '00000000-0000-4000-8000-500000000201',
  '00000000-0000-4000-8000-400000000002',
  '00000000-0000-4000-8000-300000000067',
  'c5121ba23bc6bb0e5eb6defe268fc143',
  1,
  'checked_in',
  '2026-08-09T09:00:00.000Z'
) ON CONFLICT (id) DO UPDATE SET status = EXCLUDED.status;


INSERT INTO public.registrations (
  id, event_id, participant_id, qr_token, qr_version, status, registered_at
) VALUES (
  '00000000-0000-4000-8000-500000000202',
  '00000000-0000-4000-8000-400000000009',
  '00000000-0000-4000-8000-300000000068',
  'b4e0d02c8d96b952233fae2a71781925',
  1,
  'registered',
  '2026-08-30T09:00:00.000Z'
) ON CONFLICT (id) DO UPDATE SET status = EXCLUDED.status;


INSERT INTO public.registrations (
  id, event_id, participant_id, qr_token, qr_version, status, registered_at
) VALUES (
  '00000000-0000-4000-8000-500000000203',
  '00000000-0000-4000-8000-400000000006',
  '00000000-0000-4000-8000-300000000068',
  'faa3b9c12bcd2c6dad0a1cc5e8457f52',
  1,
  'checked_in',
  '2026-08-21T09:00:00.000Z'
) ON CONFLICT (id) DO UPDATE SET status = EXCLUDED.status;


INSERT INTO public.registrations (
  id, event_id, participant_id, qr_token, qr_version, status, registered_at
) VALUES (
  '00000000-0000-4000-8000-500000000204',
  '00000000-0000-4000-8000-400000000004',
  '00000000-0000-4000-8000-300000000068',
  'a4da4acec8d8509b6913f68462b18fba',
  1,
  'registered',
  '2026-08-15T09:00:00.000Z'
) ON CONFLICT (id) DO UPDATE SET status = EXCLUDED.status;


INSERT INTO public.registrations (
  id, event_id, participant_id, qr_token, qr_version, status, registered_at
) VALUES (
  '00000000-0000-4000-8000-500000000205',
  '00000000-0000-4000-8000-400000000007',
  '00000000-0000-4000-8000-300000000069',
  'bbd7b5ffabc7f5e01550c904756bf50c',
  1,
  'registered',
  '2026-08-24T09:00:00.000Z'
) ON CONFLICT (id) DO UPDATE SET status = EXCLUDED.status;


INSERT INTO public.registrations (
  id, event_id, participant_id, qr_token, qr_version, status, registered_at
) VALUES (
  '00000000-0000-4000-8000-500000000206',
  '00000000-0000-4000-8000-400000000003',
  '00000000-0000-4000-8000-300000000069',
  'b1f526ae4ccc2d9fed174da8f5883cfa',
  1,
  'registered',
  '2026-08-12T09:00:00.000Z'
) ON CONFLICT (id) DO UPDATE SET status = EXCLUDED.status;


INSERT INTO public.registrations (
  id, event_id, participant_id, qr_token, qr_version, status, registered_at
) VALUES (
  '00000000-0000-4000-8000-500000000207',
  '00000000-0000-4000-8000-400000000009',
  '00000000-0000-4000-8000-300000000069',
  '7392314ed36d6a849e010010722c820d',
  1,
  'registered',
  '2026-08-30T09:00:00.000Z'
) ON CONFLICT (id) DO UPDATE SET status = EXCLUDED.status;


INSERT INTO public.registrations (
  id, event_id, participant_id, qr_token, qr_version, status, registered_at
) VALUES (
  '00000000-0000-4000-8000-500000000208',
  '00000000-0000-4000-8000-400000000008',
  '00000000-0000-4000-8000-300000000070',
  '95e78e8cfe239709299e3d3e9744addf',
  1,
  'checked_in',
  '2026-08-27T09:00:00.000Z'
) ON CONFLICT (id) DO UPDATE SET status = EXCLUDED.status;


INSERT INTO public.registrations (
  id, event_id, participant_id, qr_token, qr_version, status, registered_at
) VALUES (
  '00000000-0000-4000-8000-500000000209',
  '00000000-0000-4000-8000-400000000010',
  '00000000-0000-4000-8000-300000000070',
  '82c14483410d6962e9cc16cd61c6ff50',
  1,
  'registered',
  '2026-09-02T09:00:00.000Z'
) ON CONFLICT (id) DO UPDATE SET status = EXCLUDED.status;


INSERT INTO public.registrations (
  id, event_id, participant_id, qr_token, qr_version, status, registered_at
) VALUES (
  '00000000-0000-4000-8000-500000000210',
  '00000000-0000-4000-8000-400000000006',
  '00000000-0000-4000-8000-300000000070',
  '72eaeece27442f92b6f48016c618ddeb',
  1,
  'checked_in',
  '2026-08-21T09:00:00.000Z'
) ON CONFLICT (id) DO UPDATE SET status = EXCLUDED.status;


INSERT INTO public.registrations (
  id, event_id, participant_id, qr_token, qr_version, status, registered_at
) VALUES (
  '00000000-0000-4000-8000-500000000211',
  '00000000-0000-4000-8000-400000000003',
  '00000000-0000-4000-8000-300000000071',
  '3eb66773fac18c6e6380582eb95be427',
  1,
  'registered',
  '2026-08-12T09:00:00.000Z'
) ON CONFLICT (id) DO UPDATE SET status = EXCLUDED.status;


INSERT INTO public.registrations (
  id, event_id, participant_id, qr_token, qr_version, status, registered_at
) VALUES (
  '00000000-0000-4000-8000-500000000212',
  '00000000-0000-4000-8000-400000000010',
  '00000000-0000-4000-8000-300000000071',
  '40360376c49a25967e4c45ed5947eff8',
  1,
  'checked_in',
  '2026-09-02T09:00:00.000Z'
) ON CONFLICT (id) DO UPDATE SET status = EXCLUDED.status;


INSERT INTO public.registrations (
  id, event_id, participant_id, qr_token, qr_version, status, registered_at
) VALUES (
  '00000000-0000-4000-8000-500000000213',
  '00000000-0000-4000-8000-400000000006',
  '00000000-0000-4000-8000-300000000071',
  '84764f9bc67bef7f19de90552bbaeba7',
  1,
  'registered',
  '2026-08-21T09:00:00.000Z'
) ON CONFLICT (id) DO UPDATE SET status = EXCLUDED.status;


INSERT INTO public.registrations (
  id, event_id, participant_id, qr_token, qr_version, status, registered_at
) VALUES (
  '00000000-0000-4000-8000-500000000214',
  '00000000-0000-4000-8000-400000000001',
  '00000000-0000-4000-8000-300000000072',
  'd905d8e9fe52739bda9b4bcb1d380709',
  1,
  'checked_in',
  '2026-08-06T09:00:00.000Z'
) ON CONFLICT (id) DO UPDATE SET status = EXCLUDED.status;


INSERT INTO public.registrations (
  id, event_id, participant_id, qr_token, qr_version, status, registered_at
) VALUES (
  '00000000-0000-4000-8000-500000000215',
  '00000000-0000-4000-8000-400000000003',
  '00000000-0000-4000-8000-300000000072',
  '615f2f48aec9ed05f0686c17a72b3856',
  1,
  'checked_in',
  '2026-08-12T09:00:00.000Z'
) ON CONFLICT (id) DO UPDATE SET status = EXCLUDED.status;


INSERT INTO public.registrations (
  id, event_id, participant_id, qr_token, qr_version, status, registered_at
) VALUES (
  '00000000-0000-4000-8000-500000000216',
  '00000000-0000-4000-8000-400000000004',
  '00000000-0000-4000-8000-300000000072',
  '1d589f1d36feb7ec4ccad0db99121645',
  1,
  'registered',
  '2026-08-15T09:00:00.000Z'
) ON CONFLICT (id) DO UPDATE SET status = EXCLUDED.status;


INSERT INTO public.registrations (
  id, event_id, participant_id, qr_token, qr_version, status, registered_at
) VALUES (
  '00000000-0000-4000-8000-500000000217',
  '00000000-0000-4000-8000-400000000005',
  '00000000-0000-4000-8000-300000000073',
  'c1b6d8cc88fc973c0607d7732a950fcb',
  1,
  'checked_in',
  '2026-08-18T09:00:00.000Z'
) ON CONFLICT (id) DO UPDATE SET status = EXCLUDED.status;


INSERT INTO public.registrations (
  id, event_id, participant_id, qr_token, qr_version, status, registered_at
) VALUES (
  '00000000-0000-4000-8000-500000000218',
  '00000000-0000-4000-8000-400000000010',
  '00000000-0000-4000-8000-300000000073',
  '68197953c922a25014f2a068f29164be',
  1,
  'registered',
  '2026-09-02T09:00:00.000Z'
) ON CONFLICT (id) DO UPDATE SET status = EXCLUDED.status;


INSERT INTO public.registrations (
  id, event_id, participant_id, qr_token, qr_version, status, registered_at
) VALUES (
  '00000000-0000-4000-8000-500000000219',
  '00000000-0000-4000-8000-400000000001',
  '00000000-0000-4000-8000-300000000073',
  '3494b0acec88b984904bf4b76f3e2b40',
  1,
  'registered',
  '2026-08-06T09:00:00.000Z'
) ON CONFLICT (id) DO UPDATE SET status = EXCLUDED.status;


INSERT INTO public.registrations (
  id, event_id, participant_id, qr_token, qr_version, status, registered_at
) VALUES (
  '00000000-0000-4000-8000-500000000220',
  '00000000-0000-4000-8000-400000000001',
  '00000000-0000-4000-8000-300000000074',
  'af11261e2bd605d9b50c97113687342a',
  1,
  'checked_in',
  '2026-08-06T09:00:00.000Z'
) ON CONFLICT (id) DO UPDATE SET status = EXCLUDED.status;


INSERT INTO public.registrations (
  id, event_id, participant_id, qr_token, qr_version, status, registered_at
) VALUES (
  '00000000-0000-4000-8000-500000000221',
  '00000000-0000-4000-8000-400000000007',
  '00000000-0000-4000-8000-300000000074',
  'bcaede885020ed8d4db9b48abc60d00c',
  1,
  'checked_in',
  '2026-08-24T09:00:00.000Z'
) ON CONFLICT (id) DO UPDATE SET status = EXCLUDED.status;


INSERT INTO public.registrations (
  id, event_id, participant_id, qr_token, qr_version, status, registered_at
) VALUES (
  '00000000-0000-4000-8000-500000000222',
  '00000000-0000-4000-8000-400000000008',
  '00000000-0000-4000-8000-300000000074',
  '1a7b07a9e8044249ea56820f9369f7a5',
  1,
  'registered',
  '2026-08-27T09:00:00.000Z'
) ON CONFLICT (id) DO UPDATE SET status = EXCLUDED.status;


INSERT INTO public.registrations (
  id, event_id, participant_id, qr_token, qr_version, status, registered_at
) VALUES (
  '00000000-0000-4000-8000-500000000223',
  '00000000-0000-4000-8000-400000000010',
  '00000000-0000-4000-8000-300000000075',
  '94f78df434daa389540c6d9b21cc4f46',
  1,
  'checked_in',
  '2026-09-02T09:00:00.000Z'
) ON CONFLICT (id) DO UPDATE SET status = EXCLUDED.status;


INSERT INTO public.registrations (
  id, event_id, participant_id, qr_token, qr_version, status, registered_at
) VALUES (
  '00000000-0000-4000-8000-500000000224',
  '00000000-0000-4000-8000-400000000002',
  '00000000-0000-4000-8000-300000000075',
  '8ffd8a3883da61eb9c9d076fb809f259',
  1,
  'registered',
  '2026-08-09T09:00:00.000Z'
) ON CONFLICT (id) DO UPDATE SET status = EXCLUDED.status;


INSERT INTO public.registrations (
  id, event_id, participant_id, qr_token, qr_version, status, registered_at
) VALUES (
  '00000000-0000-4000-8000-500000000225',
  '00000000-0000-4000-8000-400000000001',
  '00000000-0000-4000-8000-300000000075',
  '54cddd026698bbe2b721d55cbcf27aee',
  1,
  'checked_in',
  '2026-08-06T09:00:00.000Z'
) ON CONFLICT (id) DO UPDATE SET status = EXCLUDED.status;


INSERT INTO public.registrations (
  id, event_id, participant_id, qr_token, qr_version, status, registered_at
) VALUES (
  '00000000-0000-4000-8000-500000000226',
  '00000000-0000-4000-8000-400000000006',
  '00000000-0000-4000-8000-300000000076',
  'b13035c2c4d9b8fbdb5a0796130daaa1',
  1,
  'registered',
  '2026-08-21T09:00:00.000Z'
) ON CONFLICT (id) DO UPDATE SET status = EXCLUDED.status;


INSERT INTO public.registrations (
  id, event_id, participant_id, qr_token, qr_version, status, registered_at
) VALUES (
  '00000000-0000-4000-8000-500000000227',
  '00000000-0000-4000-8000-400000000007',
  '00000000-0000-4000-8000-300000000076',
  'd1f67072644c3a290e8af128e6eaede9',
  1,
  'registered',
  '2026-08-24T09:00:00.000Z'
) ON CONFLICT (id) DO UPDATE SET status = EXCLUDED.status;


INSERT INTO public.registrations (
  id, event_id, participant_id, qr_token, qr_version, status, registered_at
) VALUES (
  '00000000-0000-4000-8000-500000000228',
  '00000000-0000-4000-8000-400000000008',
  '00000000-0000-4000-8000-300000000076',
  '52c484db7ae079ed778536111f9fad00',
  1,
  'registered',
  '2026-08-27T09:00:00.000Z'
) ON CONFLICT (id) DO UPDATE SET status = EXCLUDED.status;


INSERT INTO public.registrations (
  id, event_id, participant_id, qr_token, qr_version, status, registered_at
) VALUES (
  '00000000-0000-4000-8000-500000000229',
  '00000000-0000-4000-8000-400000000009',
  '00000000-0000-4000-8000-300000000077',
  '5ef5befb6200d10ee6fc9c2b5f3e9e9d',
  1,
  'checked_in',
  '2026-08-30T09:00:00.000Z'
) ON CONFLICT (id) DO UPDATE SET status = EXCLUDED.status;


INSERT INTO public.registrations (
  id, event_id, participant_id, qr_token, qr_version, status, registered_at
) VALUES (
  '00000000-0000-4000-8000-500000000230',
  '00000000-0000-4000-8000-400000000004',
  '00000000-0000-4000-8000-300000000077',
  '4f115477ebb2677655e819727fafb3aa',
  1,
  'checked_in',
  '2026-08-15T09:00:00.000Z'
) ON CONFLICT (id) DO UPDATE SET status = EXCLUDED.status;


INSERT INTO public.registrations (
  id, event_id, participant_id, qr_token, qr_version, status, registered_at
) VALUES (
  '00000000-0000-4000-8000-500000000231',
  '00000000-0000-4000-8000-400000000010',
  '00000000-0000-4000-8000-300000000077',
  'd390e4b0a76d2cd7d356f99ad5547a6a',
  1,
  'checked_in',
  '2026-09-02T09:00:00.000Z'
) ON CONFLICT (id) DO UPDATE SET status = EXCLUDED.status;


INSERT INTO public.registrations (
  id, event_id, participant_id, qr_token, qr_version, status, registered_at
) VALUES (
  '00000000-0000-4000-8000-500000000232',
  '00000000-0000-4000-8000-400000000005',
  '00000000-0000-4000-8000-300000000078',
  'a66af4b3d38f05d20b110bdefab18df9',
  1,
  'registered',
  '2026-08-18T09:00:00.000Z'
) ON CONFLICT (id) DO UPDATE SET status = EXCLUDED.status;


INSERT INTO public.registrations (
  id, event_id, participant_id, qr_token, qr_version, status, registered_at
) VALUES (
  '00000000-0000-4000-8000-500000000233',
  '00000000-0000-4000-8000-400000000002',
  '00000000-0000-4000-8000-300000000078',
  '851efb84bc461973a27756d471f800d3',
  1,
  'checked_in',
  '2026-08-09T09:00:00.000Z'
) ON CONFLICT (id) DO UPDATE SET status = EXCLUDED.status;


INSERT INTO public.registrations (
  id, event_id, participant_id, qr_token, qr_version, status, registered_at
) VALUES (
  '00000000-0000-4000-8000-500000000234',
  '00000000-0000-4000-8000-400000000001',
  '00000000-0000-4000-8000-300000000078',
  '9967bcbf7dafbdc9bbc32c35f8459bdc',
  1,
  'checked_in',
  '2026-08-06T09:00:00.000Z'
) ON CONFLICT (id) DO UPDATE SET status = EXCLUDED.status;


INSERT INTO public.registrations (
  id, event_id, participant_id, qr_token, qr_version, status, registered_at
) VALUES (
  '00000000-0000-4000-8000-500000000235',
  '00000000-0000-4000-8000-400000000005',
  '00000000-0000-4000-8000-300000000079',
  '151ed8568184a0d7a60ef34c46d3e2ed',
  1,
  'checked_in',
  '2026-08-18T09:00:00.000Z'
) ON CONFLICT (id) DO UPDATE SET status = EXCLUDED.status;


INSERT INTO public.registrations (
  id, event_id, participant_id, qr_token, qr_version, status, registered_at
) VALUES (
  '00000000-0000-4000-8000-500000000236',
  '00000000-0000-4000-8000-400000000006',
  '00000000-0000-4000-8000-300000000079',
  '15557179f9dbd9eea41226859d6649aa',
  1,
  'registered',
  '2026-08-21T09:00:00.000Z'
) ON CONFLICT (id) DO UPDATE SET status = EXCLUDED.status;


INSERT INTO public.registrations (
  id, event_id, participant_id, qr_token, qr_version, status, registered_at
) VALUES (
  '00000000-0000-4000-8000-500000000237',
  '00000000-0000-4000-8000-400000000001',
  '00000000-0000-4000-8000-300000000079',
  '9a53dcbd6b322f7a9796867dd8c9ad52',
  1,
  'checked_in',
  '2026-08-06T09:00:00.000Z'
) ON CONFLICT (id) DO UPDATE SET status = EXCLUDED.status;


INSERT INTO public.registrations (
  id, event_id, participant_id, qr_token, qr_version, status, registered_at
) VALUES (
  '00000000-0000-4000-8000-500000000238',
  '00000000-0000-4000-8000-400000000004',
  '00000000-0000-4000-8000-300000000080',
  '98103bbb66beeee2eee0449a2740ab91',
  1,
  'registered',
  '2026-08-15T09:00:00.000Z'
) ON CONFLICT (id) DO UPDATE SET status = EXCLUDED.status;


INSERT INTO public.registrations (
  id, event_id, participant_id, qr_token, qr_version, status, registered_at
) VALUES (
  '00000000-0000-4000-8000-500000000239',
  '00000000-0000-4000-8000-400000000003',
  '00000000-0000-4000-8000-300000000080',
  '0e035d413124d61f1187c0a0e6d0f117',
  1,
  'registered',
  '2026-08-12T09:00:00.000Z'
) ON CONFLICT (id) DO UPDATE SET status = EXCLUDED.status;


INSERT INTO public.registrations (
  id, event_id, participant_id, qr_token, qr_version, status, registered_at
) VALUES (
  '00000000-0000-4000-8000-500000000240',
  '00000000-0000-4000-8000-400000000001',
  '00000000-0000-4000-8000-300000000080',
  '1227b6aad8387e14318b27d99ca7e875',
  1,
  'registered',
  '2026-08-06T09:00:00.000Z'
) ON CONFLICT (id) DO UPDATE SET status = EXCLUDED.status;


INSERT INTO public.registrations (
  id, event_id, participant_id, qr_token, qr_version, status, registered_at
) VALUES (
  '00000000-0000-4000-8000-500000000241',
  '00000000-0000-4000-8000-400000000009',
  '00000000-0000-4000-8000-300000000081',
  '1cd34919c81773ac92d0d4eac4c41bfd',
  1,
  'registered',
  '2026-08-30T09:00:00.000Z'
) ON CONFLICT (id) DO UPDATE SET status = EXCLUDED.status;


INSERT INTO public.registrations (
  id, event_id, participant_id, qr_token, qr_version, status, registered_at
) VALUES (
  '00000000-0000-4000-8000-500000000242',
  '00000000-0000-4000-8000-400000000007',
  '00000000-0000-4000-8000-300000000081',
  '825b26d92134f7bc828241034d6c714a',
  1,
  'registered',
  '2026-08-24T09:00:00.000Z'
) ON CONFLICT (id) DO UPDATE SET status = EXCLUDED.status;


INSERT INTO public.registrations (
  id, event_id, participant_id, qr_token, qr_version, status, registered_at
) VALUES (
  '00000000-0000-4000-8000-500000000243',
  '00000000-0000-4000-8000-400000000010',
  '00000000-0000-4000-8000-300000000081',
  'c43e04cde2b6b602766cca38fa147156',
  1,
  'registered',
  '2026-09-02T09:00:00.000Z'
) ON CONFLICT (id) DO UPDATE SET status = EXCLUDED.status;


INSERT INTO public.registrations (
  id, event_id, participant_id, qr_token, qr_version, status, registered_at
) VALUES (
  '00000000-0000-4000-8000-500000000244',
  '00000000-0000-4000-8000-400000000001',
  '00000000-0000-4000-8000-300000000082',
  'cef061edd6c2b30a1f1068415b70bba9',
  1,
  'registered',
  '2026-08-06T09:00:00.000Z'
) ON CONFLICT (id) DO UPDATE SET status = EXCLUDED.status;


INSERT INTO public.registrations (
  id, event_id, participant_id, qr_token, qr_version, status, registered_at
) VALUES (
  '00000000-0000-4000-8000-500000000245',
  '00000000-0000-4000-8000-400000000008',
  '00000000-0000-4000-8000-300000000082',
  'd32f5bbb1165c585a21168f9457ae049',
  1,
  'checked_in',
  '2026-08-27T09:00:00.000Z'
) ON CONFLICT (id) DO UPDATE SET status = EXCLUDED.status;


INSERT INTO public.registrations (
  id, event_id, participant_id, qr_token, qr_version, status, registered_at
) VALUES (
  '00000000-0000-4000-8000-500000000246',
  '00000000-0000-4000-8000-400000000009',
  '00000000-0000-4000-8000-300000000082',
  '2d990428fb908d1e156907d86962acd1',
  1,
  'checked_in',
  '2026-08-30T09:00:00.000Z'
) ON CONFLICT (id) DO UPDATE SET status = EXCLUDED.status;


INSERT INTO public.registrations (
  id, event_id, participant_id, qr_token, qr_version, status, registered_at
) VALUES (
  '00000000-0000-4000-8000-500000000247',
  '00000000-0000-4000-8000-400000000002',
  '00000000-0000-4000-8000-300000000083',
  '4aa0bb4d383911bcfa31eecac377390a',
  1,
  'registered',
  '2026-08-09T09:00:00.000Z'
) ON CONFLICT (id) DO UPDATE SET status = EXCLUDED.status;


INSERT INTO public.registrations (
  id, event_id, participant_id, qr_token, qr_version, status, registered_at
) VALUES (
  '00000000-0000-4000-8000-500000000248',
  '00000000-0000-4000-8000-400000000006',
  '00000000-0000-4000-8000-300000000083',
  '7c447a7ee76c0ddf2a40b67695d0af84',
  1,
  'registered',
  '2026-08-21T09:00:00.000Z'
) ON CONFLICT (id) DO UPDATE SET status = EXCLUDED.status;


INSERT INTO public.registrations (
  id, event_id, participant_id, qr_token, qr_version, status, registered_at
) VALUES (
  '00000000-0000-4000-8000-500000000249',
  '00000000-0000-4000-8000-400000000009',
  '00000000-0000-4000-8000-300000000083',
  '385815621ca57b369d06659ea6fa3ab1',
  1,
  'registered',
  '2026-08-30T09:00:00.000Z'
) ON CONFLICT (id) DO UPDATE SET status = EXCLUDED.status;


INSERT INTO public.registrations (
  id, event_id, participant_id, qr_token, qr_version, status, registered_at
) VALUES (
  '00000000-0000-4000-8000-500000000250',
  '00000000-0000-4000-8000-400000000004',
  '00000000-0000-4000-8000-300000000084',
  '2144d2bce1b19eb5f300ff16edaace30',
  1,
  'checked_in',
  '2026-08-15T09:00:00.000Z'
) ON CONFLICT (id) DO UPDATE SET status = EXCLUDED.status;


INSERT INTO public.registrations (
  id, event_id, participant_id, qr_token, qr_version, status, registered_at
) VALUES (
  '00000000-0000-4000-8000-500000000251',
  '00000000-0000-4000-8000-400000000005',
  '00000000-0000-4000-8000-300000000084',
  '58b03c44a80091065e41239129d8b856',
  1,
  'registered',
  '2026-08-18T09:00:00.000Z'
) ON CONFLICT (id) DO UPDATE SET status = EXCLUDED.status;


INSERT INTO public.registrations (
  id, event_id, participant_id, qr_token, qr_version, status, registered_at
) VALUES (
  '00000000-0000-4000-8000-500000000252',
  '00000000-0000-4000-8000-400000000008',
  '00000000-0000-4000-8000-300000000084',
  '73cac863502c928a5cc0d663ba93ceb7',
  1,
  'checked_in',
  '2026-08-27T09:00:00.000Z'
) ON CONFLICT (id) DO UPDATE SET status = EXCLUDED.status;


INSERT INTO public.registrations (
  id, event_id, participant_id, qr_token, qr_version, status, registered_at
) VALUES (
  '00000000-0000-4000-8000-500000000253',
  '00000000-0000-4000-8000-400000000002',
  '00000000-0000-4000-8000-300000000085',
  '2b7099ceb3323c85a9adf6f52976973d',
  1,
  'registered',
  '2026-08-09T09:00:00.000Z'
) ON CONFLICT (id) DO UPDATE SET status = EXCLUDED.status;


INSERT INTO public.registrations (
  id, event_id, participant_id, qr_token, qr_version, status, registered_at
) VALUES (
  '00000000-0000-4000-8000-500000000254',
  '00000000-0000-4000-8000-400000000001',
  '00000000-0000-4000-8000-300000000085',
  '1d6f4b8cf62eeddb4f8ff3841a20b4bd',
  1,
  'checked_in',
  '2026-08-06T09:00:00.000Z'
) ON CONFLICT (id) DO UPDATE SET status = EXCLUDED.status;


INSERT INTO public.registrations (
  id, event_id, participant_id, qr_token, qr_version, status, registered_at
) VALUES (
  '00000000-0000-4000-8000-500000000255',
  '00000000-0000-4000-8000-400000000007',
  '00000000-0000-4000-8000-300000000085',
  '6b21b7a6cef854f461a52750b58aafbf',
  1,
  'checked_in',
  '2026-08-24T09:00:00.000Z'
) ON CONFLICT (id) DO UPDATE SET status = EXCLUDED.status;


INSERT INTO public.registrations (
  id, event_id, participant_id, qr_token, qr_version, status, registered_at
) VALUES (
  '00000000-0000-4000-8000-500000000256',
  '00000000-0000-4000-8000-400000000007',
  '00000000-0000-4000-8000-300000000086',
  '10ccedec0578af1f5913f43d1995e449',
  1,
  'checked_in',
  '2026-08-24T09:00:00.000Z'
) ON CONFLICT (id) DO UPDATE SET status = EXCLUDED.status;


INSERT INTO public.registrations (
  id, event_id, participant_id, qr_token, qr_version, status, registered_at
) VALUES (
  '00000000-0000-4000-8000-500000000257',
  '00000000-0000-4000-8000-400000000001',
  '00000000-0000-4000-8000-300000000086',
  'b10ec74ad412f1c45e6d98fdf43bda65',
  1,
  'registered',
  '2026-08-06T09:00:00.000Z'
) ON CONFLICT (id) DO UPDATE SET status = EXCLUDED.status;


INSERT INTO public.registrations (
  id, event_id, participant_id, qr_token, qr_version, status, registered_at
) VALUES (
  '00000000-0000-4000-8000-500000000258',
  '00000000-0000-4000-8000-400000000003',
  '00000000-0000-4000-8000-300000000086',
  'd7f065102ca8e6fc80732f619db3cbff',
  1,
  'registered',
  '2026-08-12T09:00:00.000Z'
) ON CONFLICT (id) DO UPDATE SET status = EXCLUDED.status;


INSERT INTO public.registrations (
  id, event_id, participant_id, qr_token, qr_version, status, registered_at
) VALUES (
  '00000000-0000-4000-8000-500000000259',
  '00000000-0000-4000-8000-400000000004',
  '00000000-0000-4000-8000-300000000087',
  '6331a5ec7d97d10f5091a0af461cc952',
  1,
  'registered',
  '2026-08-15T09:00:00.000Z'
) ON CONFLICT (id) DO UPDATE SET status = EXCLUDED.status;


INSERT INTO public.registrations (
  id, event_id, participant_id, qr_token, qr_version, status, registered_at
) VALUES (
  '00000000-0000-4000-8000-500000000260',
  '00000000-0000-4000-8000-400000000003',
  '00000000-0000-4000-8000-300000000087',
  '528013912894a7b895cbd84f136ce744',
  1,
  'registered',
  '2026-08-12T09:00:00.000Z'
) ON CONFLICT (id) DO UPDATE SET status = EXCLUDED.status;


INSERT INTO public.registrations (
  id, event_id, participant_id, qr_token, qr_version, status, registered_at
) VALUES (
  '00000000-0000-4000-8000-500000000261',
  '00000000-0000-4000-8000-400000000005',
  '00000000-0000-4000-8000-300000000087',
  'd02e61d61f4cc15d9cc6a58a89eadbb8',
  1,
  'registered',
  '2026-08-18T09:00:00.000Z'
) ON CONFLICT (id) DO UPDATE SET status = EXCLUDED.status;


INSERT INTO public.registrations (
  id, event_id, participant_id, qr_token, qr_version, status, registered_at
) VALUES (
  '00000000-0000-4000-8000-500000000262',
  '00000000-0000-4000-8000-400000000005',
  '00000000-0000-4000-8000-300000000088',
  '2851184dd9f3c875857a286c44a1bb30',
  1,
  'registered',
  '2026-08-18T09:00:00.000Z'
) ON CONFLICT (id) DO UPDATE SET status = EXCLUDED.status;


INSERT INTO public.registrations (
  id, event_id, participant_id, qr_token, qr_version, status, registered_at
) VALUES (
  '00000000-0000-4000-8000-500000000263',
  '00000000-0000-4000-8000-400000000009',
  '00000000-0000-4000-8000-300000000088',
  '24af642f0492377456ce6a8a0604d44d',
  1,
  'checked_in',
  '2026-08-30T09:00:00.000Z'
) ON CONFLICT (id) DO UPDATE SET status = EXCLUDED.status;


INSERT INTO public.registrations (
  id, event_id, participant_id, qr_token, qr_version, status, registered_at
) VALUES (
  '00000000-0000-4000-8000-500000000264',
  '00000000-0000-4000-8000-400000000010',
  '00000000-0000-4000-8000-300000000088',
  'ab10271d46737b0319b9937d2ccedc1e',
  1,
  'checked_in',
  '2026-09-02T09:00:00.000Z'
) ON CONFLICT (id) DO UPDATE SET status = EXCLUDED.status;


INSERT INTO public.registrations (
  id, event_id, participant_id, qr_token, qr_version, status, registered_at
) VALUES (
  '00000000-0000-4000-8000-500000000265',
  '00000000-0000-4000-8000-400000000004',
  '00000000-0000-4000-8000-300000000089',
  '9fafa47d28068f35d1ab0960ac5b5fe4',
  1,
  'registered',
  '2026-08-15T09:00:00.000Z'
) ON CONFLICT (id) DO UPDATE SET status = EXCLUDED.status;


INSERT INTO public.registrations (
  id, event_id, participant_id, qr_token, qr_version, status, registered_at
) VALUES (
  '00000000-0000-4000-8000-500000000266',
  '00000000-0000-4000-8000-400000000006',
  '00000000-0000-4000-8000-300000000089',
  'bbad522516759f97066b6d0778db6214',
  1,
  'checked_in',
  '2026-08-21T09:00:00.000Z'
) ON CONFLICT (id) DO UPDATE SET status = EXCLUDED.status;


INSERT INTO public.registrations (
  id, event_id, participant_id, qr_token, qr_version, status, registered_at
) VALUES (
  '00000000-0000-4000-8000-500000000267',
  '00000000-0000-4000-8000-400000000003',
  '00000000-0000-4000-8000-300000000089',
  '78771a26d462ee1daa195fe8f6729fe3',
  1,
  'checked_in',
  '2026-08-12T09:00:00.000Z'
) ON CONFLICT (id) DO UPDATE SET status = EXCLUDED.status;


INSERT INTO public.registrations (
  id, event_id, participant_id, qr_token, qr_version, status, registered_at
) VALUES (
  '00000000-0000-4000-8000-500000000268',
  '00000000-0000-4000-8000-400000000008',
  '00000000-0000-4000-8000-300000000090',
  '263f0f54d7a6d973e558f5a40540c8f9',
  1,
  'checked_in',
  '2026-08-27T09:00:00.000Z'
) ON CONFLICT (id) DO UPDATE SET status = EXCLUDED.status;


INSERT INTO public.registrations (
  id, event_id, participant_id, qr_token, qr_version, status, registered_at
) VALUES (
  '00000000-0000-4000-8000-500000000269',
  '00000000-0000-4000-8000-400000000010',
  '00000000-0000-4000-8000-300000000090',
  '3003177a02575eb39bc6199053437acb',
  1,
  'checked_in',
  '2026-09-02T09:00:00.000Z'
) ON CONFLICT (id) DO UPDATE SET status = EXCLUDED.status;


INSERT INTO public.registrations (
  id, event_id, participant_id, qr_token, qr_version, status, registered_at
) VALUES (
  '00000000-0000-4000-8000-500000000270',
  '00000000-0000-4000-8000-400000000003',
  '00000000-0000-4000-8000-300000000090',
  '2dcc9a1afb63ce16980ea1494437838b',
  1,
  'checked_in',
  '2026-08-12T09:00:00.000Z'
) ON CONFLICT (id) DO UPDATE SET status = EXCLUDED.status;


INSERT INTO public.registrations (
  id, event_id, participant_id, qr_token, qr_version, status, registered_at
) VALUES (
  '00000000-0000-4000-8000-500000000271',
  '00000000-0000-4000-8000-400000000003',
  '00000000-0000-4000-8000-300000000091',
  '16be62c4366e80bf2bd96976ae8f1b66',
  1,
  'checked_in',
  '2026-08-12T09:00:00.000Z'
) ON CONFLICT (id) DO UPDATE SET status = EXCLUDED.status;


INSERT INTO public.registrations (
  id, event_id, participant_id, qr_token, qr_version, status, registered_at
) VALUES (
  '00000000-0000-4000-8000-500000000272',
  '00000000-0000-4000-8000-400000000001',
  '00000000-0000-4000-8000-300000000091',
  '5256084d3b7416138342f8090a7cd726',
  1,
  'registered',
  '2026-08-06T09:00:00.000Z'
) ON CONFLICT (id) DO UPDATE SET status = EXCLUDED.status;


INSERT INTO public.registrations (
  id, event_id, participant_id, qr_token, qr_version, status, registered_at
) VALUES (
  '00000000-0000-4000-8000-500000000273',
  '00000000-0000-4000-8000-400000000005',
  '00000000-0000-4000-8000-300000000091',
  '09adc8e75cc47c498180423455f62cf3',
  1,
  'checked_in',
  '2026-08-18T09:00:00.000Z'
) ON CONFLICT (id) DO UPDATE SET status = EXCLUDED.status;


INSERT INTO public.registrations (
  id, event_id, participant_id, qr_token, qr_version, status, registered_at
) VALUES (
  '00000000-0000-4000-8000-500000000274',
  '00000000-0000-4000-8000-400000000008',
  '00000000-0000-4000-8000-300000000092',
  '836378e3db16dd5bfffddb6f27a9e7f7',
  1,
  'registered',
  '2026-08-27T09:00:00.000Z'
) ON CONFLICT (id) DO UPDATE SET status = EXCLUDED.status;


INSERT INTO public.registrations (
  id, event_id, participant_id, qr_token, qr_version, status, registered_at
) VALUES (
  '00000000-0000-4000-8000-500000000275',
  '00000000-0000-4000-8000-400000000009',
  '00000000-0000-4000-8000-300000000092',
  '5feca84297b33d14bd2e6cb76b8aed64',
  1,
  'registered',
  '2026-08-30T09:00:00.000Z'
) ON CONFLICT (id) DO UPDATE SET status = EXCLUDED.status;


INSERT INTO public.registrations (
  id, event_id, participant_id, qr_token, qr_version, status, registered_at
) VALUES (
  '00000000-0000-4000-8000-500000000276',
  '00000000-0000-4000-8000-400000000010',
  '00000000-0000-4000-8000-300000000092',
  'bf646e687594b89e04cbc28019ac1ecc',
  1,
  'checked_in',
  '2026-09-02T09:00:00.000Z'
) ON CONFLICT (id) DO UPDATE SET status = EXCLUDED.status;


INSERT INTO public.registrations (
  id, event_id, participant_id, qr_token, qr_version, status, registered_at
) VALUES (
  '00000000-0000-4000-8000-500000000277',
  '00000000-0000-4000-8000-400000000010',
  '00000000-0000-4000-8000-300000000093',
  '53c6d70e3dc95e7cee4059b72a4a8d5d',
  1,
  'registered',
  '2026-09-02T09:00:00.000Z'
) ON CONFLICT (id) DO UPDATE SET status = EXCLUDED.status;


INSERT INTO public.registrations (
  id, event_id, participant_id, qr_token, qr_version, status, registered_at
) VALUES (
  '00000000-0000-4000-8000-500000000278',
  '00000000-0000-4000-8000-400000000005',
  '00000000-0000-4000-8000-300000000093',
  'a858101037298354f9f930993431ee55',
  1,
  'registered',
  '2026-08-18T09:00:00.000Z'
) ON CONFLICT (id) DO UPDATE SET status = EXCLUDED.status;


INSERT INTO public.registrations (
  id, event_id, participant_id, qr_token, qr_version, status, registered_at
) VALUES (
  '00000000-0000-4000-8000-500000000279',
  '00000000-0000-4000-8000-400000000002',
  '00000000-0000-4000-8000-300000000093',
  'a1770d25cc42471aea622625f9732097',
  1,
  'registered',
  '2026-08-09T09:00:00.000Z'
) ON CONFLICT (id) DO UPDATE SET status = EXCLUDED.status;


INSERT INTO public.registrations (
  id, event_id, participant_id, qr_token, qr_version, status, registered_at
) VALUES (
  '00000000-0000-4000-8000-500000000280',
  '00000000-0000-4000-8000-400000000009',
  '00000000-0000-4000-8000-300000000094',
  'ad41cdf0af502449c847fd34fa472e31',
  1,
  'checked_in',
  '2026-08-30T09:00:00.000Z'
) ON CONFLICT (id) DO UPDATE SET status = EXCLUDED.status;


INSERT INTO public.registrations (
  id, event_id, participant_id, qr_token, qr_version, status, registered_at
) VALUES (
  '00000000-0000-4000-8000-500000000281',
  '00000000-0000-4000-8000-400000000010',
  '00000000-0000-4000-8000-300000000094',
  '49081c0cac0f7bdd75867921c398ec9c',
  1,
  'registered',
  '2026-09-02T09:00:00.000Z'
) ON CONFLICT (id) DO UPDATE SET status = EXCLUDED.status;


INSERT INTO public.registrations (
  id, event_id, participant_id, qr_token, qr_version, status, registered_at
) VALUES (
  '00000000-0000-4000-8000-500000000282',
  '00000000-0000-4000-8000-400000000006',
  '00000000-0000-4000-8000-300000000094',
  '04fcf066bbd188585be470fd8db92c00',
  1,
  'registered',
  '2026-08-21T09:00:00.000Z'
) ON CONFLICT (id) DO UPDATE SET status = EXCLUDED.status;


INSERT INTO public.registrations (
  id, event_id, participant_id, qr_token, qr_version, status, registered_at
) VALUES (
  '00000000-0000-4000-8000-500000000283',
  '00000000-0000-4000-8000-400000000004',
  '00000000-0000-4000-8000-300000000095',
  'f865143c57d52dab9a4ae50848f36a18',
  1,
  'checked_in',
  '2026-08-15T09:00:00.000Z'
) ON CONFLICT (id) DO UPDATE SET status = EXCLUDED.status;


INSERT INTO public.registrations (
  id, event_id, participant_id, qr_token, qr_version, status, registered_at
) VALUES (
  '00000000-0000-4000-8000-500000000284',
  '00000000-0000-4000-8000-400000000005',
  '00000000-0000-4000-8000-300000000095',
  '402306df56a7e030deeee4f770636e3a',
  1,
  'checked_in',
  '2026-08-18T09:00:00.000Z'
) ON CONFLICT (id) DO UPDATE SET status = EXCLUDED.status;


INSERT INTO public.registrations (
  id, event_id, participant_id, qr_token, qr_version, status, registered_at
) VALUES (
  '00000000-0000-4000-8000-500000000285',
  '00000000-0000-4000-8000-400000000009',
  '00000000-0000-4000-8000-300000000095',
  'e137529d43174e86ce318abafd923bbf',
  1,
  'registered',
  '2026-08-30T09:00:00.000Z'
) ON CONFLICT (id) DO UPDATE SET status = EXCLUDED.status;


INSERT INTO public.registrations (
  id, event_id, participant_id, qr_token, qr_version, status, registered_at
) VALUES (
  '00000000-0000-4000-8000-500000000286',
  '00000000-0000-4000-8000-400000000008',
  '00000000-0000-4000-8000-300000000096',
  '0afde72ae0986dba6f8d5fedabf20710',
  1,
  'registered',
  '2026-08-27T09:00:00.000Z'
) ON CONFLICT (id) DO UPDATE SET status = EXCLUDED.status;


INSERT INTO public.registrations (
  id, event_id, participant_id, qr_token, qr_version, status, registered_at
) VALUES (
  '00000000-0000-4000-8000-500000000287',
  '00000000-0000-4000-8000-400000000002',
  '00000000-0000-4000-8000-300000000096',
  'd4a5347d829ca3a12fdc70c62d6764a3',
  1,
  'checked_in',
  '2026-08-09T09:00:00.000Z'
) ON CONFLICT (id) DO UPDATE SET status = EXCLUDED.status;


INSERT INTO public.registrations (
  id, event_id, participant_id, qr_token, qr_version, status, registered_at
) VALUES (
  '00000000-0000-4000-8000-500000000288',
  '00000000-0000-4000-8000-400000000010',
  '00000000-0000-4000-8000-300000000096',
  'de082bc7f58de2741c6035a5290cbd01',
  1,
  'checked_in',
  '2026-09-02T09:00:00.000Z'
) ON CONFLICT (id) DO UPDATE SET status = EXCLUDED.status;


INSERT INTO public.registrations (
  id, event_id, participant_id, qr_token, qr_version, status, registered_at
) VALUES (
  '00000000-0000-4000-8000-500000000289',
  '00000000-0000-4000-8000-400000000003',
  '00000000-0000-4000-8000-300000000097',
  '6a5421f321dc3a39a7f5d43284f2d156',
  1,
  'registered',
  '2026-08-12T09:00:00.000Z'
) ON CONFLICT (id) DO UPDATE SET status = EXCLUDED.status;


INSERT INTO public.registrations (
  id, event_id, participant_id, qr_token, qr_version, status, registered_at
) VALUES (
  '00000000-0000-4000-8000-500000000290',
  '00000000-0000-4000-8000-400000000009',
  '00000000-0000-4000-8000-300000000097',
  '50b870a5329b48cb22511815e001aea1',
  1,
  'registered',
  '2026-08-30T09:00:00.000Z'
) ON CONFLICT (id) DO UPDATE SET status = EXCLUDED.status;


INSERT INTO public.registrations (
  id, event_id, participant_id, qr_token, qr_version, status, registered_at
) VALUES (
  '00000000-0000-4000-8000-500000000291',
  '00000000-0000-4000-8000-400000000005',
  '00000000-0000-4000-8000-300000000097',
  '8e4a77ddd2e81b211cf8c8b4837e4c53',
  1,
  'registered',
  '2026-08-18T09:00:00.000Z'
) ON CONFLICT (id) DO UPDATE SET status = EXCLUDED.status;


INSERT INTO public.registrations (
  id, event_id, participant_id, qr_token, qr_version, status, registered_at
) VALUES (
  '00000000-0000-4000-8000-500000000292',
  '00000000-0000-4000-8000-400000000004',
  '00000000-0000-4000-8000-300000000098',
  '394517756534a802448debf559a68287',
  1,
  'registered',
  '2026-08-15T09:00:00.000Z'
) ON CONFLICT (id) DO UPDATE SET status = EXCLUDED.status;


INSERT INTO public.registrations (
  id, event_id, participant_id, qr_token, qr_version, status, registered_at
) VALUES (
  '00000000-0000-4000-8000-500000000293',
  '00000000-0000-4000-8000-400000000010',
  '00000000-0000-4000-8000-300000000098',
  '46ad81489fe98c95c4dbdc2ccc9048a6',
  1,
  'checked_in',
  '2026-09-02T09:00:00.000Z'
) ON CONFLICT (id) DO UPDATE SET status = EXCLUDED.status;


INSERT INTO public.registrations (
  id, event_id, participant_id, qr_token, qr_version, status, registered_at
) VALUES (
  '00000000-0000-4000-8000-500000000294',
  '00000000-0000-4000-8000-400000000009',
  '00000000-0000-4000-8000-300000000098',
  '4936597362a8692c23d3779fa5189d38',
  1,
  'checked_in',
  '2026-08-30T09:00:00.000Z'
) ON CONFLICT (id) DO UPDATE SET status = EXCLUDED.status;


INSERT INTO public.registrations (
  id, event_id, participant_id, qr_token, qr_version, status, registered_at
) VALUES (
  '00000000-0000-4000-8000-500000000295',
  '00000000-0000-4000-8000-400000000009',
  '00000000-0000-4000-8000-300000000099',
  '6f0e2912776b25a0fe104f1e77995f9a',
  1,
  'checked_in',
  '2026-08-30T09:00:00.000Z'
) ON CONFLICT (id) DO UPDATE SET status = EXCLUDED.status;


INSERT INTO public.registrations (
  id, event_id, participant_id, qr_token, qr_version, status, registered_at
) VALUES (
  '00000000-0000-4000-8000-500000000296',
  '00000000-0000-4000-8000-400000000006',
  '00000000-0000-4000-8000-300000000099',
  'c9ab5bc8ea936c223292ec5ffc408b1a',
  1,
  'checked_in',
  '2026-08-21T09:00:00.000Z'
) ON CONFLICT (id) DO UPDATE SET status = EXCLUDED.status;


INSERT INTO public.registrations (
  id, event_id, participant_id, qr_token, qr_version, status, registered_at
) VALUES (
  '00000000-0000-4000-8000-500000000297',
  '00000000-0000-4000-8000-400000000007',
  '00000000-0000-4000-8000-300000000099',
  '7584a58329c304ed34c9eda445db6938',
  1,
  'registered',
  '2026-08-24T09:00:00.000Z'
) ON CONFLICT (id) DO UPDATE SET status = EXCLUDED.status;


INSERT INTO public.registrations (
  id, event_id, participant_id, qr_token, qr_version, status, registered_at
) VALUES (
  '00000000-0000-4000-8000-500000000298',
  '00000000-0000-4000-8000-400000000005',
  '00000000-0000-4000-8000-300000000100',
  '764bc561486dc5ca07f64ae156ac40e9',
  1,
  'registered',
  '2026-08-18T09:00:00.000Z'
) ON CONFLICT (id) DO UPDATE SET status = EXCLUDED.status;


INSERT INTO public.registrations (
  id, event_id, participant_id, qr_token, qr_version, status, registered_at
) VALUES (
  '00000000-0000-4000-8000-500000000299',
  '00000000-0000-4000-8000-400000000006',
  '00000000-0000-4000-8000-300000000100',
  '6fd173690db3f7b40eeba0f8c77eda33',
  1,
  'registered',
  '2026-08-21T09:00:00.000Z'
) ON CONFLICT (id) DO UPDATE SET status = EXCLUDED.status;


INSERT INTO public.registrations (
  id, event_id, participant_id, qr_token, qr_version, status, registered_at
) VALUES (
  '00000000-0000-4000-8000-500000000300',
  '00000000-0000-4000-8000-400000000003',
  '00000000-0000-4000-8000-300000000100',
  '579e01bb50908e17f1dcd24771f7fcae',
  1,
  'registered',
  '2026-08-12T09:00:00.000Z'
) ON CONFLICT (id) DO UPDATE SET status = EXCLUDED.status;


INSERT INTO public.attendance (
  id, registration_id, event_id, participant_id, checked_in_by, checked_in_at, method
) VALUES (
  '00000000-0000-4000-8000-600000000001',
  '00000000-0000-4000-8000-500000000001',
  '00000000-0000-4000-8000-400000000006',
  '00000000-0000-4000-8000-300000000001',
  '00000000-0000-4000-8000-200000000001',
  '2026-08-21T09:00:00.000Z',
  'qr_scan'
) ON CONFLICT (registration_id) DO NOTHING;


INSERT INTO public.attendance (
  id, registration_id, event_id, participant_id, checked_in_by, checked_in_at, method
) VALUES (
  '00000000-0000-4000-8000-600000000006',
  '00000000-0000-4000-8000-500000000006',
  '00000000-0000-4000-8000-400000000009',
  '00000000-0000-4000-8000-300000000002',
  '00000000-0000-4000-8000-200000000001',
  '2026-08-30T09:00:00.000Z',
  'qr_scan'
) ON CONFLICT (registration_id) DO NOTHING;


INSERT INTO public.attendance (
  id, registration_id, event_id, participant_id, checked_in_by, checked_in_at, method
) VALUES (
  '00000000-0000-4000-8000-600000000008',
  '00000000-0000-4000-8000-500000000008',
  '00000000-0000-4000-8000-400000000002',
  '00000000-0000-4000-8000-300000000003',
  '00000000-0000-4000-8000-200000000001',
  '2026-08-09T09:00:00.000Z',
  'qr_scan'
) ON CONFLICT (registration_id) DO NOTHING;


INSERT INTO public.attendance (
  id, registration_id, event_id, participant_id, checked_in_by, checked_in_at, method
) VALUES (
  '00000000-0000-4000-8000-600000000009',
  '00000000-0000-4000-8000-500000000009',
  '00000000-0000-4000-8000-400000000005',
  '00000000-0000-4000-8000-300000000003',
  '00000000-0000-4000-8000-200000000001',
  '2026-08-18T09:00:00.000Z',
  'qr_scan'
) ON CONFLICT (registration_id) DO NOTHING;


INSERT INTO public.attendance (
  id, registration_id, event_id, participant_id, checked_in_by, checked_in_at, method
) VALUES (
  '00000000-0000-4000-8000-600000000010',
  '00000000-0000-4000-8000-500000000010',
  '00000000-0000-4000-8000-400000000002',
  '00000000-0000-4000-8000-300000000004',
  '00000000-0000-4000-8000-200000000001',
  '2026-08-09T09:00:00.000Z',
  'qr_scan'
) ON CONFLICT (registration_id) DO NOTHING;


INSERT INTO public.attendance (
  id, registration_id, event_id, participant_id, checked_in_by, checked_in_at, method
) VALUES (
  '00000000-0000-4000-8000-600000000011',
  '00000000-0000-4000-8000-500000000011',
  '00000000-0000-4000-8000-400000000004',
  '00000000-0000-4000-8000-300000000004',
  '00000000-0000-4000-8000-200000000001',
  '2026-08-15T09:00:00.000Z',
  'qr_scan'
) ON CONFLICT (registration_id) DO NOTHING;


INSERT INTO public.attendance (
  id, registration_id, event_id, participant_id, checked_in_by, checked_in_at, method
) VALUES (
  '00000000-0000-4000-8000-600000000013',
  '00000000-0000-4000-8000-500000000013',
  '00000000-0000-4000-8000-400000000002',
  '00000000-0000-4000-8000-300000000005',
  '00000000-0000-4000-8000-200000000001',
  '2026-08-09T09:00:00.000Z',
  'qr_scan'
) ON CONFLICT (registration_id) DO NOTHING;


INSERT INTO public.attendance (
  id, registration_id, event_id, participant_id, checked_in_by, checked_in_at, method
) VALUES (
  '00000000-0000-4000-8000-600000000014',
  '00000000-0000-4000-8000-500000000014',
  '00000000-0000-4000-8000-400000000006',
  '00000000-0000-4000-8000-300000000005',
  '00000000-0000-4000-8000-200000000001',
  '2026-08-21T09:00:00.000Z',
  'qr_scan'
) ON CONFLICT (registration_id) DO NOTHING;


INSERT INTO public.attendance (
  id, registration_id, event_id, participant_id, checked_in_by, checked_in_at, method
) VALUES (
  '00000000-0000-4000-8000-600000000015',
  '00000000-0000-4000-8000-500000000015',
  '00000000-0000-4000-8000-400000000005',
  '00000000-0000-4000-8000-300000000005',
  '00000000-0000-4000-8000-200000000001',
  '2026-08-18T09:00:00.000Z',
  'qr_scan'
) ON CONFLICT (registration_id) DO NOTHING;


INSERT INTO public.attendance (
  id, registration_id, event_id, participant_id, checked_in_by, checked_in_at, method
) VALUES (
  '00000000-0000-4000-8000-600000000017',
  '00000000-0000-4000-8000-500000000017',
  '00000000-0000-4000-8000-400000000004',
  '00000000-0000-4000-8000-300000000006',
  '00000000-0000-4000-8000-200000000001',
  '2026-08-15T09:00:00.000Z',
  'qr_scan'
) ON CONFLICT (registration_id) DO NOTHING;


INSERT INTO public.attendance (
  id, registration_id, event_id, participant_id, checked_in_by, checked_in_at, method
) VALUES (
  '00000000-0000-4000-8000-600000000024',
  '00000000-0000-4000-8000-500000000024',
  '00000000-0000-4000-8000-400000000010',
  '00000000-0000-4000-8000-300000000008',
  '00000000-0000-4000-8000-200000000001',
  '2026-09-02T09:00:00.000Z',
  'qr_scan'
) ON CONFLICT (registration_id) DO NOTHING;


INSERT INTO public.attendance (
  id, registration_id, event_id, participant_id, checked_in_by, checked_in_at, method
) VALUES (
  '00000000-0000-4000-8000-600000000025',
  '00000000-0000-4000-8000-500000000025',
  '00000000-0000-4000-8000-400000000007',
  '00000000-0000-4000-8000-300000000009',
  '00000000-0000-4000-8000-200000000001',
  '2026-08-24T09:00:00.000Z',
  'qr_scan'
) ON CONFLICT (registration_id) DO NOTHING;


INSERT INTO public.attendance (
  id, registration_id, event_id, participant_id, checked_in_by, checked_in_at, method
) VALUES (
  '00000000-0000-4000-8000-600000000026',
  '00000000-0000-4000-8000-500000000026',
  '00000000-0000-4000-8000-400000000006',
  '00000000-0000-4000-8000-300000000009',
  '00000000-0000-4000-8000-200000000001',
  '2026-08-21T09:00:00.000Z',
  'qr_scan'
) ON CONFLICT (registration_id) DO NOTHING;


INSERT INTO public.attendance (
  id, registration_id, event_id, participant_id, checked_in_by, checked_in_at, method
) VALUES (
  '00000000-0000-4000-8000-600000000027',
  '00000000-0000-4000-8000-500000000027',
  '00000000-0000-4000-8000-400000000004',
  '00000000-0000-4000-8000-300000000009',
  '00000000-0000-4000-8000-200000000001',
  '2026-08-15T09:00:00.000Z',
  'qr_scan'
) ON CONFLICT (registration_id) DO NOTHING;


INSERT INTO public.attendance (
  id, registration_id, event_id, participant_id, checked_in_by, checked_in_at, method
) VALUES (
  '00000000-0000-4000-8000-600000000028',
  '00000000-0000-4000-8000-500000000028',
  '00000000-0000-4000-8000-400000000009',
  '00000000-0000-4000-8000-300000000010',
  '00000000-0000-4000-8000-200000000001',
  '2026-08-30T09:00:00.000Z',
  'qr_scan'
) ON CONFLICT (registration_id) DO NOTHING;


INSERT INTO public.attendance (
  id, registration_id, event_id, participant_id, checked_in_by, checked_in_at, method
) VALUES (
  '00000000-0000-4000-8000-600000000029',
  '00000000-0000-4000-8000-500000000029',
  '00000000-0000-4000-8000-400000000002',
  '00000000-0000-4000-8000-300000000010',
  '00000000-0000-4000-8000-200000000001',
  '2026-08-09T09:00:00.000Z',
  'qr_scan'
) ON CONFLICT (registration_id) DO NOTHING;


INSERT INTO public.attendance (
  id, registration_id, event_id, participant_id, checked_in_by, checked_in_at, method
) VALUES (
  '00000000-0000-4000-8000-600000000034',
  '00000000-0000-4000-8000-500000000034',
  '00000000-0000-4000-8000-400000000009',
  '00000000-0000-4000-8000-300000000012',
  '00000000-0000-4000-8000-200000000001',
  '2026-08-30T09:00:00.000Z',
  'qr_scan'
) ON CONFLICT (registration_id) DO NOTHING;


INSERT INTO public.attendance (
  id, registration_id, event_id, participant_id, checked_in_by, checked_in_at, method
) VALUES (
  '00000000-0000-4000-8000-600000000038',
  '00000000-0000-4000-8000-500000000038',
  '00000000-0000-4000-8000-400000000003',
  '00000000-0000-4000-8000-300000000013',
  '00000000-0000-4000-8000-200000000001',
  '2026-08-12T09:00:00.000Z',
  'qr_scan'
) ON CONFLICT (registration_id) DO NOTHING;


INSERT INTO public.attendance (
  id, registration_id, event_id, participant_id, checked_in_by, checked_in_at, method
) VALUES (
  '00000000-0000-4000-8000-600000000041',
  '00000000-0000-4000-8000-500000000041',
  '00000000-0000-4000-8000-400000000003',
  '00000000-0000-4000-8000-300000000014',
  '00000000-0000-4000-8000-200000000001',
  '2026-08-12T09:00:00.000Z',
  'qr_scan'
) ON CONFLICT (registration_id) DO NOTHING;


INSERT INTO public.attendance (
  id, registration_id, event_id, participant_id, checked_in_by, checked_in_at, method
) VALUES (
  '00000000-0000-4000-8000-600000000043',
  '00000000-0000-4000-8000-500000000043',
  '00000000-0000-4000-8000-400000000006',
  '00000000-0000-4000-8000-300000000015',
  '00000000-0000-4000-8000-200000000001',
  '2026-08-21T09:00:00.000Z',
  'qr_scan'
) ON CONFLICT (registration_id) DO NOTHING;


INSERT INTO public.attendance (
  id, registration_id, event_id, participant_id, checked_in_by, checked_in_at, method
) VALUES (
  '00000000-0000-4000-8000-600000000046',
  '00000000-0000-4000-8000-500000000046',
  '00000000-0000-4000-8000-400000000003',
  '00000000-0000-4000-8000-300000000016',
  '00000000-0000-4000-8000-200000000001',
  '2026-08-12T09:00:00.000Z',
  'qr_scan'
) ON CONFLICT (registration_id) DO NOTHING;


INSERT INTO public.attendance (
  id, registration_id, event_id, participant_id, checked_in_by, checked_in_at, method
) VALUES (
  '00000000-0000-4000-8000-600000000051',
  '00000000-0000-4000-8000-500000000051',
  '00000000-0000-4000-8000-400000000010',
  '00000000-0000-4000-8000-300000000017',
  '00000000-0000-4000-8000-200000000001',
  '2026-09-02T09:00:00.000Z',
  'qr_scan'
) ON CONFLICT (registration_id) DO NOTHING;


INSERT INTO public.attendance (
  id, registration_id, event_id, participant_id, checked_in_by, checked_in_at, method
) VALUES (
  '00000000-0000-4000-8000-600000000053',
  '00000000-0000-4000-8000-500000000053',
  '00000000-0000-4000-8000-400000000006',
  '00000000-0000-4000-8000-300000000018',
  '00000000-0000-4000-8000-200000000001',
  '2026-08-21T09:00:00.000Z',
  'qr_scan'
) ON CONFLICT (registration_id) DO NOTHING;


INSERT INTO public.attendance (
  id, registration_id, event_id, participant_id, checked_in_by, checked_in_at, method
) VALUES (
  '00000000-0000-4000-8000-600000000055',
  '00000000-0000-4000-8000-500000000055',
  '00000000-0000-4000-8000-400000000004',
  '00000000-0000-4000-8000-300000000019',
  '00000000-0000-4000-8000-200000000001',
  '2026-08-15T09:00:00.000Z',
  'qr_scan'
) ON CONFLICT (registration_id) DO NOTHING;


INSERT INTO public.attendance (
  id, registration_id, event_id, participant_id, checked_in_by, checked_in_at, method
) VALUES (
  '00000000-0000-4000-8000-600000000056',
  '00000000-0000-4000-8000-500000000056',
  '00000000-0000-4000-8000-400000000010',
  '00000000-0000-4000-8000-300000000019',
  '00000000-0000-4000-8000-200000000001',
  '2026-09-02T09:00:00.000Z',
  'qr_scan'
) ON CONFLICT (registration_id) DO NOTHING;


INSERT INTO public.attendance (
  id, registration_id, event_id, participant_id, checked_in_by, checked_in_at, method
) VALUES (
  '00000000-0000-4000-8000-600000000059',
  '00000000-0000-4000-8000-500000000059',
  '00000000-0000-4000-8000-400000000005',
  '00000000-0000-4000-8000-300000000020',
  '00000000-0000-4000-8000-200000000001',
  '2026-08-18T09:00:00.000Z',
  'qr_scan'
) ON CONFLICT (registration_id) DO NOTHING;


INSERT INTO public.attendance (
  id, registration_id, event_id, participant_id, checked_in_by, checked_in_at, method
) VALUES (
  '00000000-0000-4000-8000-600000000061',
  '00000000-0000-4000-8000-500000000061',
  '00000000-0000-4000-8000-400000000008',
  '00000000-0000-4000-8000-300000000021',
  '00000000-0000-4000-8000-200000000001',
  '2026-08-27T09:00:00.000Z',
  'qr_scan'
) ON CONFLICT (registration_id) DO NOTHING;


INSERT INTO public.attendance (
  id, registration_id, event_id, participant_id, checked_in_by, checked_in_at, method
) VALUES (
  '00000000-0000-4000-8000-600000000063',
  '00000000-0000-4000-8000-500000000063',
  '00000000-0000-4000-8000-400000000010',
  '00000000-0000-4000-8000-300000000021',
  '00000000-0000-4000-8000-200000000001',
  '2026-09-02T09:00:00.000Z',
  'qr_scan'
) ON CONFLICT (registration_id) DO NOTHING;


INSERT INTO public.attendance (
  id, registration_id, event_id, participant_id, checked_in_by, checked_in_at, method
) VALUES (
  '00000000-0000-4000-8000-600000000064',
  '00000000-0000-4000-8000-500000000064',
  '00000000-0000-4000-8000-400000000006',
  '00000000-0000-4000-8000-300000000022',
  '00000000-0000-4000-8000-200000000001',
  '2026-08-21T09:00:00.000Z',
  'qr_scan'
) ON CONFLICT (registration_id) DO NOTHING;


INSERT INTO public.attendance (
  id, registration_id, event_id, participant_id, checked_in_by, checked_in_at, method
) VALUES (
  '00000000-0000-4000-8000-600000000065',
  '00000000-0000-4000-8000-500000000065',
  '00000000-0000-4000-8000-400000000003',
  '00000000-0000-4000-8000-300000000022',
  '00000000-0000-4000-8000-200000000001',
  '2026-08-12T09:00:00.000Z',
  'qr_scan'
) ON CONFLICT (registration_id) DO NOTHING;


INSERT INTO public.attendance (
  id, registration_id, event_id, participant_id, checked_in_by, checked_in_at, method
) VALUES (
  '00000000-0000-4000-8000-600000000066',
  '00000000-0000-4000-8000-500000000066',
  '00000000-0000-4000-8000-400000000007',
  '00000000-0000-4000-8000-300000000022',
  '00000000-0000-4000-8000-200000000001',
  '2026-08-24T09:00:00.000Z',
  'qr_scan'
) ON CONFLICT (registration_id) DO NOTHING;


INSERT INTO public.attendance (
  id, registration_id, event_id, participant_id, checked_in_by, checked_in_at, method
) VALUES (
  '00000000-0000-4000-8000-600000000067',
  '00000000-0000-4000-8000-500000000067',
  '00000000-0000-4000-8000-400000000005',
  '00000000-0000-4000-8000-300000000023',
  '00000000-0000-4000-8000-200000000001',
  '2026-08-18T09:00:00.000Z',
  'qr_scan'
) ON CONFLICT (registration_id) DO NOTHING;


INSERT INTO public.attendance (
  id, registration_id, event_id, participant_id, checked_in_by, checked_in_at, method
) VALUES (
  '00000000-0000-4000-8000-600000000068',
  '00000000-0000-4000-8000-500000000068',
  '00000000-0000-4000-8000-400000000002',
  '00000000-0000-4000-8000-300000000023',
  '00000000-0000-4000-8000-200000000001',
  '2026-08-09T09:00:00.000Z',
  'qr_scan'
) ON CONFLICT (registration_id) DO NOTHING;


INSERT INTO public.attendance (
  id, registration_id, event_id, participant_id, checked_in_by, checked_in_at, method
) VALUES (
  '00000000-0000-4000-8000-600000000071',
  '00000000-0000-4000-8000-500000000071',
  '00000000-0000-4000-8000-400000000010',
  '00000000-0000-4000-8000-300000000024',
  '00000000-0000-4000-8000-200000000001',
  '2026-09-02T09:00:00.000Z',
  'qr_scan'
) ON CONFLICT (registration_id) DO NOTHING;


INSERT INTO public.attendance (
  id, registration_id, event_id, participant_id, checked_in_by, checked_in_at, method
) VALUES (
  '00000000-0000-4000-8000-600000000073',
  '00000000-0000-4000-8000-500000000073',
  '00000000-0000-4000-8000-400000000001',
  '00000000-0000-4000-8000-300000000025',
  '00000000-0000-4000-8000-200000000001',
  '2026-08-06T09:00:00.000Z',
  'qr_scan'
) ON CONFLICT (registration_id) DO NOTHING;


INSERT INTO public.attendance (
  id, registration_id, event_id, participant_id, checked_in_by, checked_in_at, method
) VALUES (
  '00000000-0000-4000-8000-600000000074',
  '00000000-0000-4000-8000-500000000074',
  '00000000-0000-4000-8000-400000000003',
  '00000000-0000-4000-8000-300000000025',
  '00000000-0000-4000-8000-200000000001',
  '2026-08-12T09:00:00.000Z',
  'qr_scan'
) ON CONFLICT (registration_id) DO NOTHING;


INSERT INTO public.attendance (
  id, registration_id, event_id, participant_id, checked_in_by, checked_in_at, method
) VALUES (
  '00000000-0000-4000-8000-600000000075',
  '00000000-0000-4000-8000-500000000075',
  '00000000-0000-4000-8000-400000000010',
  '00000000-0000-4000-8000-300000000025',
  '00000000-0000-4000-8000-200000000001',
  '2026-09-02T09:00:00.000Z',
  'qr_scan'
) ON CONFLICT (registration_id) DO NOTHING;


INSERT INTO public.attendance (
  id, registration_id, event_id, participant_id, checked_in_by, checked_in_at, method
) VALUES (
  '00000000-0000-4000-8000-600000000076',
  '00000000-0000-4000-8000-500000000076',
  '00000000-0000-4000-8000-400000000008',
  '00000000-0000-4000-8000-300000000026',
  '00000000-0000-4000-8000-200000000001',
  '2026-08-27T09:00:00.000Z',
  'qr_scan'
) ON CONFLICT (registration_id) DO NOTHING;


INSERT INTO public.attendance (
  id, registration_id, event_id, participant_id, checked_in_by, checked_in_at, method
) VALUES (
  '00000000-0000-4000-8000-600000000079',
  '00000000-0000-4000-8000-500000000079',
  '00000000-0000-4000-8000-400000000006',
  '00000000-0000-4000-8000-300000000027',
  '00000000-0000-4000-8000-200000000001',
  '2026-08-21T09:00:00.000Z',
  'qr_scan'
) ON CONFLICT (registration_id) DO NOTHING;


INSERT INTO public.attendance (
  id, registration_id, event_id, participant_id, checked_in_by, checked_in_at, method
) VALUES (
  '00000000-0000-4000-8000-600000000080',
  '00000000-0000-4000-8000-500000000080',
  '00000000-0000-4000-8000-400000000004',
  '00000000-0000-4000-8000-300000000027',
  '00000000-0000-4000-8000-200000000001',
  '2026-08-15T09:00:00.000Z',
  'qr_scan'
) ON CONFLICT (registration_id) DO NOTHING;


INSERT INTO public.attendance (
  id, registration_id, event_id, participant_id, checked_in_by, checked_in_at, method
) VALUES (
  '00000000-0000-4000-8000-600000000081',
  '00000000-0000-4000-8000-500000000081',
  '00000000-0000-4000-8000-400000000002',
  '00000000-0000-4000-8000-300000000027',
  '00000000-0000-4000-8000-200000000001',
  '2026-08-09T09:00:00.000Z',
  'qr_scan'
) ON CONFLICT (registration_id) DO NOTHING;


INSERT INTO public.attendance (
  id, registration_id, event_id, participant_id, checked_in_by, checked_in_at, method
) VALUES (
  '00000000-0000-4000-8000-600000000084',
  '00000000-0000-4000-8000-500000000084',
  '00000000-0000-4000-8000-400000000002',
  '00000000-0000-4000-8000-300000000028',
  '00000000-0000-4000-8000-200000000001',
  '2026-08-09T09:00:00.000Z',
  'qr_scan'
) ON CONFLICT (registration_id) DO NOTHING;


INSERT INTO public.attendance (
  id, registration_id, event_id, participant_id, checked_in_by, checked_in_at, method
) VALUES (
  '00000000-0000-4000-8000-600000000087',
  '00000000-0000-4000-8000-500000000087',
  '00000000-0000-4000-8000-400000000008',
  '00000000-0000-4000-8000-300000000029',
  '00000000-0000-4000-8000-200000000001',
  '2026-08-27T09:00:00.000Z',
  'qr_scan'
) ON CONFLICT (registration_id) DO NOTHING;


INSERT INTO public.attendance (
  id, registration_id, event_id, participant_id, checked_in_by, checked_in_at, method
) VALUES (
  '00000000-0000-4000-8000-600000000089',
  '00000000-0000-4000-8000-500000000089',
  '00000000-0000-4000-8000-400000000007',
  '00000000-0000-4000-8000-300000000030',
  '00000000-0000-4000-8000-200000000001',
  '2026-08-24T09:00:00.000Z',
  'qr_scan'
) ON CONFLICT (registration_id) DO NOTHING;


INSERT INTO public.attendance (
  id, registration_id, event_id, participant_id, checked_in_by, checked_in_at, method
) VALUES (
  '00000000-0000-4000-8000-600000000091',
  '00000000-0000-4000-8000-500000000091',
  '00000000-0000-4000-8000-400000000006',
  '00000000-0000-4000-8000-300000000031',
  '00000000-0000-4000-8000-200000000001',
  '2026-08-21T09:00:00.000Z',
  'qr_scan'
) ON CONFLICT (registration_id) DO NOTHING;


INSERT INTO public.attendance (
  id, registration_id, event_id, participant_id, checked_in_by, checked_in_at, method
) VALUES (
  '00000000-0000-4000-8000-600000000092',
  '00000000-0000-4000-8000-500000000092',
  '00000000-0000-4000-8000-400000000005',
  '00000000-0000-4000-8000-300000000031',
  '00000000-0000-4000-8000-200000000001',
  '2026-08-18T09:00:00.000Z',
  'qr_scan'
) ON CONFLICT (registration_id) DO NOTHING;


INSERT INTO public.attendance (
  id, registration_id, event_id, participant_id, checked_in_by, checked_in_at, method
) VALUES (
  '00000000-0000-4000-8000-600000000094',
  '00000000-0000-4000-8000-500000000094',
  '00000000-0000-4000-8000-400000000004',
  '00000000-0000-4000-8000-300000000032',
  '00000000-0000-4000-8000-200000000001',
  '2026-08-15T09:00:00.000Z',
  'qr_scan'
) ON CONFLICT (registration_id) DO NOTHING;


INSERT INTO public.attendance (
  id, registration_id, event_id, participant_id, checked_in_by, checked_in_at, method
) VALUES (
  '00000000-0000-4000-8000-600000000095',
  '00000000-0000-4000-8000-500000000095',
  '00000000-0000-4000-8000-400000000001',
  '00000000-0000-4000-8000-300000000032',
  '00000000-0000-4000-8000-200000000001',
  '2026-08-06T09:00:00.000Z',
  'qr_scan'
) ON CONFLICT (registration_id) DO NOTHING;


INSERT INTO public.attendance (
  id, registration_id, event_id, participant_id, checked_in_by, checked_in_at, method
) VALUES (
  '00000000-0000-4000-8000-600000000096',
  '00000000-0000-4000-8000-500000000096',
  '00000000-0000-4000-8000-400000000010',
  '00000000-0000-4000-8000-300000000032',
  '00000000-0000-4000-8000-200000000001',
  '2026-09-02T09:00:00.000Z',
  'qr_scan'
) ON CONFLICT (registration_id) DO NOTHING;


INSERT INTO public.attendance (
  id, registration_id, event_id, participant_id, checked_in_by, checked_in_at, method
) VALUES (
  '00000000-0000-4000-8000-600000000099',
  '00000000-0000-4000-8000-500000000099',
  '00000000-0000-4000-8000-400000000008',
  '00000000-0000-4000-8000-300000000033',
  '00000000-0000-4000-8000-200000000001',
  '2026-08-27T09:00:00.000Z',
  'qr_scan'
) ON CONFLICT (registration_id) DO NOTHING;


INSERT INTO public.attendance (
  id, registration_id, event_id, participant_id, checked_in_by, checked_in_at, method
) VALUES (
  '00000000-0000-4000-8000-600000000102',
  '00000000-0000-4000-8000-500000000102',
  '00000000-0000-4000-8000-400000000002',
  '00000000-0000-4000-8000-300000000034',
  '00000000-0000-4000-8000-200000000001',
  '2026-08-09T09:00:00.000Z',
  'qr_scan'
) ON CONFLICT (registration_id) DO NOTHING;


INSERT INTO public.attendance (
  id, registration_id, event_id, participant_id, checked_in_by, checked_in_at, method
) VALUES (
  '00000000-0000-4000-8000-600000000103',
  '00000000-0000-4000-8000-500000000103',
  '00000000-0000-4000-8000-400000000006',
  '00000000-0000-4000-8000-300000000035',
  '00000000-0000-4000-8000-200000000001',
  '2026-08-21T09:00:00.000Z',
  'qr_scan'
) ON CONFLICT (registration_id) DO NOTHING;


INSERT INTO public.attendance (
  id, registration_id, event_id, participant_id, checked_in_by, checked_in_at, method
) VALUES (
  '00000000-0000-4000-8000-600000000105',
  '00000000-0000-4000-8000-500000000105',
  '00000000-0000-4000-8000-400000000009',
  '00000000-0000-4000-8000-300000000035',
  '00000000-0000-4000-8000-200000000001',
  '2026-08-30T09:00:00.000Z',
  'qr_scan'
) ON CONFLICT (registration_id) DO NOTHING;


INSERT INTO public.attendance (
  id, registration_id, event_id, participant_id, checked_in_by, checked_in_at, method
) VALUES (
  '00000000-0000-4000-8000-600000000108',
  '00000000-0000-4000-8000-500000000108',
  '00000000-0000-4000-8000-400000000004',
  '00000000-0000-4000-8000-300000000036',
  '00000000-0000-4000-8000-200000000001',
  '2026-08-15T09:00:00.000Z',
  'qr_scan'
) ON CONFLICT (registration_id) DO NOTHING;


INSERT INTO public.attendance (
  id, registration_id, event_id, participant_id, checked_in_by, checked_in_at, method
) VALUES (
  '00000000-0000-4000-8000-600000000110',
  '00000000-0000-4000-8000-500000000110',
  '00000000-0000-4000-8000-400000000005',
  '00000000-0000-4000-8000-300000000037',
  '00000000-0000-4000-8000-200000000001',
  '2026-08-18T09:00:00.000Z',
  'qr_scan'
) ON CONFLICT (registration_id) DO NOTHING;


INSERT INTO public.attendance (
  id, registration_id, event_id, participant_id, checked_in_by, checked_in_at, method
) VALUES (
  '00000000-0000-4000-8000-600000000111',
  '00000000-0000-4000-8000-500000000111',
  '00000000-0000-4000-8000-400000000007',
  '00000000-0000-4000-8000-300000000037',
  '00000000-0000-4000-8000-200000000001',
  '2026-08-24T09:00:00.000Z',
  'qr_scan'
) ON CONFLICT (registration_id) DO NOTHING;


INSERT INTO public.attendance (
  id, registration_id, event_id, participant_id, checked_in_by, checked_in_at, method
) VALUES (
  '00000000-0000-4000-8000-600000000115',
  '00000000-0000-4000-8000-500000000115',
  '00000000-0000-4000-8000-400000000007',
  '00000000-0000-4000-8000-300000000039',
  '00000000-0000-4000-8000-200000000001',
  '2026-08-24T09:00:00.000Z',
  'qr_scan'
) ON CONFLICT (registration_id) DO NOTHING;


INSERT INTO public.attendance (
  id, registration_id, event_id, participant_id, checked_in_by, checked_in_at, method
) VALUES (
  '00000000-0000-4000-8000-600000000117',
  '00000000-0000-4000-8000-500000000117',
  '00000000-0000-4000-8000-400000000009',
  '00000000-0000-4000-8000-300000000039',
  '00000000-0000-4000-8000-200000000001',
  '2026-08-30T09:00:00.000Z',
  'qr_scan'
) ON CONFLICT (registration_id) DO NOTHING;


INSERT INTO public.attendance (
  id, registration_id, event_id, participant_id, checked_in_by, checked_in_at, method
) VALUES (
  '00000000-0000-4000-8000-600000000119',
  '00000000-0000-4000-8000-500000000119',
  '00000000-0000-4000-8000-400000000007',
  '00000000-0000-4000-8000-300000000040',
  '00000000-0000-4000-8000-200000000001',
  '2026-08-24T09:00:00.000Z',
  'qr_scan'
) ON CONFLICT (registration_id) DO NOTHING;


INSERT INTO public.attendance (
  id, registration_id, event_id, participant_id, checked_in_by, checked_in_at, method
) VALUES (
  '00000000-0000-4000-8000-600000000120',
  '00000000-0000-4000-8000-500000000120',
  '00000000-0000-4000-8000-400000000005',
  '00000000-0000-4000-8000-300000000040',
  '00000000-0000-4000-8000-200000000001',
  '2026-08-18T09:00:00.000Z',
  'qr_scan'
) ON CONFLICT (registration_id) DO NOTHING;


INSERT INTO public.attendance (
  id, registration_id, event_id, participant_id, checked_in_by, checked_in_at, method
) VALUES (
  '00000000-0000-4000-8000-600000000121',
  '00000000-0000-4000-8000-500000000121',
  '00000000-0000-4000-8000-400000000001',
  '00000000-0000-4000-8000-300000000041',
  '00000000-0000-4000-8000-200000000001',
  '2026-08-06T09:00:00.000Z',
  'qr_scan'
) ON CONFLICT (registration_id) DO NOTHING;


INSERT INTO public.attendance (
  id, registration_id, event_id, participant_id, checked_in_by, checked_in_at, method
) VALUES (
  '00000000-0000-4000-8000-600000000122',
  '00000000-0000-4000-8000-500000000122',
  '00000000-0000-4000-8000-400000000008',
  '00000000-0000-4000-8000-300000000041',
  '00000000-0000-4000-8000-200000000001',
  '2026-08-27T09:00:00.000Z',
  'qr_scan'
) ON CONFLICT (registration_id) DO NOTHING;


INSERT INTO public.attendance (
  id, registration_id, event_id, participant_id, checked_in_by, checked_in_at, method
) VALUES (
  '00000000-0000-4000-8000-600000000124',
  '00000000-0000-4000-8000-500000000124',
  '00000000-0000-4000-8000-400000000010',
  '00000000-0000-4000-8000-300000000042',
  '00000000-0000-4000-8000-200000000001',
  '2026-09-02T09:00:00.000Z',
  'qr_scan'
) ON CONFLICT (registration_id) DO NOTHING;


INSERT INTO public.attendance (
  id, registration_id, event_id, participant_id, checked_in_by, checked_in_at, method
) VALUES (
  '00000000-0000-4000-8000-600000000127',
  '00000000-0000-4000-8000-500000000127',
  '00000000-0000-4000-8000-400000000006',
  '00000000-0000-4000-8000-300000000043',
  '00000000-0000-4000-8000-200000000001',
  '2026-08-21T09:00:00.000Z',
  'qr_scan'
) ON CONFLICT (registration_id) DO NOTHING;


INSERT INTO public.attendance (
  id, registration_id, event_id, participant_id, checked_in_by, checked_in_at, method
) VALUES (
  '00000000-0000-4000-8000-600000000131',
  '00000000-0000-4000-8000-500000000131',
  '00000000-0000-4000-8000-400000000005',
  '00000000-0000-4000-8000-300000000044',
  '00000000-0000-4000-8000-200000000001',
  '2026-08-18T09:00:00.000Z',
  'qr_scan'
) ON CONFLICT (registration_id) DO NOTHING;


INSERT INTO public.attendance (
  id, registration_id, event_id, participant_id, checked_in_by, checked_in_at, method
) VALUES (
  '00000000-0000-4000-8000-600000000132',
  '00000000-0000-4000-8000-500000000132',
  '00000000-0000-4000-8000-400000000007',
  '00000000-0000-4000-8000-300000000044',
  '00000000-0000-4000-8000-200000000001',
  '2026-08-24T09:00:00.000Z',
  'qr_scan'
) ON CONFLICT (registration_id) DO NOTHING;


INSERT INTO public.attendance (
  id, registration_id, event_id, participant_id, checked_in_by, checked_in_at, method
) VALUES (
  '00000000-0000-4000-8000-600000000133',
  '00000000-0000-4000-8000-500000000133',
  '00000000-0000-4000-8000-400000000009',
  '00000000-0000-4000-8000-300000000045',
  '00000000-0000-4000-8000-200000000001',
  '2026-08-30T09:00:00.000Z',
  'qr_scan'
) ON CONFLICT (registration_id) DO NOTHING;


INSERT INTO public.attendance (
  id, registration_id, event_id, participant_id, checked_in_by, checked_in_at, method
) VALUES (
  '00000000-0000-4000-8000-600000000134',
  '00000000-0000-4000-8000-500000000134',
  '00000000-0000-4000-8000-400000000010',
  '00000000-0000-4000-8000-300000000045',
  '00000000-0000-4000-8000-200000000001',
  '2026-09-02T09:00:00.000Z',
  'qr_scan'
) ON CONFLICT (registration_id) DO NOTHING;


INSERT INTO public.attendance (
  id, registration_id, event_id, participant_id, checked_in_by, checked_in_at, method
) VALUES (
  '00000000-0000-4000-8000-600000000136',
  '00000000-0000-4000-8000-500000000136',
  '00000000-0000-4000-8000-400000000008',
  '00000000-0000-4000-8000-300000000046',
  '00000000-0000-4000-8000-200000000001',
  '2026-08-27T09:00:00.000Z',
  'qr_scan'
) ON CONFLICT (registration_id) DO NOTHING;


INSERT INTO public.attendance (
  id, registration_id, event_id, participant_id, checked_in_by, checked_in_at, method
) VALUES (
  '00000000-0000-4000-8000-600000000137',
  '00000000-0000-4000-8000-500000000137',
  '00000000-0000-4000-8000-400000000002',
  '00000000-0000-4000-8000-300000000046',
  '00000000-0000-4000-8000-200000000001',
  '2026-08-09T09:00:00.000Z',
  'qr_scan'
) ON CONFLICT (registration_id) DO NOTHING;


INSERT INTO public.attendance (
  id, registration_id, event_id, participant_id, checked_in_by, checked_in_at, method
) VALUES (
  '00000000-0000-4000-8000-600000000142',
  '00000000-0000-4000-8000-500000000142',
  '00000000-0000-4000-8000-400000000006',
  '00000000-0000-4000-8000-300000000048',
  '00000000-0000-4000-8000-200000000001',
  '2026-08-21T09:00:00.000Z',
  'qr_scan'
) ON CONFLICT (registration_id) DO NOTHING;


INSERT INTO public.attendance (
  id, registration_id, event_id, participant_id, checked_in_by, checked_in_at, method
) VALUES (
  '00000000-0000-4000-8000-600000000143',
  '00000000-0000-4000-8000-500000000143',
  '00000000-0000-4000-8000-400000000003',
  '00000000-0000-4000-8000-300000000048',
  '00000000-0000-4000-8000-200000000001',
  '2026-08-12T09:00:00.000Z',
  'qr_scan'
) ON CONFLICT (registration_id) DO NOTHING;


INSERT INTO public.attendance (
  id, registration_id, event_id, participant_id, checked_in_by, checked_in_at, method
) VALUES (
  '00000000-0000-4000-8000-600000000146',
  '00000000-0000-4000-8000-500000000146',
  '00000000-0000-4000-8000-400000000003',
  '00000000-0000-4000-8000-300000000049',
  '00000000-0000-4000-8000-200000000001',
  '2026-08-12T09:00:00.000Z',
  'qr_scan'
) ON CONFLICT (registration_id) DO NOTHING;


INSERT INTO public.attendance (
  id, registration_id, event_id, participant_id, checked_in_by, checked_in_at, method
) VALUES (
  '00000000-0000-4000-8000-600000000147',
  '00000000-0000-4000-8000-500000000147',
  '00000000-0000-4000-8000-400000000004',
  '00000000-0000-4000-8000-300000000049',
  '00000000-0000-4000-8000-200000000001',
  '2026-08-15T09:00:00.000Z',
  'qr_scan'
) ON CONFLICT (registration_id) DO NOTHING;


INSERT INTO public.attendance (
  id, registration_id, event_id, participant_id, checked_in_by, checked_in_at, method
) VALUES (
  '00000000-0000-4000-8000-600000000152',
  '00000000-0000-4000-8000-500000000152',
  '00000000-0000-4000-8000-400000000010',
  '00000000-0000-4000-8000-300000000051',
  '00000000-0000-4000-8000-200000000001',
  '2026-09-02T09:00:00.000Z',
  'qr_scan'
) ON CONFLICT (registration_id) DO NOTHING;


INSERT INTO public.attendance (
  id, registration_id, event_id, participant_id, checked_in_by, checked_in_at, method
) VALUES (
  '00000000-0000-4000-8000-600000000156',
  '00000000-0000-4000-8000-500000000156',
  '00000000-0000-4000-8000-400000000009',
  '00000000-0000-4000-8000-300000000052',
  '00000000-0000-4000-8000-200000000001',
  '2026-08-30T09:00:00.000Z',
  'qr_scan'
) ON CONFLICT (registration_id) DO NOTHING;


INSERT INTO public.attendance (
  id, registration_id, event_id, participant_id, checked_in_by, checked_in_at, method
) VALUES (
  '00000000-0000-4000-8000-600000000157',
  '00000000-0000-4000-8000-500000000157',
  '00000000-0000-4000-8000-400000000001',
  '00000000-0000-4000-8000-300000000053',
  '00000000-0000-4000-8000-200000000001',
  '2026-08-06T09:00:00.000Z',
  'qr_scan'
) ON CONFLICT (registration_id) DO NOTHING;


INSERT INTO public.attendance (
  id, registration_id, event_id, participant_id, checked_in_by, checked_in_at, method
) VALUES (
  '00000000-0000-4000-8000-600000000158',
  '00000000-0000-4000-8000-500000000158',
  '00000000-0000-4000-8000-400000000006',
  '00000000-0000-4000-8000-300000000053',
  '00000000-0000-4000-8000-200000000001',
  '2026-08-21T09:00:00.000Z',
  'qr_scan'
) ON CONFLICT (registration_id) DO NOTHING;


INSERT INTO public.attendance (
  id, registration_id, event_id, participant_id, checked_in_by, checked_in_at, method
) VALUES (
  '00000000-0000-4000-8000-600000000161',
  '00000000-0000-4000-8000-500000000161',
  '00000000-0000-4000-8000-400000000002',
  '00000000-0000-4000-8000-300000000054',
  '00000000-0000-4000-8000-200000000001',
  '2026-08-09T09:00:00.000Z',
  'qr_scan'
) ON CONFLICT (registration_id) DO NOTHING;


INSERT INTO public.attendance (
  id, registration_id, event_id, participant_id, checked_in_by, checked_in_at, method
) VALUES (
  '00000000-0000-4000-8000-600000000163',
  '00000000-0000-4000-8000-500000000163',
  '00000000-0000-4000-8000-400000000010',
  '00000000-0000-4000-8000-300000000055',
  '00000000-0000-4000-8000-200000000001',
  '2026-09-02T09:00:00.000Z',
  'qr_scan'
) ON CONFLICT (registration_id) DO NOTHING;


INSERT INTO public.attendance (
  id, registration_id, event_id, participant_id, checked_in_by, checked_in_at, method
) VALUES (
  '00000000-0000-4000-8000-600000000167',
  '00000000-0000-4000-8000-500000000167',
  '00000000-0000-4000-8000-400000000005',
  '00000000-0000-4000-8000-300000000056',
  '00000000-0000-4000-8000-200000000001',
  '2026-08-18T09:00:00.000Z',
  'qr_scan'
) ON CONFLICT (registration_id) DO NOTHING;


INSERT INTO public.attendance (
  id, registration_id, event_id, participant_id, checked_in_by, checked_in_at, method
) VALUES (
  '00000000-0000-4000-8000-600000000168',
  '00000000-0000-4000-8000-500000000168',
  '00000000-0000-4000-8000-400000000008',
  '00000000-0000-4000-8000-300000000056',
  '00000000-0000-4000-8000-200000000001',
  '2026-08-27T09:00:00.000Z',
  'qr_scan'
) ON CONFLICT (registration_id) DO NOTHING;


INSERT INTO public.attendance (
  id, registration_id, event_id, participant_id, checked_in_by, checked_in_at, method
) VALUES (
  '00000000-0000-4000-8000-600000000172',
  '00000000-0000-4000-8000-500000000172',
  '00000000-0000-4000-8000-400000000006',
  '00000000-0000-4000-8000-300000000058',
  '00000000-0000-4000-8000-200000000001',
  '2026-08-21T09:00:00.000Z',
  'qr_scan'
) ON CONFLICT (registration_id) DO NOTHING;


INSERT INTO public.attendance (
  id, registration_id, event_id, participant_id, checked_in_by, checked_in_at, method
) VALUES (
  '00000000-0000-4000-8000-600000000175',
  '00000000-0000-4000-8000-500000000175',
  '00000000-0000-4000-8000-400000000003',
  '00000000-0000-4000-8000-300000000059',
  '00000000-0000-4000-8000-200000000001',
  '2026-08-12T09:00:00.000Z',
  'qr_scan'
) ON CONFLICT (registration_id) DO NOTHING;


INSERT INTO public.attendance (
  id, registration_id, event_id, participant_id, checked_in_by, checked_in_at, method
) VALUES (
  '00000000-0000-4000-8000-600000000176',
  '00000000-0000-4000-8000-500000000176',
  '00000000-0000-4000-8000-400000000010',
  '00000000-0000-4000-8000-300000000059',
  '00000000-0000-4000-8000-200000000001',
  '2026-09-02T09:00:00.000Z',
  'qr_scan'
) ON CONFLICT (registration_id) DO NOTHING;


INSERT INTO public.attendance (
  id, registration_id, event_id, participant_id, checked_in_by, checked_in_at, method
) VALUES (
  '00000000-0000-4000-8000-600000000178',
  '00000000-0000-4000-8000-500000000178',
  '00000000-0000-4000-8000-400000000004',
  '00000000-0000-4000-8000-300000000060',
  '00000000-0000-4000-8000-200000000001',
  '2026-08-15T09:00:00.000Z',
  'qr_scan'
) ON CONFLICT (registration_id) DO NOTHING;


INSERT INTO public.attendance (
  id, registration_id, event_id, participant_id, checked_in_by, checked_in_at, method
) VALUES (
  '00000000-0000-4000-8000-600000000179',
  '00000000-0000-4000-8000-500000000179',
  '00000000-0000-4000-8000-400000000005',
  '00000000-0000-4000-8000-300000000060',
  '00000000-0000-4000-8000-200000000001',
  '2026-08-18T09:00:00.000Z',
  'qr_scan'
) ON CONFLICT (registration_id) DO NOTHING;


INSERT INTO public.attendance (
  id, registration_id, event_id, participant_id, checked_in_by, checked_in_at, method
) VALUES (
  '00000000-0000-4000-8000-600000000180',
  '00000000-0000-4000-8000-500000000180',
  '00000000-0000-4000-8000-400000000006',
  '00000000-0000-4000-8000-300000000060',
  '00000000-0000-4000-8000-200000000001',
  '2026-08-21T09:00:00.000Z',
  'qr_scan'
) ON CONFLICT (registration_id) DO NOTHING;


INSERT INTO public.attendance (
  id, registration_id, event_id, participant_id, checked_in_by, checked_in_at, method
) VALUES (
  '00000000-0000-4000-8000-600000000181',
  '00000000-0000-4000-8000-500000000181',
  '00000000-0000-4000-8000-400000000004',
  '00000000-0000-4000-8000-300000000061',
  '00000000-0000-4000-8000-200000000001',
  '2026-08-15T09:00:00.000Z',
  'qr_scan'
) ON CONFLICT (registration_id) DO NOTHING;


INSERT INTO public.attendance (
  id, registration_id, event_id, participant_id, checked_in_by, checked_in_at, method
) VALUES (
  '00000000-0000-4000-8000-600000000182',
  '00000000-0000-4000-8000-500000000182',
  '00000000-0000-4000-8000-400000000009',
  '00000000-0000-4000-8000-300000000061',
  '00000000-0000-4000-8000-200000000001',
  '2026-08-30T09:00:00.000Z',
  'qr_scan'
) ON CONFLICT (registration_id) DO NOTHING;


INSERT INTO public.attendance (
  id, registration_id, event_id, participant_id, checked_in_by, checked_in_at, method
) VALUES (
  '00000000-0000-4000-8000-600000000184',
  '00000000-0000-4000-8000-500000000184',
  '00000000-0000-4000-8000-400000000007',
  '00000000-0000-4000-8000-300000000062',
  '00000000-0000-4000-8000-200000000001',
  '2026-08-24T09:00:00.000Z',
  'qr_scan'
) ON CONFLICT (registration_id) DO NOTHING;


INSERT INTO public.attendance (
  id, registration_id, event_id, participant_id, checked_in_by, checked_in_at, method
) VALUES (
  '00000000-0000-4000-8000-600000000187',
  '00000000-0000-4000-8000-500000000187',
  '00000000-0000-4000-8000-400000000002',
  '00000000-0000-4000-8000-300000000063',
  '00000000-0000-4000-8000-200000000001',
  '2026-08-09T09:00:00.000Z',
  'qr_scan'
) ON CONFLICT (registration_id) DO NOTHING;


INSERT INTO public.attendance (
  id, registration_id, event_id, participant_id, checked_in_by, checked_in_at, method
) VALUES (
  '00000000-0000-4000-8000-600000000190',
  '00000000-0000-4000-8000-500000000190',
  '00000000-0000-4000-8000-400000000002',
  '00000000-0000-4000-8000-300000000064',
  '00000000-0000-4000-8000-200000000001',
  '2026-08-09T09:00:00.000Z',
  'qr_scan'
) ON CONFLICT (registration_id) DO NOTHING;


INSERT INTO public.attendance (
  id, registration_id, event_id, participant_id, checked_in_by, checked_in_at, method
) VALUES (
  '00000000-0000-4000-8000-600000000192',
  '00000000-0000-4000-8000-500000000192',
  '00000000-0000-4000-8000-400000000005',
  '00000000-0000-4000-8000-300000000064',
  '00000000-0000-4000-8000-200000000001',
  '2026-08-18T09:00:00.000Z',
  'qr_scan'
) ON CONFLICT (registration_id) DO NOTHING;


INSERT INTO public.attendance (
  id, registration_id, event_id, participant_id, checked_in_by, checked_in_at, method
) VALUES (
  '00000000-0000-4000-8000-600000000194',
  '00000000-0000-4000-8000-500000000194',
  '00000000-0000-4000-8000-400000000004',
  '00000000-0000-4000-8000-300000000065',
  '00000000-0000-4000-8000-200000000001',
  '2026-08-15T09:00:00.000Z',
  'qr_scan'
) ON CONFLICT (registration_id) DO NOTHING;


INSERT INTO public.attendance (
  id, registration_id, event_id, participant_id, checked_in_by, checked_in_at, method
) VALUES (
  '00000000-0000-4000-8000-600000000195',
  '00000000-0000-4000-8000-500000000195',
  '00000000-0000-4000-8000-400000000003',
  '00000000-0000-4000-8000-300000000065',
  '00000000-0000-4000-8000-200000000001',
  '2026-08-12T09:00:00.000Z',
  'qr_scan'
) ON CONFLICT (registration_id) DO NOTHING;


INSERT INTO public.attendance (
  id, registration_id, event_id, participant_id, checked_in_by, checked_in_at, method
) VALUES (
  '00000000-0000-4000-8000-600000000197',
  '00000000-0000-4000-8000-500000000197',
  '00000000-0000-4000-8000-400000000003',
  '00000000-0000-4000-8000-300000000066',
  '00000000-0000-4000-8000-200000000001',
  '2026-08-12T09:00:00.000Z',
  'qr_scan'
) ON CONFLICT (registration_id) DO NOTHING;


INSERT INTO public.attendance (
  id, registration_id, event_id, participant_id, checked_in_by, checked_in_at, method
) VALUES (
  '00000000-0000-4000-8000-600000000198',
  '00000000-0000-4000-8000-500000000198',
  '00000000-0000-4000-8000-400000000008',
  '00000000-0000-4000-8000-300000000066',
  '00000000-0000-4000-8000-200000000001',
  '2026-08-27T09:00:00.000Z',
  'qr_scan'
) ON CONFLICT (registration_id) DO NOTHING;


INSERT INTO public.attendance (
  id, registration_id, event_id, participant_id, checked_in_by, checked_in_at, method
) VALUES (
  '00000000-0000-4000-8000-600000000199',
  '00000000-0000-4000-8000-500000000199',
  '00000000-0000-4000-8000-400000000006',
  '00000000-0000-4000-8000-300000000067',
  '00000000-0000-4000-8000-200000000001',
  '2026-08-21T09:00:00.000Z',
  'qr_scan'
) ON CONFLICT (registration_id) DO NOTHING;


INSERT INTO public.attendance (
  id, registration_id, event_id, participant_id, checked_in_by, checked_in_at, method
) VALUES (
  '00000000-0000-4000-8000-600000000200',
  '00000000-0000-4000-8000-500000000200',
  '00000000-0000-4000-8000-400000000003',
  '00000000-0000-4000-8000-300000000067',
  '00000000-0000-4000-8000-200000000001',
  '2026-08-12T09:00:00.000Z',
  'qr_scan'
) ON CONFLICT (registration_id) DO NOTHING;


INSERT INTO public.attendance (
  id, registration_id, event_id, participant_id, checked_in_by, checked_in_at, method
) VALUES (
  '00000000-0000-4000-8000-600000000201',
  '00000000-0000-4000-8000-500000000201',
  '00000000-0000-4000-8000-400000000002',
  '00000000-0000-4000-8000-300000000067',
  '00000000-0000-4000-8000-200000000001',
  '2026-08-09T09:00:00.000Z',
  'qr_scan'
) ON CONFLICT (registration_id) DO NOTHING;


INSERT INTO public.attendance (
  id, registration_id, event_id, participant_id, checked_in_by, checked_in_at, method
) VALUES (
  '00000000-0000-4000-8000-600000000203',
  '00000000-0000-4000-8000-500000000203',
  '00000000-0000-4000-8000-400000000006',
  '00000000-0000-4000-8000-300000000068',
  '00000000-0000-4000-8000-200000000001',
  '2026-08-21T09:00:00.000Z',
  'qr_scan'
) ON CONFLICT (registration_id) DO NOTHING;


INSERT INTO public.attendance (
  id, registration_id, event_id, participant_id, checked_in_by, checked_in_at, method
) VALUES (
  '00000000-0000-4000-8000-600000000208',
  '00000000-0000-4000-8000-500000000208',
  '00000000-0000-4000-8000-400000000008',
  '00000000-0000-4000-8000-300000000070',
  '00000000-0000-4000-8000-200000000001',
  '2026-08-27T09:00:00.000Z',
  'qr_scan'
) ON CONFLICT (registration_id) DO NOTHING;


INSERT INTO public.attendance (
  id, registration_id, event_id, participant_id, checked_in_by, checked_in_at, method
) VALUES (
  '00000000-0000-4000-8000-600000000210',
  '00000000-0000-4000-8000-500000000210',
  '00000000-0000-4000-8000-400000000006',
  '00000000-0000-4000-8000-300000000070',
  '00000000-0000-4000-8000-200000000001',
  '2026-08-21T09:00:00.000Z',
  'qr_scan'
) ON CONFLICT (registration_id) DO NOTHING;


INSERT INTO public.attendance (
  id, registration_id, event_id, participant_id, checked_in_by, checked_in_at, method
) VALUES (
  '00000000-0000-4000-8000-600000000212',
  '00000000-0000-4000-8000-500000000212',
  '00000000-0000-4000-8000-400000000010',
  '00000000-0000-4000-8000-300000000071',
  '00000000-0000-4000-8000-200000000001',
  '2026-09-02T09:00:00.000Z',
  'qr_scan'
) ON CONFLICT (registration_id) DO NOTHING;


INSERT INTO public.attendance (
  id, registration_id, event_id, participant_id, checked_in_by, checked_in_at, method
) VALUES (
  '00000000-0000-4000-8000-600000000214',
  '00000000-0000-4000-8000-500000000214',
  '00000000-0000-4000-8000-400000000001',
  '00000000-0000-4000-8000-300000000072',
  '00000000-0000-4000-8000-200000000001',
  '2026-08-06T09:00:00.000Z',
  'qr_scan'
) ON CONFLICT (registration_id) DO NOTHING;


INSERT INTO public.attendance (
  id, registration_id, event_id, participant_id, checked_in_by, checked_in_at, method
) VALUES (
  '00000000-0000-4000-8000-600000000215',
  '00000000-0000-4000-8000-500000000215',
  '00000000-0000-4000-8000-400000000003',
  '00000000-0000-4000-8000-300000000072',
  '00000000-0000-4000-8000-200000000001',
  '2026-08-12T09:00:00.000Z',
  'qr_scan'
) ON CONFLICT (registration_id) DO NOTHING;


INSERT INTO public.attendance (
  id, registration_id, event_id, participant_id, checked_in_by, checked_in_at, method
) VALUES (
  '00000000-0000-4000-8000-600000000217',
  '00000000-0000-4000-8000-500000000217',
  '00000000-0000-4000-8000-400000000005',
  '00000000-0000-4000-8000-300000000073',
  '00000000-0000-4000-8000-200000000001',
  '2026-08-18T09:00:00.000Z',
  'qr_scan'
) ON CONFLICT (registration_id) DO NOTHING;


INSERT INTO public.attendance (
  id, registration_id, event_id, participant_id, checked_in_by, checked_in_at, method
) VALUES (
  '00000000-0000-4000-8000-600000000220',
  '00000000-0000-4000-8000-500000000220',
  '00000000-0000-4000-8000-400000000001',
  '00000000-0000-4000-8000-300000000074',
  '00000000-0000-4000-8000-200000000001',
  '2026-08-06T09:00:00.000Z',
  'qr_scan'
) ON CONFLICT (registration_id) DO NOTHING;


INSERT INTO public.attendance (
  id, registration_id, event_id, participant_id, checked_in_by, checked_in_at, method
) VALUES (
  '00000000-0000-4000-8000-600000000221',
  '00000000-0000-4000-8000-500000000221',
  '00000000-0000-4000-8000-400000000007',
  '00000000-0000-4000-8000-300000000074',
  '00000000-0000-4000-8000-200000000001',
  '2026-08-24T09:00:00.000Z',
  'qr_scan'
) ON CONFLICT (registration_id) DO NOTHING;


INSERT INTO public.attendance (
  id, registration_id, event_id, participant_id, checked_in_by, checked_in_at, method
) VALUES (
  '00000000-0000-4000-8000-600000000223',
  '00000000-0000-4000-8000-500000000223',
  '00000000-0000-4000-8000-400000000010',
  '00000000-0000-4000-8000-300000000075',
  '00000000-0000-4000-8000-200000000001',
  '2026-09-02T09:00:00.000Z',
  'qr_scan'
) ON CONFLICT (registration_id) DO NOTHING;


INSERT INTO public.attendance (
  id, registration_id, event_id, participant_id, checked_in_by, checked_in_at, method
) VALUES (
  '00000000-0000-4000-8000-600000000225',
  '00000000-0000-4000-8000-500000000225',
  '00000000-0000-4000-8000-400000000001',
  '00000000-0000-4000-8000-300000000075',
  '00000000-0000-4000-8000-200000000001',
  '2026-08-06T09:00:00.000Z',
  'qr_scan'
) ON CONFLICT (registration_id) DO NOTHING;


INSERT INTO public.attendance (
  id, registration_id, event_id, participant_id, checked_in_by, checked_in_at, method
) VALUES (
  '00000000-0000-4000-8000-600000000229',
  '00000000-0000-4000-8000-500000000229',
  '00000000-0000-4000-8000-400000000009',
  '00000000-0000-4000-8000-300000000077',
  '00000000-0000-4000-8000-200000000001',
  '2026-08-30T09:00:00.000Z',
  'qr_scan'
) ON CONFLICT (registration_id) DO NOTHING;


INSERT INTO public.attendance (
  id, registration_id, event_id, participant_id, checked_in_by, checked_in_at, method
) VALUES (
  '00000000-0000-4000-8000-600000000230',
  '00000000-0000-4000-8000-500000000230',
  '00000000-0000-4000-8000-400000000004',
  '00000000-0000-4000-8000-300000000077',
  '00000000-0000-4000-8000-200000000001',
  '2026-08-15T09:00:00.000Z',
  'qr_scan'
) ON CONFLICT (registration_id) DO NOTHING;


INSERT INTO public.attendance (
  id, registration_id, event_id, participant_id, checked_in_by, checked_in_at, method
) VALUES (
  '00000000-0000-4000-8000-600000000231',
  '00000000-0000-4000-8000-500000000231',
  '00000000-0000-4000-8000-400000000010',
  '00000000-0000-4000-8000-300000000077',
  '00000000-0000-4000-8000-200000000001',
  '2026-09-02T09:00:00.000Z',
  'qr_scan'
) ON CONFLICT (registration_id) DO NOTHING;


INSERT INTO public.attendance (
  id, registration_id, event_id, participant_id, checked_in_by, checked_in_at, method
) VALUES (
  '00000000-0000-4000-8000-600000000233',
  '00000000-0000-4000-8000-500000000233',
  '00000000-0000-4000-8000-400000000002',
  '00000000-0000-4000-8000-300000000078',
  '00000000-0000-4000-8000-200000000001',
  '2026-08-09T09:00:00.000Z',
  'qr_scan'
) ON CONFLICT (registration_id) DO NOTHING;


INSERT INTO public.attendance (
  id, registration_id, event_id, participant_id, checked_in_by, checked_in_at, method
) VALUES (
  '00000000-0000-4000-8000-600000000234',
  '00000000-0000-4000-8000-500000000234',
  '00000000-0000-4000-8000-400000000001',
  '00000000-0000-4000-8000-300000000078',
  '00000000-0000-4000-8000-200000000001',
  '2026-08-06T09:00:00.000Z',
  'qr_scan'
) ON CONFLICT (registration_id) DO NOTHING;


INSERT INTO public.attendance (
  id, registration_id, event_id, participant_id, checked_in_by, checked_in_at, method
) VALUES (
  '00000000-0000-4000-8000-600000000235',
  '00000000-0000-4000-8000-500000000235',
  '00000000-0000-4000-8000-400000000005',
  '00000000-0000-4000-8000-300000000079',
  '00000000-0000-4000-8000-200000000001',
  '2026-08-18T09:00:00.000Z',
  'qr_scan'
) ON CONFLICT (registration_id) DO NOTHING;


INSERT INTO public.attendance (
  id, registration_id, event_id, participant_id, checked_in_by, checked_in_at, method
) VALUES (
  '00000000-0000-4000-8000-600000000237',
  '00000000-0000-4000-8000-500000000237',
  '00000000-0000-4000-8000-400000000001',
  '00000000-0000-4000-8000-300000000079',
  '00000000-0000-4000-8000-200000000001',
  '2026-08-06T09:00:00.000Z',
  'qr_scan'
) ON CONFLICT (registration_id) DO NOTHING;


INSERT INTO public.attendance (
  id, registration_id, event_id, participant_id, checked_in_by, checked_in_at, method
) VALUES (
  '00000000-0000-4000-8000-600000000245',
  '00000000-0000-4000-8000-500000000245',
  '00000000-0000-4000-8000-400000000008',
  '00000000-0000-4000-8000-300000000082',
  '00000000-0000-4000-8000-200000000001',
  '2026-08-27T09:00:00.000Z',
  'qr_scan'
) ON CONFLICT (registration_id) DO NOTHING;


INSERT INTO public.attendance (
  id, registration_id, event_id, participant_id, checked_in_by, checked_in_at, method
) VALUES (
  '00000000-0000-4000-8000-600000000246',
  '00000000-0000-4000-8000-500000000246',
  '00000000-0000-4000-8000-400000000009',
  '00000000-0000-4000-8000-300000000082',
  '00000000-0000-4000-8000-200000000001',
  '2026-08-30T09:00:00.000Z',
  'qr_scan'
) ON CONFLICT (registration_id) DO NOTHING;


INSERT INTO public.attendance (
  id, registration_id, event_id, participant_id, checked_in_by, checked_in_at, method
) VALUES (
  '00000000-0000-4000-8000-600000000250',
  '00000000-0000-4000-8000-500000000250',
  '00000000-0000-4000-8000-400000000004',
  '00000000-0000-4000-8000-300000000084',
  '00000000-0000-4000-8000-200000000001',
  '2026-08-15T09:00:00.000Z',
  'qr_scan'
) ON CONFLICT (registration_id) DO NOTHING;


INSERT INTO public.attendance (
  id, registration_id, event_id, participant_id, checked_in_by, checked_in_at, method
) VALUES (
  '00000000-0000-4000-8000-600000000252',
  '00000000-0000-4000-8000-500000000252',
  '00000000-0000-4000-8000-400000000008',
  '00000000-0000-4000-8000-300000000084',
  '00000000-0000-4000-8000-200000000001',
  '2026-08-27T09:00:00.000Z',
  'qr_scan'
) ON CONFLICT (registration_id) DO NOTHING;


INSERT INTO public.attendance (
  id, registration_id, event_id, participant_id, checked_in_by, checked_in_at, method
) VALUES (
  '00000000-0000-4000-8000-600000000254',
  '00000000-0000-4000-8000-500000000254',
  '00000000-0000-4000-8000-400000000001',
  '00000000-0000-4000-8000-300000000085',
  '00000000-0000-4000-8000-200000000001',
  '2026-08-06T09:00:00.000Z',
  'qr_scan'
) ON CONFLICT (registration_id) DO NOTHING;


INSERT INTO public.attendance (
  id, registration_id, event_id, participant_id, checked_in_by, checked_in_at, method
) VALUES (
  '00000000-0000-4000-8000-600000000255',
  '00000000-0000-4000-8000-500000000255',
  '00000000-0000-4000-8000-400000000007',
  '00000000-0000-4000-8000-300000000085',
  '00000000-0000-4000-8000-200000000001',
  '2026-08-24T09:00:00.000Z',
  'qr_scan'
) ON CONFLICT (registration_id) DO NOTHING;


INSERT INTO public.attendance (
  id, registration_id, event_id, participant_id, checked_in_by, checked_in_at, method
) VALUES (
  '00000000-0000-4000-8000-600000000256',
  '00000000-0000-4000-8000-500000000256',
  '00000000-0000-4000-8000-400000000007',
  '00000000-0000-4000-8000-300000000086',
  '00000000-0000-4000-8000-200000000001',
  '2026-08-24T09:00:00.000Z',
  'qr_scan'
) ON CONFLICT (registration_id) DO NOTHING;


INSERT INTO public.attendance (
  id, registration_id, event_id, participant_id, checked_in_by, checked_in_at, method
) VALUES (
  '00000000-0000-4000-8000-600000000263',
  '00000000-0000-4000-8000-500000000263',
  '00000000-0000-4000-8000-400000000009',
  '00000000-0000-4000-8000-300000000088',
  '00000000-0000-4000-8000-200000000001',
  '2026-08-30T09:00:00.000Z',
  'qr_scan'
) ON CONFLICT (registration_id) DO NOTHING;


INSERT INTO public.attendance (
  id, registration_id, event_id, participant_id, checked_in_by, checked_in_at, method
) VALUES (
  '00000000-0000-4000-8000-600000000264',
  '00000000-0000-4000-8000-500000000264',
  '00000000-0000-4000-8000-400000000010',
  '00000000-0000-4000-8000-300000000088',
  '00000000-0000-4000-8000-200000000001',
  '2026-09-02T09:00:00.000Z',
  'qr_scan'
) ON CONFLICT (registration_id) DO NOTHING;


INSERT INTO public.attendance (
  id, registration_id, event_id, participant_id, checked_in_by, checked_in_at, method
) VALUES (
  '00000000-0000-4000-8000-600000000266',
  '00000000-0000-4000-8000-500000000266',
  '00000000-0000-4000-8000-400000000006',
  '00000000-0000-4000-8000-300000000089',
  '00000000-0000-4000-8000-200000000001',
  '2026-08-21T09:00:00.000Z',
  'qr_scan'
) ON CONFLICT (registration_id) DO NOTHING;


INSERT INTO public.attendance (
  id, registration_id, event_id, participant_id, checked_in_by, checked_in_at, method
) VALUES (
  '00000000-0000-4000-8000-600000000267',
  '00000000-0000-4000-8000-500000000267',
  '00000000-0000-4000-8000-400000000003',
  '00000000-0000-4000-8000-300000000089',
  '00000000-0000-4000-8000-200000000001',
  '2026-08-12T09:00:00.000Z',
  'qr_scan'
) ON CONFLICT (registration_id) DO NOTHING;


INSERT INTO public.attendance (
  id, registration_id, event_id, participant_id, checked_in_by, checked_in_at, method
) VALUES (
  '00000000-0000-4000-8000-600000000268',
  '00000000-0000-4000-8000-500000000268',
  '00000000-0000-4000-8000-400000000008',
  '00000000-0000-4000-8000-300000000090',
  '00000000-0000-4000-8000-200000000001',
  '2026-08-27T09:00:00.000Z',
  'qr_scan'
) ON CONFLICT (registration_id) DO NOTHING;


INSERT INTO public.attendance (
  id, registration_id, event_id, participant_id, checked_in_by, checked_in_at, method
) VALUES (
  '00000000-0000-4000-8000-600000000269',
  '00000000-0000-4000-8000-500000000269',
  '00000000-0000-4000-8000-400000000010',
  '00000000-0000-4000-8000-300000000090',
  '00000000-0000-4000-8000-200000000001',
  '2026-09-02T09:00:00.000Z',
  'qr_scan'
) ON CONFLICT (registration_id) DO NOTHING;


INSERT INTO public.attendance (
  id, registration_id, event_id, participant_id, checked_in_by, checked_in_at, method
) VALUES (
  '00000000-0000-4000-8000-600000000270',
  '00000000-0000-4000-8000-500000000270',
  '00000000-0000-4000-8000-400000000003',
  '00000000-0000-4000-8000-300000000090',
  '00000000-0000-4000-8000-200000000001',
  '2026-08-12T09:00:00.000Z',
  'qr_scan'
) ON CONFLICT (registration_id) DO NOTHING;


INSERT INTO public.attendance (
  id, registration_id, event_id, participant_id, checked_in_by, checked_in_at, method
) VALUES (
  '00000000-0000-4000-8000-600000000271',
  '00000000-0000-4000-8000-500000000271',
  '00000000-0000-4000-8000-400000000003',
  '00000000-0000-4000-8000-300000000091',
  '00000000-0000-4000-8000-200000000001',
  '2026-08-12T09:00:00.000Z',
  'qr_scan'
) ON CONFLICT (registration_id) DO NOTHING;


INSERT INTO public.attendance (
  id, registration_id, event_id, participant_id, checked_in_by, checked_in_at, method
) VALUES (
  '00000000-0000-4000-8000-600000000273',
  '00000000-0000-4000-8000-500000000273',
  '00000000-0000-4000-8000-400000000005',
  '00000000-0000-4000-8000-300000000091',
  '00000000-0000-4000-8000-200000000001',
  '2026-08-18T09:00:00.000Z',
  'qr_scan'
) ON CONFLICT (registration_id) DO NOTHING;


INSERT INTO public.attendance (
  id, registration_id, event_id, participant_id, checked_in_by, checked_in_at, method
) VALUES (
  '00000000-0000-4000-8000-600000000276',
  '00000000-0000-4000-8000-500000000276',
  '00000000-0000-4000-8000-400000000010',
  '00000000-0000-4000-8000-300000000092',
  '00000000-0000-4000-8000-200000000001',
  '2026-09-02T09:00:00.000Z',
  'qr_scan'
) ON CONFLICT (registration_id) DO NOTHING;


INSERT INTO public.attendance (
  id, registration_id, event_id, participant_id, checked_in_by, checked_in_at, method
) VALUES (
  '00000000-0000-4000-8000-600000000280',
  '00000000-0000-4000-8000-500000000280',
  '00000000-0000-4000-8000-400000000009',
  '00000000-0000-4000-8000-300000000094',
  '00000000-0000-4000-8000-200000000001',
  '2026-08-30T09:00:00.000Z',
  'qr_scan'
) ON CONFLICT (registration_id) DO NOTHING;


INSERT INTO public.attendance (
  id, registration_id, event_id, participant_id, checked_in_by, checked_in_at, method
) VALUES (
  '00000000-0000-4000-8000-600000000283',
  '00000000-0000-4000-8000-500000000283',
  '00000000-0000-4000-8000-400000000004',
  '00000000-0000-4000-8000-300000000095',
  '00000000-0000-4000-8000-200000000001',
  '2026-08-15T09:00:00.000Z',
  'qr_scan'
) ON CONFLICT (registration_id) DO NOTHING;


INSERT INTO public.attendance (
  id, registration_id, event_id, participant_id, checked_in_by, checked_in_at, method
) VALUES (
  '00000000-0000-4000-8000-600000000284',
  '00000000-0000-4000-8000-500000000284',
  '00000000-0000-4000-8000-400000000005',
  '00000000-0000-4000-8000-300000000095',
  '00000000-0000-4000-8000-200000000001',
  '2026-08-18T09:00:00.000Z',
  'qr_scan'
) ON CONFLICT (registration_id) DO NOTHING;


INSERT INTO public.attendance (
  id, registration_id, event_id, participant_id, checked_in_by, checked_in_at, method
) VALUES (
  '00000000-0000-4000-8000-600000000287',
  '00000000-0000-4000-8000-500000000287',
  '00000000-0000-4000-8000-400000000002',
  '00000000-0000-4000-8000-300000000096',
  '00000000-0000-4000-8000-200000000001',
  '2026-08-09T09:00:00.000Z',
  'qr_scan'
) ON CONFLICT (registration_id) DO NOTHING;


INSERT INTO public.attendance (
  id, registration_id, event_id, participant_id, checked_in_by, checked_in_at, method
) VALUES (
  '00000000-0000-4000-8000-600000000288',
  '00000000-0000-4000-8000-500000000288',
  '00000000-0000-4000-8000-400000000010',
  '00000000-0000-4000-8000-300000000096',
  '00000000-0000-4000-8000-200000000001',
  '2026-09-02T09:00:00.000Z',
  'qr_scan'
) ON CONFLICT (registration_id) DO NOTHING;


INSERT INTO public.attendance (
  id, registration_id, event_id, participant_id, checked_in_by, checked_in_at, method
) VALUES (
  '00000000-0000-4000-8000-600000000293',
  '00000000-0000-4000-8000-500000000293',
  '00000000-0000-4000-8000-400000000010',
  '00000000-0000-4000-8000-300000000098',
  '00000000-0000-4000-8000-200000000001',
  '2026-09-02T09:00:00.000Z',
  'qr_scan'
) ON CONFLICT (registration_id) DO NOTHING;


INSERT INTO public.attendance (
  id, registration_id, event_id, participant_id, checked_in_by, checked_in_at, method
) VALUES (
  '00000000-0000-4000-8000-600000000294',
  '00000000-0000-4000-8000-500000000294',
  '00000000-0000-4000-8000-400000000009',
  '00000000-0000-4000-8000-300000000098',
  '00000000-0000-4000-8000-200000000001',
  '2026-08-30T09:00:00.000Z',
  'qr_scan'
) ON CONFLICT (registration_id) DO NOTHING;


INSERT INTO public.attendance (
  id, registration_id, event_id, participant_id, checked_in_by, checked_in_at, method
) VALUES (
  '00000000-0000-4000-8000-600000000295',
  '00000000-0000-4000-8000-500000000295',
  '00000000-0000-4000-8000-400000000009',
  '00000000-0000-4000-8000-300000000099',
  '00000000-0000-4000-8000-200000000001',
  '2026-08-30T09:00:00.000Z',
  'qr_scan'
) ON CONFLICT (registration_id) DO NOTHING;


INSERT INTO public.attendance (
  id, registration_id, event_id, participant_id, checked_in_by, checked_in_at, method
) VALUES (
  '00000000-0000-4000-8000-600000000296',
  '00000000-0000-4000-8000-500000000296',
  '00000000-0000-4000-8000-400000000006',
  '00000000-0000-4000-8000-300000000099',
  '00000000-0000-4000-8000-200000000001',
  '2026-08-21T09:00:00.000Z',
  'qr_scan'
) ON CONFLICT (registration_id) DO NOTHING;
