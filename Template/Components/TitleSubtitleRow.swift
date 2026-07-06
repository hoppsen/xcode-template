import SwiftUI

struct TitleSubtitleRow: View {
    let systemName: String?
    let title: Text
    let subtitle: String?
    let showArrow: Bool
    let imageGradient: [Color]

    init(systemName: String? = nil,
         title: LocalizedStringResource,
         subtitle: String? = nil,
         showArrow: Bool = false,
         imageGradient: [Color] = []) {
        self.systemName = systemName
        self.title = Text(title)
        self.subtitle = subtitle
        self.showArrow = showArrow
        self.imageGradient = imageGradient
    }

    init(systemName: String? = nil,
         verbatimTitle: String,
         subtitle: String? = nil,
         showArrow: Bool = false,
         imageGradient: [Color] = []) {
        self.systemName = systemName
        title = Text(verbatim: verbatimTitle)
        self.subtitle = subtitle
        self.showArrow = showArrow
        self.imageGradient = imageGradient
    }

    var body: some View {
        TitleSubtitleRowWithContent(systemName: systemName,
                                    title: title,
                                    subtitle: subtitle,
                                    imageGradient: imageGradient) {
            if showArrow {
                Spacer()
                    .frame(width: 12)

                ChevronView()
            }
        }
    }
}

struct TitleSubtitleRowWithContent<Content: View>: View {
    let systemName: String?
    let title: Text
    let subtitle: String?
    let imageGradient: [Color]
    @ViewBuilder var content: () -> Content

    init(systemName: String? = nil,
         title: Text,
         subtitle: String? = nil,
         imageGradient: [Color] = [],
         @ViewBuilder content: @escaping () -> Content) {
        self.systemName = systemName
        self.title = title
        self.subtitle = subtitle
        self.imageGradient = imageGradient
        self.content = content
    }

    var body: some View {
        HStack {
            Group {
                if let systemName {
                    Label {
                        title
                    } icon: {
                        if !imageGradient.isEmpty {
                            Image(systemName: systemName)
                                .foregroundStyle(LinearGradient(colors: imageGradient,
                                                                startPoint: .topLeading,
                                                                endPoint: .bottomTrailing))
                        } else {
                            Image(systemName: systemName)
                        }
                    }
                } else {
                    title
                }
            }
            .layoutPriority(1)

            Spacer()

            if let subtitle {
                Text(subtitle)
                    .foregroundStyle(.secondary)
                    .lineLimit(1)
                    .minimumScaleFactor(0.5)
            }

            content()
        }
        .truncationMode(.middle)
    }
}
