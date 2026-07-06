# Services

Business logic and external integrations, one file (or folder, when split into extensions) per
service. Services expose a clean API for ViewModels to consume — either as caseless-enum static
facades or singletons (`FooService.shared`). Long-lived instances conform to `Sendable` (or
`@unchecked Sendable` with documented internal safety).

Prefer initializer injection for testability (inject a `UserDefaults` suite/key, a path, a
configuration) over mock classes. Register instance-based services in `Utilities/Dependencies.swift`
so ViewModels consume `Dependencies.fooService` instead of instantiating their own.

Bundled:

* `QuickActionsService.swift` — bridges Home Screen Quick Actions (handled in the UIKit scene
  delegate) into the SwiftUI view hierarchy via an `@Observable` singleton.
