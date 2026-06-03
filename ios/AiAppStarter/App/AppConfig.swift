import Foundation

struct AppConfig {
    let environment: AppEnvironmentKind
    let baseURL: URL

    static let localDevelopment = AppConfig(
        environment: .local,
        baseURL: URL(string: "http://127.0.0.1:8000")!
    )
}
