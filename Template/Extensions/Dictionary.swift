import Foundation

// MARK: - Dictionary Merge Extension

extension Dictionary {
    /// Merges two dictionaries using the + operator.
    /// In case of duplicate keys, values from the right dictionary take precedence.
    ///
    /// Example:
    /// ```
    /// let dict1 = ["a": 1, "b": 2]
    /// let dict2 = ["b": 3, "c": 4]
    /// let merged = dict1 + dict2  // ["a": 1, "b": 3, "c": 4]
    /// ```
    static func + (lhs: [Key: Value], rhs: [Key: Value]) -> [Key: Value] {
        var result = lhs
        // Using the built-in merge method is more efficient than forEach
        result.merge(rhs) { _, new in new }
        return result
    }

    /// Merges another dictionary into this one using the += operator.
    /// In case of duplicate keys, values from the right dictionary take precedence.
    static func += (lhs: inout [Key: Value], rhs: [Key: Value]) {
        lhs.merge(rhs) { _, new in new }
    }

    /// Cleans an dictionary by removing empty strings and arrays.
    func removeKeysWithEmptyValues() -> [Key: Value] {
        var copy = self
        forEach { key, value in
            // filter out: "key": ""
            if let stringValue = value as? String, stringValue.isEmpty {
                copy.removeValue(forKey: key)
            }
            // filter out: "key": []
            if let arrayValue = value as? [Any], arrayValue.isEmpty {
                copy.removeValue(forKey: key)
            }
            // filter out: "key": [:]
            if let dictValue = value as? [AnyHashable: Any], dictValue.isEmpty {
                copy.removeValue(forKey: key)
            }
        }
        return copy as [Key: Value]
    }
}

// MARK: - Convenience Methods

extension Dictionary where Key == String, Value == Any {
    /// Merges multiple dictionaries together.
    /// Later dictionaries override values from earlier ones for duplicate keys.
    static func merge(_ dictionaries: [[String: Any]]) -> [String: Any] {
        dictionaries.reduce([:]) { $0 + $1 }
    }
}
