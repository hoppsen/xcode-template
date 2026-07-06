import OSLog

final class Logger: @unchecked Sendable {
    private let category: String
    private let logger: os.Logger

    init(category: String) {
        self.category = category
        logger = os.Logger(subsystem: Bundle.main.bundleIdentifier!, category: category)
    }

    /// Use this method to write messages using the default log level to both the in-memory and on-disk log stores.
    func log(_ message: String) {
        // os.Logger is already thread-safe, no need for additional synchronization
        let category = category.uppercased()
        logger.log("[\(category)]: \(message)")
    }

    /// Use this method to write messages with the debug log level to the in-memory log store only.
    func debug(_ message: String) {
        let category = category.uppercased()
        logger.debug("[\(category)]: \(message)")
    }

    /// Use this method to write messages with the info log level to the in-memory log store only.
    func info(_ message: String) {
        let category = category.uppercased()
        logger.info("[\(category)]: \(message)")
    }

    /// Use this method to write messages with the error log level to both the in-memory and on-disk log stores.
    func error(_ message: String) {
        let category = category.uppercased()
        logger.error("[\(category)]: \(message)")
    }

    func warning(_ message: String) {
        let category = category.uppercased()
        logger.warning("[\(category)]: \(message)")
    }
}

// Use a private extension to ensure all loggers are initialized at once
private extension Logger {
    static let _general = Logger(category: "general")
    static let _userDefaults = Logger(category: "user-defaults")
}

// Public extension with computed properties to ensure thread-safe access
extension Logger {
    static var general: Logger { _general }
    static var userDefaults: Logger { _userDefaults }
}
