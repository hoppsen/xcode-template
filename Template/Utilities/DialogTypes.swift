import SwiftUI

// MARK: - Alert Types

/// Central definition of every alert the app can present.
///
/// ViewModels expose `var alert: AlertType?` and views attach `.alert($viewModel.alert)`.
/// Add one case per alert, carrying its actions as associated closures.
enum AlertType: Identifiable {
    case error(message: LocalizedStringResource)

    var id: String {
        switch self {
        case .error: return "error"
        }
    }
}

extension View {
    func alert(_ alert: Binding<AlertType?>) -> some View {
        self.alert(alertTitle(alert.wrappedValue),
                   isPresented: Binding(get: { alert.wrappedValue != nil },
                                        set: { if !$0 { alert.wrappedValue = nil } })) {
            switch alert.wrappedValue {
            case .error:
                Button(role: .cancel) {} label: {
                    Text(.ok)
                }
            case .none:
                EmptyView()
            }
        } message: {
            switch alert.wrappedValue {
            case let .error(message):
                Text(message)
            case .none:
                EmptyView()
            }
        }
    }

    private func alertTitle(_ type: AlertType?) -> String {
        switch type {
        case .error:
            return String(localized: "Error", comment: """
            Generic alert title for error conditions.
            Keep brief.
            """)
        case .none:
            return ""
        }
    }
}
