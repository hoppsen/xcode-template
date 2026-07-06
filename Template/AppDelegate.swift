import UIKit

/// Minimal UIKit app delegate bridged into the SwiftUI life cycle via
/// `@UIApplicationDelegateAdaptor`. Its sole responsibilities are registering the
/// Home Screen Quick Actions and vending a `SceneDelegate` so we can receive the
/// scene-based shortcut callbacks that SwiftUI does not expose natively.
final class AppDelegate: NSObject, UIApplicationDelegate {
    func application(_: UIApplication,
                     didFinishLaunchingWithOptions _: [UIApplication.LaunchOptionsKey: Any]? = nil) -> Bool {
        QuickActionsService.shared.registerShortcutItems()
        return true
    }

    func application(_: UIApplication,
                     configurationForConnecting connectingSceneSession: UISceneSession,
                     options _: UIScene.ConnectionOptions) -> UISceneConfiguration {
        let configuration = UISceneConfiguration(name: nil, sessionRole: connectingSceneSession.role)
        if connectingSceneSession.role == .windowApplication {
            configuration.delegateClass = SceneDelegate.self
        }
        return configuration
    }
}

/// Scene delegate that captures Home Screen Quick Actions and forwards them to
/// `QuickActionsService` for the SwiftUI layer to consume.
///
/// SwiftUI continues to own the window and scene modifiers (`onOpenURL`, `scenePhase`,
/// etc.); this delegate only adds the quick-action callbacks that SwiftUI lacks.
final class SceneDelegate: NSObject, UIWindowSceneDelegate {
    /// App launched from a terminated state via a quick action.
    func scene(_: UIScene,
               willConnectTo _: UISceneSession,
               options connectionOptions: UIScene.ConnectionOptions) {
        if let shortcutItem = connectionOptions.shortcutItem {
            QuickActionsService.shared.handle(shortcutItem)
        }
    }

    /// Quick action triggered while the app is already running (warm launch).
    func windowScene(_: UIWindowScene,
                     performActionFor shortcutItem: UIApplicationShortcutItem,
                     completionHandler: @escaping (Bool) -> Void) {
        completionHandler(QuickActionsService.shared.handle(shortcutItem))
    }
}
