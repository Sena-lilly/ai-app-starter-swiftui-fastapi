import Foundation
import Security

protocol TokenStore {
    func saveAccessToken(_ token: String) throws
    func loadAccessToken() throws -> String?
    func clearAccessToken() throws
}

enum TokenStoreError: Error, Equatable {
    case unhandledStatus(OSStatus)
    case invalidData
}

extension TokenStoreError: LocalizedError {
    var errorDescription: String? {
        switch self {
        case .unhandledStatus(let status):
            return "Keychain returned status \(status)."
        case .invalidData:
            return "Keychain returned invalid token data."
        }
    }
}

struct KeychainTokenStore: TokenStore {
    private let service = "com.example.AiAppStarter.auth"
    private let account = "access_token"

    func saveAccessToken(_ token: String) throws {
        try clearAccessToken()

        guard let data = token.data(using: .utf8) else {
            throw TokenStoreError.invalidData
        }

        let query: [String: Any] = [
            kSecClass as String: kSecClassGenericPassword,
            kSecAttrService as String: service,
            kSecAttrAccount as String: account,
            kSecValueData as String: data,
            kSecAttrAccessible as String: kSecAttrAccessibleAfterFirstUnlockThisDeviceOnly
        ]

        let status = SecItemAdd(query as CFDictionary, nil)
        guard status == errSecSuccess else {
            throw TokenStoreError.unhandledStatus(status)
        }
    }

    func loadAccessToken() throws -> String? {
        let query: [String: Any] = [
            kSecClass as String: kSecClassGenericPassword,
            kSecAttrService as String: service,
            kSecAttrAccount as String: account,
            kSecReturnData as String: true,
            kSecMatchLimit as String: kSecMatchLimitOne
        ]

        var item: CFTypeRef?
        let status = SecItemCopyMatching(query as CFDictionary, &item)

        if status == errSecItemNotFound {
            return nil
        }

        guard status == errSecSuccess else {
            throw TokenStoreError.unhandledStatus(status)
        }

        guard
            let data = item as? Data,
            let token = String(data: data, encoding: .utf8)
        else {
            throw TokenStoreError.invalidData
        }

        return token
    }

    func clearAccessToken() throws {
        let query: [String: Any] = [
            kSecClass as String: kSecClassGenericPassword,
            kSecAttrService as String: service,
            kSecAttrAccount as String: account
        ]

        let status = SecItemDelete(query as CFDictionary)
        guard status == errSecSuccess || status == errSecItemNotFound else {
            throw TokenStoreError.unhandledStatus(status)
        }
    }
}
