import SwiftUI
import TipKit

@main
struct TemplateApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) private var appDelegate

    @State private var quickActions = QuickActionsService.shared
    @State private var isShowingFeedback = false

    init() {
        try? Tips.configure([.displayFrequency(.immediate)])
    }

    var body: some Scene {
        WindowGroup {
            NavigationStack {
                SettingsView()
            }
            .task {
                // A quick action captured during a cold launch (before the UI appeared) is
                // stored by the scene delegate; replay it now that the scene is on screen.
                if quickActions.pending != nil {
                    handleQuickAction(quickActions.pending)
                }
            }
            // Home Screen Quick Actions (app icon long-press) for warm launches.
            .onChange(of: quickActions.pending) { _, action in
                handleQuickAction(action)
            }
            .sheet(isPresented: $isShowingFeedback) {
                NavigationStack {
                    SupportView()
                        .toolbar {
                            ToolbarItem(placement: .topBarTrailing) {
                                Button {
                                    isShowingFeedback = false
                                } label: {
                                    Text("Done", comment: "Button to dismiss the feedback/support sheet.")
                                }
                            }
                        }
                }
            }
        }
    }

    /// Route a Home Screen Quick Action (long-press app icon) to its in-app destination,
    /// then consume it so it is not handled twice.
    private func handleQuickAction(_ action: QuickAction?) {
        guard let action else { return }

        switch action {
        case .feedback:
            quickActions.pending = nil
            isShowingFeedback = true
        }
    }
}
