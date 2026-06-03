import Foundation

enum APIEndpoint {
    case health
    case signup
    case login
    case currentUser

    func url(baseURL: URL) -> URL {
        switch self {
        case .health:
            return baseURL.appending(path: "health")
        case .signup:
            return baseURL.appending(path: "auth/signup")
        case .login:
            return baseURL.appending(path: "auth/login")
        case .currentUser:
            return baseURL.appending(path: "users/me")
        }
    }
}
