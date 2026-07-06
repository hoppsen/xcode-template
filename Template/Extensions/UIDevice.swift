import UIKit

extension UIDevice {
    /// Returns true if the current device is an iPad
    static var isPad: Bool {
        UIDevice.current.userInterfaceIdiom == .pad
    }

    /// Returns true if the current device is an iPhone
    static var isPhone: Bool {
        UIDevice.current.userInterfaceIdiom == .phone
    }
}
