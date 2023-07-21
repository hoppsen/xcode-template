//
//  AboutViewModel.swift
//  Template
//
//  Created by Marcel Hoppe on 21.07.23.
//

import UIKit

class AboutViewModel: ObservableObject {
    enum ActiveSheet: Identifiable {
        case termsOfUse, privacyPolicy, shareSheet

        var id: Int {
            hashValue
        }
    }

    @Published var activeSheet: ActiveSheet?

    func openTwitter() {
        let application = UIApplication.shared
        if let appURL = URL(string: MainConstants.twitterDeepLink), application.canOpenURL(appURL) {
            application.open(appURL)
        } else if let webURL = URL(string: MainConstants.twitterLink), application.canOpenURL(webURL) {
            application.open(webURL)
        }
    }
}
