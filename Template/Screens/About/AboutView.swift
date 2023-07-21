//
//  AboutView.swift
//  Template
//
//  Created by Marcel Hoppe on 21.07.23.
//

import SwiftUI

struct AboutView: View {
    @StateObject var viewModel = AboutViewModel()

    var body: some View {
        Form {
            Section {
                appIconView
            }
            .listRowBackground(Color.clear)

            Section {
                SettingsRow(title: "Website", subtitle: URL.website?.host, showArrow: true)
                    .contentShape(Rectangle())
                    .onTapGesture {
                        URL.website?.open()
                    }

                SettingsRow(title: "Twitter", subtitle: "@\(MainConstants.twitterUsername)", showArrow: true)
                    .contentShape(Rectangle())
                    .onTapGesture {
                        viewModel.openTwitter()
                    }
            }

            Section {
                SettingsRow(title: "Open Source Licences", showArrow: true)
                    .contentShape(Rectangle())
                    .onTapGesture {
                        UIApplication.openSystemSettings()
                    }

                SettingsRow(title: "Terms of Use", showArrow: true)
                    .contentShape(Rectangle())
                    .onTapGesture {
                        viewModel.activeSheet = .termsOfUse
                    }

                SettingsRow(title: "Privacy Policy", showArrow: true)
                    .contentShape(Rectangle())
                    .onTapGesture {
                        viewModel.activeSheet = .privacyPolicy
                    }
            }

            Section {
                SettingsRow(title: "Share Template", showArrow: true)
                    .foregroundColor(.accentColor)
                    .contentShape(Rectangle())
                    .onTapGesture {
                        viewModel.activeSheet = .shareSheet
                    }
            }
        }
        .navigationTitle("About")
        .navigationBarTitleDisplayMode(.inline)
        .sheet(item: $viewModel.activeSheet) { item in
            switch item {
            case .termsOfUse:
                if let url = URL.termsOfUse {
                    SFSafariView(url: url).edgesIgnoringSafeArea(.bottom)
                }
            case .privacyPolicy:
                if let url = URL.privacyPolicy {
                    SFSafariView(url: url).edgesIgnoringSafeArea(.bottom)
                }
            case .shareSheet:
                shareSheet
            }
        }
    }

    var shareSheet: some View {
        ShareSheetView(activityItems: ["Check out Template\n\n\(MainConstants.appStoreLink)"]) { _, completed, _, _ in
            guard completed else {
                return
            }
            viewModel.activeSheet = nil
        }
    }

    var appIconView: some View {
        HStack {
            Spacer()
            VStack {
                ZStack {
                    RoundedRectangle(cornerRadius: 16)
                        .frame(width: 100, height: 100)
                        .foregroundColor(.purple)
                    Image(systemName: "doc.on.doc.fill")
                        .resizable()
                        .padding()
                        .aspectRatio(contentMode: .fit)
                        .frame(height: 80)
                        .foregroundColor(.white)
                }
                Text("Template 1.0.0 (0)")
                    .fontWeight(.semibold)
                    .foregroundColor(.primary)
            }
            Spacer()
        }
    }
}

struct AboutView_Previews: PreviewProvider {
    static var previews: some View {
        AboutView()
    }
}
