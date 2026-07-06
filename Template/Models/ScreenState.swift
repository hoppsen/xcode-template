import Foundation

enum ScreenState {
    /// Screen loaded sucessfully
    case normal

    /// The screen is currently loading. Show loading hud or loading button
    case loading

    /// An error occured
    case error(_ message: String?)

    // MARK: - Computed Properties

    var isNormal: Bool {
        guard case .normal = self else {
            return false
        }
        return true
    }

    var isLoading: Bool {
        guard case .loading = self else {
            return false
        }
        return true
    }

    var isError: Bool {
        get {
            guard case .error = self else {
                return false
            }
            return true
        }
        // This variable needs a set in order to use it as a @Binding
        set {} // swiftlint:disable:this unused_setter_value
    }
}
