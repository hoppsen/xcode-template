//
//  SettingsRow.swift
//  Template
//
//  Created by Marcel Hoppe on 21.07.23.
//

import SwiftUI

struct SettingsRow: View {
    let systemName: String?
    let title: String
    let subtitle: String?
    let showArrow: Bool

    init(systemName: String? = nil, title: String, subtitle: String? = nil, showArrow: Bool = false) {
        self.systemName = systemName
        self.title = title
        self.subtitle = subtitle
        self.showArrow = showArrow
    }

    var body: some View {
        HStack(alignment: .firstTextBaseline) {
            if let systemName = systemName {
                Label(title, systemImage: systemName)
            } else {
                Text(title)
            }

            Spacer()

            if let subtitle = subtitle {
                Text(subtitle)
                    .foregroundColor(.secondary)
            }

            if showArrow {
                Spacer()
                    .frame(width: 12)

                ChevronView()
            }
        }
    }
}

struct SettingsRow_Previews: PreviewProvider {
    static var previews: some View {
        Form {
            SettingsRow(title: "Preview")
            SettingsRow(title: "Preview", showArrow: true)
            SettingsRow(title: "Preview", subtitle: "Preview")
            SettingsRow(title: "Preview", subtitle: "Preview", showArrow: true)
            SettingsRow(systemName: "globe", title: "Preview", subtitle: "Preview")
            SettingsRow(systemName: "globe", title: "Preview", subtitle: "Preview", showArrow: true)
        }
    }
}
