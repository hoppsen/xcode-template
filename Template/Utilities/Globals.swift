import UIKit

typealias Completion = () -> Void

struct MainConstants {
    // MARK: - App Store

    /// Your app’s unique identifier.
    static let appId = "id123456789" // <- CHANGE
    static let appStoreLink = "https://apps.apple.com/app/<company>/\(appId)" // <- CHANGE
    static let appStoreDeepLink = "itms-apps://apple.com/app/\(appId)"

    // MARK: - Legal URLs

    static let termsOfServiceLink = "https://example.com/terms" // <- CHANGE
    static let privacyPolicyLink = "https://example.com/privacy" // <- CHANGE

    // MARK: - Support

    static let supportEmail = "support@example.com" // <- CHANGE
}
