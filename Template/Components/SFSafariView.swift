//
//  SFSafariView.swift
//  Template
//
//  Created by Marcel Hoppe on 19.01.22.
//

import SafariServices
import SwiftUI

struct SFSafariView: UIViewControllerRepresentable {
    let url: URL

    func makeUIViewController(context _: UIViewControllerRepresentableContext<SFSafariView>) -> SFSafariViewController {
        let configuration = SFSafariViewController.Configuration()
        configuration.barCollapsingEnabled = false // Added for disabling collapsing tab bar and bottom bar when user scrolls
        return SFSafariViewController(url: url, configuration: configuration)
    }

    func updateUIViewController(_: SFSafariViewController, context _: UIViewControllerRepresentableContext<SFSafariView>) {}
}
