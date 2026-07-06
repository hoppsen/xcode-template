import SwiftUI

private struct LoadingDotView: View {
    let delay: Double
    @State private var scale: CGFloat = 0.35

    var body: some View {
        Circle()
            .scaleEffect(scale)
            .animation(Animation.easeInOut(duration: 0.6).repeatForever().delay(delay), value: scale)
            .onAppear {
                withAnimation {
                    scale = 0.7
                }
            }
    }
}

// MARK: - ViewModifier

struct LoadingThreeDotsModifier: ViewModifier {
    let screenState: ScreenState?

    func body(content: Content) -> some View {
        // Added via ZStack to keep the height based of the content
        ZStack {
            content
                .isHidden(screenState?.isLoading ?? false)

            if let screenState = screenState, screenState.isLoading {
                HStack {
                    LoadingDotView(delay: 0)
                    LoadingDotView(delay: 0.2)
                    LoadingDotView(delay: 0.4)
                }
                .frame(maxWidth: 50, maxHeight: 17)
            }
        }
    }
}
