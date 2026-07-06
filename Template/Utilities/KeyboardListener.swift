import Combine
import UIKit

class KeyboardListener {
    static var keyboardPublisher: AnyPublisher<(isShowing: Bool, height: CGFloat), Never> {
        let keyboardWillShowNotificationPublisher = NotificationCenter.default
            .publisher(for: UIResponder.keyboardWillShowNotification)
            .compactMap { $0.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue }
            .map { (true, $0.cgRectValue.height) }
        let keyboardWillHideNotification = NotificationCenter.default
            .publisher(for: UIResponder.keyboardWillHideNotification)
            .map { _ in (false, 0 as CGFloat) }
        return keyboardWillShowNotificationPublisher.merge(with: keyboardWillHideNotification)
            .map { (isShowing: $0.0, height: $0.1) }
            .eraseToAnyPublisher()
    }
}
