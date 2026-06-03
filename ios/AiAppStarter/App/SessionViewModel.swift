import Foundation
import Combine

@MainActor
final class SessionViewModel: ObservableObject {
    enum State: Equatable {
        case loading
        case unauthenticated
        case authenticated(UserDTO)
        case error(String)
    }

    @Published private(set) var state: State = .loading
    @Published private(set) var isWorking = false

    private let apiClient: APIClient
    private let tokenStore: TokenStore
    private var hasAttemptedRestore = false

    init(apiClient: APIClient, tokenStore: TokenStore) {
        self.apiClient = apiClient
        self.tokenStore = tokenStore
    }

    var currentUser: UserDTO? {
        if case .authenticated(let user) = state {
            return user
        }
        return nil
    }

    var errorMessage: String? {
        if case .error(let message) = state {
            return message
        }
        return nil
    }

    func restoreSession() async {
        guard !hasAttemptedRestore else {
            return
        }
        hasAttemptedRestore = true
        state = .loading

        do {
            guard let token = try tokenStore.loadAccessToken() else {
                state = .unauthenticated
                return
            }

            let user = try await apiClient.getCurrentUser(accessToken: token)
            state = .authenticated(user)
        } catch let error as APIError {
            if error.isInvalidOrExpiredToken {
                try? tokenStore.clearAccessToken()
                state = .unauthenticated
            } else {
                state = .error(error.userMessage)
            }
        } catch is TokenStoreError {
            state = .unauthenticated
        } catch {
            state = .error("Could not restore your session.")
        }
    }

    @discardableResult
    func login(email: String, password: String) async -> Bool {
        await authenticate {
            try await apiClient.login(email: email, password: password)
        }
    }

    @discardableResult
    func signup(email: String, password: String) async -> Bool {
        await authenticate {
            try await apiClient.signup(email: email, password: password)
        }
    }

    func logout() {
        try? tokenStore.clearAccessToken()
        state = .unauthenticated
    }

    private func authenticate(_ request: () async throws -> AuthResponse) async -> Bool {
        isWorking = true
        defer {
            isWorking = false
        }

        do {
            let response = try await request()
            try tokenStore.saveAccessToken(response.accessToken)
            state = .authenticated(response.user)
            return true
        } catch let error as APIError {
            if error.isInvalidOrExpiredToken {
                try? tokenStore.clearAccessToken()
            }
            state = .error(error.userMessage)
            return false
        } catch is TokenStoreError {
            state = .error("Could not store the access token in Keychain.")
            return false
        } catch {
            state = .error("Authentication failed.")
            return false
        }
    }
}
