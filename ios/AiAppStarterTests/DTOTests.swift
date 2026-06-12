import XCTest
@testable import AiAppStarter

final class DTOTests: XCTestCase {
    func testHealthDTODecodesBackendHealthResponse() throws {
        let json = """
        {
          "status": "ok",
          "service": "backend",
          "version": "0.1.0-dev"
        }
        """.data(using: .utf8)!

        let dto = try JSONDecoder().decode(HealthDTO.self, from: json)

        XCTAssertEqual(dto.status, "ok")
        XCTAssertEqual(dto.service, "backend")
        XCTAssertEqual(dto.version, "0.1.0-dev")
    }

    func testAuthResponseDecodesSnakeCaseTokenFields() throws {
        let json = """
        {
          "user": {
            "id": 1,
            "email": "visual-demo@example.com",
            "created_at": "2026-01-01T00:00:00Z",
            "updated_at": "2026-01-01T00:00:00Z"
          },
          "access_token": "local-test-token",
          "token_type": "bearer"
        }
        """.data(using: .utf8)!

        let dto = try JSONDecoder().decode(AuthResponse.self, from: json)

        XCTAssertEqual(dto.user.id, 1)
        XCTAssertEqual(dto.user.email, "visual-demo@example.com")
        XCTAssertEqual(dto.accessToken, "local-test-token")
        XCTAssertEqual(dto.tokenType, "bearer")
    }
}
