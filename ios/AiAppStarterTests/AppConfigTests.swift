import XCTest
@testable import AiAppStarter

final class AppConfigTests: XCTestCase {
    func testLocalDevelopmentConfigUsesLoopbackBackend() {
        let config = AppConfig.localDevelopment

        XCTAssertEqual(config.environment, .local)
        XCTAssertEqual(config.baseURL.absoluteString, "http://127.0.0.1:8000")
    }
}
