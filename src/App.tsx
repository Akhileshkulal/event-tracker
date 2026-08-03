import { BrowserRouter, Navigate, Route, Routes } from 'react-router-dom'
import { QueryClient, QueryClientProvider } from '@tanstack/react-query'
import { Toaster } from '@/components/ui/sonner'
import { AuthProvider } from '@/contexts/auth-context'
import {
  GuestRoute,
  ProtectedRoute,
} from '@/components/shared/protected-route'
import { ParticipantLayout } from '@/components/layout/participant-layout'
import { OrganizerLayout } from '@/components/layout/organizer-layout'
import { VolunteerLayout } from '@/components/layout/volunteer-layout'
import { LandingPage } from '@/pages/landing-page'
import { LoginPage } from '@/pages/login-page'
import { RegisterPage } from '@/pages/register-page'
import { ProfilePage } from '@/pages/profile-page'
import { ParticipantHomePage } from '@/pages/participant/home-page'
import { ParticipantEventsPage } from '@/pages/participant/events-page'
import { ParticipantEventDetailPage } from '@/pages/participant/event-detail-page'
import { ParticipantRegistrationsPage } from '@/pages/participant/registrations-page'
import { ParticipantRegistrationDetailPage } from '@/pages/participant/registration-detail-page'
import { OrganizerHomePage } from '@/pages/organizer/home-page'
import { OrganizerEventsPage } from '@/pages/organizer/events-page'
import { OrganizerCreateEventPage } from '@/pages/organizer/create-event-page'
import { OrganizerEditEventPage } from '@/pages/organizer/edit-event-page'
import { OrganizerEventDetailPage } from '@/pages/organizer/event-detail-page'
import { OrganizerReportsPage } from '@/pages/organizer/reports-page'
import { VolunteerHomePage } from '@/pages/volunteer/home-page'
import { VolunteerScannerPage } from '@/pages/volunteer/scanner-page'
import { VolunteerEventsPage } from '@/pages/volunteer/events-page'
import { VolunteerEventDetailPage } from '@/pages/volunteer/event-detail-page'
import { NotFoundPage } from '@/pages/not-found-page'

const queryClient = new QueryClient({
  defaultOptions: {
    queries: {
      staleTime: 30_000,
      retry: 1,
      refetchOnWindowFocus: false,
    },
  },
})

export default function App() {
  return (
    <QueryClientProvider client={queryClient}>
      <AuthProvider>
        <BrowserRouter>
          <Routes>
            <Route path="/" element={<LandingPage />} />

            <Route element={<GuestRoute />}>
              <Route path="/login" element={<LoginPage />} />
              <Route path="/register" element={<RegisterPage />} />
            </Route>

            <Route element={<ProtectedRoute />}>
              <Route path="/profile" element={<ProfilePage />} />
            </Route>

            <Route
              element={
                <ProtectedRoute allowedRoles={['participant', 'admin']} />
              }
            >
              <Route path="/participant" element={<ParticipantLayout />}>
                <Route index element={<ParticipantHomePage />} />
                <Route path="events" element={<ParticipantEventsPage />} />
                <Route
                  path="events/:eventId"
                  element={<ParticipantEventDetailPage />}
                />
                <Route
                  path="registrations"
                  element={<ParticipantRegistrationsPage />}
                />
                <Route
                  path="registrations/:registrationId"
                  element={<ParticipantRegistrationDetailPage />}
                />
              </Route>
            </Route>

            <Route
              element={
                <ProtectedRoute allowedRoles={['organizer', 'admin']} />
              }
            >
              <Route path="/organizer" element={<OrganizerLayout />}>
                <Route index element={<OrganizerHomePage />} />
                <Route path="events" element={<OrganizerEventsPage />} />
                <Route path="events/new" element={<OrganizerCreateEventPage />} />
                <Route
                  path="events/:eventId"
                  element={<OrganizerEventDetailPage />}
                />
                <Route
                  path="events/:eventId/edit"
                  element={<OrganizerEditEventPage />}
                />
                <Route path="reports" element={<OrganizerReportsPage />} />
              </Route>
            </Route>

            <Route
              element={
                <ProtectedRoute
                  allowedRoles={['volunteer', 'organizer', 'admin']}
                />
              }
            >
              <Route path="/volunteer" element={<VolunteerLayout />}>
                <Route index element={<VolunteerHomePage />} />
                <Route path="scanner" element={<VolunteerScannerPage />} />
                <Route path="events" element={<VolunteerEventsPage />} />
                <Route
                  path="events/:eventId"
                  element={<VolunteerEventDetailPage />}
                />
              </Route>
            </Route>

            <Route path="/home" element={<Navigate to="/" replace />} />
            <Route path="*" element={<NotFoundPage />} />
          </Routes>
        </BrowserRouter>
        <Toaster richColors position="top-center" closeButton />
      </AuthProvider>
    </QueryClientProvider>
  )
}
