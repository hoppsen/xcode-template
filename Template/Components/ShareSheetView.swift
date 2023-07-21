//
//  ShareSheetView.swift
//  Template
//
//  Created by Marcel Hoppe on 21.07.23.
//

import SwiftUI
import UIKit

struct ShareSheetView: UIViewControllerRepresentable {
    typealias Callback = (_ activityType: UIActivity.ActivityType?, _ completed: Bool, _ returnedItems: [Any]?, _ error: Error?) -> Void

    let activityItems: [Any]
    let applicationActivities: [UIActivity]?
    let excludedActivityTypes: [UIActivity.ActivityType]?
    let callback: Callback?

    init(activityItems: [Any],
         applicationActivities: [UIActivity]? = nil,
         excludedActivityTypes: [UIActivity.ActivityType]? = nil,
         callback: Callback? = nil) {
        self.activityItems = activityItems
        self.applicationActivities = applicationActivities
        self.excludedActivityTypes = [.assignToContact, .saveToCameraRoll] + (excludedActivityTypes ?? [])
        self.callback = callback
    }

    func makeUIViewController(context _: Context) -> UIActivityViewController {
        let controller = UIActivityViewController(activityItems: activityItems, applicationActivities: applicationActivities)
        controller.excludedActivityTypes = excludedActivityTypes
        controller.completionWithItemsHandler = callback
        return controller
    }

    func updateUIViewController(_: UIActivityViewController, context _: Context) {
        // nothing to do here
    }
}
