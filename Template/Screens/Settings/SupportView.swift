import MessageUI
import SwiftUI

struct SupportView: View {
    let version: String = Bundle.version ?? "-"
    let build: String = Bundle.build ?? "-"

    @State private var isShowingMailView = false
    @State private var isMailUnavailableAlert = false

    var body: some View {
        Form {
            Section(header: Text("Information", comment: "Section header for various information in the settings."),
                    footer: Text("Tap the cell to copy the value",
                                 comment: "Footer of the Version row. Tells the user to tap the row to copy the value.")) {
                TitleSubtitleRow(title: .init("Version", comment: "App version label, displayed in settings."), subtitle: "\(version) (\(build))")
                    .contentShape(Rectangle())
                    .onTapGesture {
                        "\(version) (\(build))".copyToPasteboard()
                    }
            }

            Section {
                Button(action: openMailComposer) {
                    HStack {
                        Image(systemName: "envelope")
                        Text("Contact Support", comment: "Button label that when pressed attempts to open Mail in order to get help.")
                    }
                }
                .alert(isPresented: $isMailUnavailableAlert) {
                    Alert(title: Text("Mail Not Configured", comment: "Title of an alert indicating that the mail app is not configured."),
                          message: Text("Mail is required for sending emails.\n\nPlease set up a Mail account on your device to continue.",
                                        comment: "Message to show when the user tries to send an email but \"Mail\" is not configured"),
                          dismissButton: .default(Text(.ok)))
                }
            }
        }
        .navigationTitle(Text("Support", comment: "The title of the Support screen. Keep it short."))
        .sheet(isPresented: $isShowingMailView) {
            // Not localized as we want the communication to be in English
            MailComposeView(recipients: [MainConstants.supportEmail],
                            subject: "Support Request for \(Bundle.displayName ?? "App") \(version) (\(build))",
                            messageBody: """


                            _________________________________________
                            Please write your message above this line

                            Version: \(version) (\(build))
                            """)
        }
    }

    private func openMailComposer() {
        if MFMailComposeViewController.canSendMail() {
            isShowingMailView = true
        } else {
            isMailUnavailableAlert = true
        }
    }
}
