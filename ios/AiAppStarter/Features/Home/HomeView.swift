import SwiftUI

struct HomeView: View {
    @StateObject private var viewModel: HomeViewModel
    @ObservedObject private var session: SessionViewModel

    init(viewModel: HomeViewModel, session: SessionViewModel) {
        _viewModel = StateObject(wrappedValue: viewModel)
        self.session = session
    }

    var body: some View {
        List {
            Section {
                VStack(alignment: .leading, spacing: 12) {
                    Text("ai-app-starter-swiftui-fastapi")
                        .font(.title2)
                        .fontWeight(.semibold)

                    Text("A SwiftUI + FastAPI starter kit with a small local backend health check.")
                        .font(.body)
                        .foregroundStyle(.secondary)
                }
                .padding(.vertical, 8)
            }

            Section("Backend") {
                backendStatusContent

                Button {
                    Task {
                        await viewModel.checkBackendHealth()
                    }
                } label: {
                    if viewModel.isCheckingHealth {
                        Label("Checking Backend Health", systemImage: "arrow.triangle.2.circlepath")
                    } else {
                        Label("Check Backend Health", systemImage: "heart.text.square")
                    }
                }
                .disabled(viewModel.isCheckingHealth)
            }

            Section("Authentication") {
                authContent
            }
        }
        .navigationTitle("Home")
    }

    @ViewBuilder
    private var backendStatusContent: some View {
        switch viewModel.healthState {
        case .idle:
            LoadingStateView(
                title: "Backend status not checked",
                message: "Start the local FastAPI backend, then check health from the simulator."
            )
        case .loading:
            LoadingStateView(
                title: "Checking backend",
                message: "Calling GET /health on the configured local backend."
            )
        case .loaded(let health):
            VStack(alignment: .leading, spacing: 8) {
                Label("Status: \(health.status)", systemImage: "checkmark.circle.fill")
                    .foregroundStyle(.green)
                Text("Service: \(health.service)")
                Text("Version: \(health.version)")
            }
            .font(.body)
            .padding(.vertical, 4)
        case .failed(let message):
            AppErrorMessage(message: message)
        }
    }

    @ViewBuilder
    private var authContent: some View {
        switch session.state {
        case .loading:
            LoadingStateView(
                title: "Checking session",
                message: "Looking for a saved local access token."
            )
        case .authenticated(let user):
            Label(user.email, systemImage: "person.crop.circle.fill")

            Button(role: .destructive) {
                session.logout()
            } label: {
                Label("Logout", systemImage: "rectangle.portrait.and.arrow.right")
            }
        case .unauthenticated:
            authLinks
        case .error(let message):
            AppErrorMessage(message: message)
            authLinks
        }
    }

    private var authLinks: some View {
        Group {
            NavigationLink {
                LoginView(session: session)
            } label: {
                Label("Login", systemImage: "person.crop.circle")
            }

            NavigationLink {
                SignupView(session: session)
            } label: {
                Label("Signup", systemImage: "person.crop.circle.badge.plus")
            }
        }
    }
}
