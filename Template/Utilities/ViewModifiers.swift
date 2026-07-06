import SwiftUI

extension View {
    /// Shows a three dots loading animation. Should only be used on controls, such as `PrimaryButton`.
    ///
    /// Example:
    ///
    ///         PrimaryButton(L10n.awesome, screenState: viewModel.state) {
    ///             print("Do something!")
    ///         }
    ///
    /// - Parameters:
    ///   - screenState: Shows and hides the loading animation based off of the `screenState`.
    func loadingThreeDots(screenState: ScreenState?) -> some View {
        modifier(LoadingThreeDotsModifier(screenState: screenState))
    }

    /// Hide or show the view based on a boolean value.
    ///
    /// Example for visibility:
    ///
    ///     Text("Label")
    ///         .isHidden(true)
    ///
    /// Example for complete removal:
    ///
    ///     Text("Label")
    ///         .isHidden(true, remove: true)
    ///
    /// - Parameters:
    ///   - hidden: Set to `false` to show the view. Set to `true` to hide the view.
    ///   - remove: Boolean value indicating whether or not to remove the view.
    @ViewBuilder func isHidden(_ hidden: Bool, remove: Bool = false) -> some View {
        if hidden {
            if !remove {
                self.hidden()
            }
        } else {
            self
        }
    }
}
