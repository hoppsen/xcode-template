import SwiftUI

struct StarsView: View {
    var count: Int = 5
    var font: Font = .largeTitle
    var spacing: CGFloat = 8

    var body: some View {
        HStack(spacing: spacing) {
            ForEach(0 ..< count, id: \.self) { _ in
                Image(systemName: "star.fill")
                    .font(font)
                    .foregroundColor(.yellow)
            }
        }
        .dynamicTypeSize(...DynamicTypeSize.accessibility2)
    }
}
