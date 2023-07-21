//
//  UIApplication.swift
//  Template
//
//  Created by Marcel Hoppe on 21.07.23.
//

import UIKit

extension UIApplication {
    /// Opens settings within system settings.
    class func openSystemSettings() {
        URL(string: UIApplication.openSettingsURLString)?.open()
    }

    var keyWindow: UIWindow? {
        UIApplication.shared.connectedScenes
            .filter { $0.activationState == .foregroundActive }
            .compactMap { $0 as? UIWindowScene }
            .first?.windows
            .first(where: { $0.isKeyWindow })
    }
}
