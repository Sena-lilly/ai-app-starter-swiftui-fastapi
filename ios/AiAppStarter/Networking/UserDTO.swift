import Foundation

struct UserDTO: Decodable, Equatable, Identifiable {
    let id: Int
    let email: String
    let createdAt: String
    let updatedAt: String

    enum CodingKeys: String, CodingKey {
        case id
        case email
        case createdAt = "created_at"
        case updatedAt = "updated_at"
    }
}
