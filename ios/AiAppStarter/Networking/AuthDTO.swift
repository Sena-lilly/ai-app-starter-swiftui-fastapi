import Foundation

struct AuthRequest: Encodable, Equatable {
    let email: String
    let password: String
}

struct AuthResponse: Decodable, Equatable {
    let user: UserDTO
    let accessToken: String
    let tokenType: String

    enum CodingKeys: String, CodingKey {
        case user
        case accessToken = "access_token"
        case tokenType = "token_type"
    }
}

struct APIErrorResponse: Decodable, Equatable {
    let detail: Detail

    struct Detail: Decodable, Equatable {
        let code: String?
        let message: String?
    }
}
