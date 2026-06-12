import XCTest
@testable import AiAppStarter

final class APIEndpointTests: XCTestCase {
    private let baseURL = URL(string: "http://127.0.0.1:8000")!

    func testEndpointURLsMatchBackendContract() {
        XCTAssertEqual(APIEndpoint.health.url(baseURL: baseURL).absoluteString, "http://127.0.0.1:8000/health")
        XCTAssertEqual(APIEndpoint.signup.url(baseURL: baseURL).absoluteString, "http://127.0.0.1:8000/auth/signup")
        XCTAssertEqual(APIEndpoint.login.url(baseURL: baseURL).absoluteString, "http://127.0.0.1:8000/auth/login")
        XCTAssertEqual(APIEndpoint.currentUser.url(baseURL: baseURL).absoluteString, "http://127.0.0.1:8000/users/me")
    }
}
