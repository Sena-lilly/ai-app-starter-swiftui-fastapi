import Combine
import Foundation

@MainActor
final class HomeViewModel: ObservableObject {
    enum HealthState: Equatable {
        case idle
        case loading
        case loaded(HealthDTO)
        case failed(String)
    }

    @Published private(set) var healthState: HealthState = .idle

    var isCheckingHealth: Bool {
        healthState == .loading
    }

    private let apiClient: APIClient

    init(apiClient: APIClient) {
        self.apiClient = apiClient
    }

    func checkBackendHealth() async {
        healthState = .loading

        do {
            let health = try await apiClient.healthCheck()
            healthState = .loaded(health)
        } catch let error as APIError {
            healthState = .failed(error.errorDescription ?? "Backend health check failed.")
        } catch {
            healthState = .failed("Backend health check failed.")
        }
    }
}
