import SwiftUI
import UIKit

/// Home Screen Quick Actions surfaced when the user long-presses the app icon.
///
/// These are lightweight, retention-focused entry points that catch users at the
/// moment they are most likely about to remove the app: a feedback channel so
/// frustrated users vent to us instead of churning silently. Add further cases
/// for app-specific re-engagement hooks.
enum QuickAction: String, CaseIterable {
    case feedback

    /// The `UIApplicationShortcutItem` type identifier, namespaced to the bundle.
    var type: String {
        "\(Bundle.main.bundleIdentifier ?? "app").quickaction.\(rawValue)"
    }

    init?(type: String) {
        guard let match = QuickAction.allCases.first(where: { $0.type == type }) else {
            return nil
        }
        self = match
    }

    private var title: String {
        switch self {
        case .feedback:
            return String(localized: "Send Feedback",
                          comment: "Home Screen Quick Action (app icon long-press) that opens the in-app feedback flow. Keep very short.")
        }
    }

    private var subtitle: String? {
        switch self {
        case .feedback:
            return String(localized: "We read every message", comment: "Subtitle for the 'Send Feedback' Home Screen Quick Action. Keep short.")
        }
    }

    private var systemImageName: String {
        switch self {
        case .feedback:
            return "bubble.left.and.bubble.right.fill"
        }
    }

    var shortcutItem: UIApplicationShortcutItem {
        UIApplicationShortcutItem(type: type,
                                  localizedTitle: title,
                                  localizedSubtitle: subtitle,
                                  icon: UIApplicationShortcutIcon(systemImageName: systemImageName),
                                  userInfo: nil)
    }
}

/// Bridges Home Screen Quick Actions (handled in the UIKit scene delegate) into the
/// SwiftUI view hierarchy.
///
/// The scene delegate stores the triggered action in `pending`; the SwiftUI layer
/// observes it, routes it to the appropriate destination, then clears it.
///
/// `@MainActor`: every access is on the main thread — the UIKit scene/app delegate callbacks that
/// set `pending` and the SwiftUI layer that observes it are both main-actor isolated.
@MainActor
@Observable
final class QuickActionsService {
    static let shared = QuickActionsService()

    /// The action awaiting handling by the SwiftUI layer. Set by the scene delegate,
    /// consumed (set back to `nil`) once the SwiftUI layer has routed it.
    var pending: QuickAction?

    private init() {}

    /// Register the dynamic Home Screen Quick Actions. Call once on launch.
    @MainActor
    func registerShortcutItems() {
        UIApplication.shared.shortcutItems = QuickAction.allCases.map(\.shortcutItem)
    }

    /// Store a triggered shortcut for the SwiftUI layer to consume.
    /// - Returns: `true` if the shortcut maps to a known action.
    @discardableResult
    func handle(_ shortcutItem: UIApplicationShortcutItem) -> Bool {
        guard let action = QuickAction(type: shortcutItem.type) else { return false }
        pending = action
        return true
    }
}
