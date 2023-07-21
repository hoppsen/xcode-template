//
//  Globals.swift
//  Template
//
//  Created by Marcel Hoppe on 21.07.23.
//

import UIKit

typealias Completion = () -> Void

struct MainConstants {
    // MARK: - App Store

    /// Your app’s unique identifier.
    static let appId = "id123456789" // <- CHANGE
    static let appStoreLink = "https://apps.apple.com/app/<company>/\(appId)" // <- CHANGE
    static let appStoreDeepLink = "itms-apps://apple.com/app/\(appId)"

    // MARK: - Twitter

    static let twitterUsername = "hoppsen1" // <- CHANGE
    static let twitterLink = "https://twitter.com/\(twitterUsername)"
    static let twitterDeepLink = "twitter://user?screen_name=\(twitterUsername)"
}
