//
//  URL.swift
//  Template
//
//  Created by Marcel Hoppe on 21.07.23.
//

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
    @discardableResult
    func open() -> Bool {
        guard UIApplication.shared.canOpenURL(self) else {
            return false
        }
        UIApplication.shared.open(self, options: [:]) { _ in }
        return true
    }

    // MARK: - Static URLs

    static var website: URL? {
        URL(string: "https://www.hoppsen.com")
    }

    static var termsOfUse: URL? {
        URL(string: "https://www.hoppsen.com")
    }

    static var privacyPolicy: URL? {
        URL(string: "https://www.hoppsen.com")
    }
}
