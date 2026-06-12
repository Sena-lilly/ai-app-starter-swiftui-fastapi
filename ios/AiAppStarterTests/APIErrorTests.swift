import XCTest
@testable import AiAppStarter

final class APIErrorTests: XCTestCase {
    func testKnownServerErrorsUseFriendlyMessages() {
        XCTAssertEqual(
            APIError.server(code: "email_already_registered", message: "duplicate", statusCode: 409).userMessage,
            "That email is already registered."
        )
        XCTAssertEqual(
            APIError.server(code: "invalid_credentials", message: "bad credentials", statusCode: 401).userMessage,
            "Invalid email or password."
        )
        XCTAssertEqual(
            APIError.server(code: "invalid_or_expired_token", message: "expired", statusCode: 401).userMessage,
            "Your session has expired. Please log in again."
        )
    }

    func testInvalidOrExpiredTokenDetection() {
        XCTAssertTrue(APIError.server(code: "invalid_or_expired_token", message: "expired", statusCode: 401).isInvalidOrExpiredToken)
        XCTAssertFalse(APIError.statusCode(500).isInvalidOrExpiredToken)
    }
}
