import SwiftUI

@main
struct AiAppStarterApp: App {
    @StateObject private var environment = AppEnvironment(config: .localDevelopment)

    var body: some Scene {
        WindowGroup {
            NavigationStack {
                HomeView(
                    viewModel: HomeViewModel(
                        apiClient: environment.apiClient
                    ),
                    session: environment.sessionViewModel
                )
            }
            .task {
                await environment.sessionViewModel.restoreSession()
            }
        }
    }
}
