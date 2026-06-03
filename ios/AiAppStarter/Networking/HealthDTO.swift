struct HealthDTO: Decodable, Equatable {
    let status: String
    let service: String
    let version: String
}
