import UIKit

extension String {
    /// Copies the string to the system pasteboard, with a light haptic as confirmation.
    @MainActor
    func copyToPasteboard(feedback: Bool = true) {
        UIPasteboard.general.string = self

        if feedback {
            let impact = UIImpactFeedbackGenerator(style: .light)
            impact.impactOccurred()
        }
    }
}
