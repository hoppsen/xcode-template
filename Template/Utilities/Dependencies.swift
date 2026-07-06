import Foundation

/// Lightweight static container for instance-based services.
///
/// ViewModels consume `Dependencies.fooService` instead of instantiating their own, which keeps
/// construction (and test injection points) in one place. Caseless-enum static facades and
/// `.shared` singletons are called directly and do not need an entry here.
final class Dependencies {
    // MARK: - Thread-Safe Services

    // static let fooService: FooService = .init()

    // MARK: - Singleton Services

    // static var barManager: BarManager { .shared }
}
