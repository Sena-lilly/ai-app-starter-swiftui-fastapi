import Foundation
import Combine

enum AppEnvironmentKind: String {
    case local
    case development
}

@MainActor
final class AppEnvironment: ObservableObject {
    let config: AppConfig
    let apiClient: APIClient
    let tokenStore: TokenStore
    let sessionViewModel: SessionViewModel

    init(config: AppConfig) {
        self.config = config
        let apiClient = APIClient(config: config)
        let tokenStore = KeychainTokenStore()
        self.apiClient = apiClient
        self.tokenStore = tokenStore
        self.sessionViewModel = SessionViewModel(
            apiClient: apiClient,
            tokenStore: tokenStore
        )
    }
}
