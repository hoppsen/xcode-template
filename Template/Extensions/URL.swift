import UIKit

extension URL {
    /// Ensures the given string is properly encoded. Used for Arabic characters within the URL string.
    init?(encodeString string: String) {
        guard let encodedString = "\(string)".addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed), let url = URL(string: encodedString) else {
            return nil
        }
        self = url
    }

    /// Opens given URL after validating whether it can be opened.
    @MainActor @discardableResult
    func open() -> Bool {
        guard UIApplication.shared.canOpenURL(self) else {
            return false
        }
        UIApplication.shared.open(self, options: [:]) { _ in }
        return true
    }
}
