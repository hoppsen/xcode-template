import Foundation

extension Bundle {
    static var version: String? {
        Bundle.main.infoDictionary?["CFBundleShortVersionString"] as? String
    }

    static var build: String? {
        Bundle.main.infoDictionary?["CFBundleVersion"] as? String
    }

    static var displayName: String? {
        Bundle.main.infoDictionary?["CFBundleDisplayName"] as? String
    }
}
