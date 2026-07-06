import SwiftUI
import UIKit

struct SettingsView: View {
    @State private var sheetControl: SheetControl?

    var body: some View {
        Form {
            preferencesSection
            helpAndSupportSection
            legalSection
            shareSection

            versionAndBuildNumberView
        }
        .navigationTitle(Text("Settings", comment: "The title of the Settings screen and on the bottom tab bar. Keep it short."))
        .sheet(item: $sheetControl) { control in
            switch control {
            case let .openUrl(url):
                SFSafariView(url: url).edgesIgnoringSafeArea(.bottom)
            case .shareApp:
                ShareSheetView(activityItems: shareItems)
            }
        }
    }

    private func open(link: String) {
        if let url = URL(string: link) {
            sheetControl = .openUrl(url)
        }
    }
}

// MARK: - Sections

private extension SettingsView {
    // MARK: - Preferences

    var preferencesSection: some View {
        Section(header: Text("Preferences", comment: "Header of the preferences section that contains app settings like language.")) {
            TitleSubtitleRow(systemName: "textformat",
                             title: LocalizedStringResource("Language",
                                                            comment: """
                                                            Title of the language switching row within the Settings screen. Basically
                                                            \"Language\": \"Currently selected language, e.g English\". On the left side you have
                                                            \"Language\" and right side you have the currently selected language, e.g \"English\".
                                                            """),
                             subtitle: Locale.current.localizedString(forLanguageCode: Bundle.main.preferredLocalizations.first ?? ""),
                             showArrow: true)
                .contentShape(Rectangle())
                .onTapGesture {
                    UIApplication.openSystemAppSettings()
                }
        }
    }

    // MARK: - Help & Support

    var helpAndSupportSection: some View {
        Section(header: Text("Help & Support", comment: "Header of the help and support section within the Settings screen.")) {
            NavigationLink(destination: SupportView()) {
                TitleSubtitleRow(systemName: "lifepreserver",
                                 title: LocalizedStringResource("Contact Support", comment: "Title of the contact support row within the Settings screen."))
            }
        }
    }

    // MARK: - Legal

    var legalSection: some View {
        Section(header: Text("Legal", comment: "Header of the legal section containing terms and privacy policy.")) {
            TitleSubtitleRow(systemName: "doc.text",
                             title: LocalizedStringResource("Terms of Use", comment: "Title of the terms of use row within the Settings screen."),
                             showArrow: true)
                .contentShape(Rectangle())
                .onTapGesture {
                    open(link: MainConstants.termsOfServiceLink)
                }

            TitleSubtitleRow(systemName: "lock.doc",
                             title: LocalizedStringResource("Privacy Policy", comment: "Title of the privacy policy row within the Settings screen."),
                             showArrow: true)
                .contentShape(Rectangle())
                .onTapGesture {
                    open(link: MainConstants.privacyPolicyLink)
                }

            TitleSubtitleRow(systemName: "curlybraces.square",
                             title: LocalizedStringResource("Open Source Licences",
                                                            comment: "Title of the row that opens the app settings showing open source licences."),
                             showArrow: true)
                .contentShape(Rectangle())
                .onTapGesture {
                    UIApplication.openSystemAppSettings()
                }
        }
    }

    // MARK: - Share

    var shareItems: [Any] {
        var items: [Any] = [String(localized: .checkOutApp)]
        if let url = URL(string: MainConstants.appStoreLink) {
            items.append(url)
        }
        return items
    }

    var shareSection: some View {
        Section {
            TitleSubtitleRow(systemName: "square.and.arrow.up",
                             title: LocalizedStringResource("Share \(Bundle.displayName ?? "App")", comment: "Title for sharing the app with others."),
                             showArrow: false)
                .foregroundStyle(Color.accentColor)
                .contentShape(Rectangle())
                .onTapGesture {
                    sheetControl = .shareApp
                }
        }
    }

    // MARK: - Version and Build Number

    var versionAndBuildNumberView: some View {
        Section {
            HStack {
                Spacer()
                Text("\(Bundle.version ?? "-") (\(Bundle.build ?? "-"))",
                     comment: "Used to display the version and build number as a string at the bottom of the Settings screen.")
                Spacer()
            }
            .font(.footnote)
            .foregroundStyle(Color.secondary)
            .listRowBackground(Color.clear)
        }
    }
}

// MARK: - SheetControl

private enum SheetControl: Identifiable {
    case openUrl(URL)
    case shareApp

    var id: String {
        switch self {
        case let .openUrl(url):
            return url.absoluteString
        case .shareApp:
            return "shareApp"
        }
    }
}
