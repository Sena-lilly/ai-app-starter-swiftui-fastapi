import Foundation

struct APIClient {
    let config: AppConfig
    var session: URLSession = .shared

    func healthCheck() async throws -> HealthDTO {
        let request = makeRequest(endpoint: .health)
        return try await send(request)
    }

    func signup(email: String, password: String) async throws -> AuthResponse {
        var request = makeRequest(endpoint: .signup, method: "POST")
        request.httpBody = try JSONEncoder().encode(
            AuthRequest(email: email, password: password)
        )
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        return try await send(request, successStatusCodes: 200..<300)
    }

    func login(email: String, password: String) async throws -> AuthResponse {
        var request = makeRequest(endpoint: .login, method: "POST")
        request.httpBody = try JSONEncoder().encode(
            AuthRequest(email: email, password: password)
        )
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        return try await send(request)
    }

    func getCurrentUser(accessToken: String) async throws -> UserDTO {
        let request = makeRequest(
            endpoint: .currentUser,
            accessToken: accessToken
        )
        return try await send(request)
    }

    private func makeRequest(
        endpoint: APIEndpoint,
        method: String = "GET",
        accessToken: String? = nil
    ) -> URLRequest {
        let url = endpoint.url(baseURL: config.baseURL)
        var request = URLRequest(url: url)
        request.httpMethod = method
        request.setValue("application/json", forHTTPHeaderField: "Accept")

        if let accessToken {
            request.setValue("Bearer \(accessToken)", forHTTPHeaderField: "Authorization")
        }

        return request
    }

    private func send<Response: Decodable>(
        _ request: URLRequest,
        successStatusCodes: Range<Int> = 200..<300
    ) async throws -> Response {
        let data: Data
        let response: URLResponse

        do {
            (data, response) = try await session.data(for: request)
        } catch {
            throw APIError.network(error.localizedDescription)
        }

        guard let httpResponse = response as? HTTPURLResponse else {
            throw APIError.invalidResponse
        }

        guard successStatusCodes.contains(httpResponse.statusCode) else {
            if let serverError = decodeServerError(data: data, statusCode: httpResponse.statusCode) {
                throw serverError
            }
            throw APIError.statusCode(httpResponse.statusCode)
        }

        do {
            return try JSONDecoder().decode(Response.self, from: data)
        } catch {
            throw APIError.decoding(error.localizedDescription)
        }
    }

    private func decodeServerError(data: Data, statusCode: Int) -> APIError? {
        guard let response = try? JSONDecoder().decode(APIErrorResponse.self, from: data) else {
            return nil
        }

        return APIError.server(
            code: response.detail.code ?? "server_error",
            message: response.detail.message ?? "The backend returned an error.",
            statusCode: statusCode
        )
    }
}
