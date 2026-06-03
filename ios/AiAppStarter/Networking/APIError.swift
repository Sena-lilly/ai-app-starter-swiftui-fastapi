import Foundation

enum APIError: Error, Equatable {
    case invalidURL
    case network(String)
    case invalidResponse
    case statusCode(Int)
    case server(code: String, message: String, statusCode: Int)
    case decoding(String)
}

extension APIError: LocalizedError {
    var errorDescription: String? {
        userMessage
    }

    var userMessage: String {
        switch self {
        case .invalidURL:
            return "The backend URL is invalid."
        case .network(let message):
            return "Network error: \(message)"
        case .invalidResponse:
            return "The backend returned an invalid response."
        case .statusCode(let code):
            return "The backend returned HTTP \(code)."
        case .server(let code, let message, _):
            switch code {
            case "email_already_registered":
                return "That email is already registered."
            case "invalid_credentials":
                return "Invalid email or password."
            case "invalid_or_expired_token":
                return "Your session has expired. Please log in again."
            default:
                return message
            }
        case .decoding(let message):
            return "Could not decode backend response: \(message)"
        }
    }

    var isInvalidOrExpiredToken: Bool {
        if case .server(let code, _, _) = self {
            return code == "invalid_or_expired_token"
        }
        return false
    }
}
