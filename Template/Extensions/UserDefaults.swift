import Foundation

extension UserDefaults {
    /// Centralized enum for all UserDefaults keys.
    ///
    /// Add a case per key with a namespaced raw value, then read and write it through the
    /// type-safe wrappers below (e.g. `UserDefaults.standard.set(true, forKey: .hasSeenIntro)`).
    ///
    /// When the app gains an extension (widget, share, …), add an app group plus a
    /// `UserDefaults.sharedSuite` and split these keys into app-only vs shared.
    enum Key: String {
        /// Example key — replace with your own. Whether the user has completed the first launch.
        case hasCompletedFirstLaunch = "app.hasCompletedFirstLaunch"
    }

    // MARK: - Type-Safe Wrappers

    /// Set a value for a key
    func set(_ value: Any?, forKey key: Key) {
        set(value, forKey: key.rawValue)
    }

    /// Get a boolean value for a key
    func bool(forKey key: Key) -> Bool {
        bool(forKey: key.rawValue)
    }

    /// Get a string value for a key
    func string(forKey key: Key) -> String? {
        string(forKey: key.rawValue)
    }

    /// Get an integer value for a key
    func integer(forKey key: Key) -> Int {
        integer(forKey: key.rawValue)
    }

    /// Get a double value for a key
    func double(forKey key: Key) -> Double {
        double(forKey: key.rawValue)
    }

    /// Get a data value for a key
    func data(forKey key: Key) -> Data? {
        data(forKey: key.rawValue)
    }

    /// Get an object value for a key
    func object(forKey key: Key) -> Any? {
        object(forKey: key.rawValue)
    }

    /// Remove a value for a key
    func removeObject(forKey key: Key) {
        removeObject(forKey: key.rawValue)
    }
}
