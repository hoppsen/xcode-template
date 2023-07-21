//
//  ChevronView.swift
//  Template
//
//  Created by Marcel Hoppe on 21.07.23.
//

import SwiftUI

struct ChevronView: View {
    @ScaledMetric var chevronWidth: CGFloat = 7
    @ScaledMetric var chevronHeight: CGFloat = 12

    var body: some View {
        Image(systemName: "chevron.forward")
            .resizable()
            .frame(width: chevronWidth, height: chevronHeight)
            .font(.headline)
            .foregroundColor(.tertiaryLabel)
    }
}
