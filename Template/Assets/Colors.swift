//
//  Colors.swift
//  Template
//
// Created by Marcel Hoppe on 21.07.23.
//

import SwiftUI
#if os(macOS)
    import AppKit
#elseif os(iOS)
    import UIKit
#endif

// MARK: - Styleguide

extension UIColor {
    static func dynamicColor(light: Color, dark: Color) -> UIColor {
        UIColor { $0.userInterfaceStyle == .dark ? UIColor(dark) : UIColor(light) }
    }
}

extension Color {
    // MARK: Random

    /// Setting a random background color is a great way to detect an accidental SwiftUI loop.
    /// Usage `.background(Color.random)`
    static var random: Color {
        // Source: https://twitter.com/steipete/status/1379483193708052480
        Color(red: .random(in: 0 ... 1), green: .random(in: 0 ... 1), blue: .random(in: 0 ... 1))
    }

    // MARK: - Mapping of old UIColor names

    // Source (modified): https://github.com/hoppsen/uicolors

    // Before using the mappings, try to use the intended colors instead!
    static let systemRed = Color.red
    static let systemGreen = Color.green
    static let systemBlue = Color.blue
    static let systemOrange = Color.orange
    static let systemYellow = Color.yellow
    static let systemPink = Color.pink
    static let systemPurple = Color.purple
    @available(iOS 15.0, *)
    static let systemTeal = Color.teal
    @available(iOS 15.0, *)
    static let systemIndigo = Color.indigo
    @available(iOS 15.0, *)
    static let systemBrown = Color.brown
    @available(iOS 15.0, *)
    static let systemMint = Color.mint
    @available(iOS 15.0, *)
    static let systemCyan = Color.cyan

    // MARK: Shades of Gray

    /* The numbered variations, systemGray2 through systemGray6, are grays which increasingly
     * trend away from systemGray and in the direction of systemBackgroundColor.
     *
     * In UIUserInterfaceStyleLight: systemGray1 is slightly lighter than systemGray.
     *                               systemGray2 is lighter than that, and so on.
     * In UIUserInterfaceStyleDark:  systemGray1 is slightly darker than systemGray.
     *                               systemGray2 is darker than that, and so on.
     */
    static let systemGray = Color(.systemGray)
    static let systemGray2 = Color(.systemGray2)
    static let systemGray3 = Color(.systemGray3)
    static let systemGray4 = Color(.systemGray4)
    static let systemGray5 = Color(.systemGray5)
    static let systemGray6 = Color(.systemGray6)

    // MARK: Dynamic System Colors

    /* Foreground colors for static text and related elements.
     */
    // static let label = Color.primary // Use Color.primary directly
    // static let secondaryLabel = Color.secondary // Use Color.secondary directly
    static let tertiaryLabel = Color(.tertiaryLabel)
    static let quaternaryLabel = Color(.quaternaryLabel)

    /* Foreground color for standard system links.
     */
    static let link = Color(.link)

    /* Foreground color for placeholder text in controls or text fields or text views.
     */
    static let placeholderText = Color(.placeholderText)

    // MARK: Separators

    /* Foreground colors for separators (thin border or divider lines).
     * `separatorColor` may be partially transparent, so it can go on top of any content.
     * `opaqueSeparatorColor` is intended to look similar, but is guaranteed to be opaque, so it will
     * completely cover anything behind it. Depending on the situation, you may need one or the other.
     */
    static let separator = Color(.separator)
    static let opaqueSeparator = Color(.opaqueSeparator)

    // MARK: Background

    /* We provide two design systems (also known as "stacks") for structuring an iOS app's backgrounds.
     *
     * Each stack has three "levels" of background colors. The first color is intended to be the
     * main background, farthest back. Secondary and tertiary colors are layered on top
     * of the main background, when appropriate.
     *
     * Inside of a discrete piece of UI, choose a stack, then use colors from that stack.
     * We do not recommend mixing and matching background colors between stacks.
     * The foreground colors above are designed to work in both stacks.
     *
     * 1. systemBackground
     *    Use this stack for views with standard table views, and designs which have a white
     *    primary background in light mode.
     */
    static let systemBackground = Color(.systemBackground)
    static let secondarySystemBackground = Color(.secondarySystemBackground)
    static let tertiarySystemBackground = Color(.tertiarySystemBackground)

    /* 2. systemGroupedBackground
     *    Use this stack for views with grouped content, such as grouped tables and
     *    platter-based designs. These are like grouped table views, but you may use these
     *    colors in places where a table view wouldn't make sense.
     */
    static let systemGroupedBackground = Color(.systemGroupedBackground)
    static let secondarySystemGroupedBackground = Color(.secondarySystemGroupedBackground)
    static let tertiarySystemGroupedBackground = Color(.tertiarySystemGroupedBackground)

    // MARK: Fill Colors

    /* Fill colors for UI elements.
     * These are meant to be used over the background colors, since their alpha component is less than 1.
     *
     * systemFillColor is appropriate for filling thin and small shapes.
     * Example: The track of a slider.
     */
    static let systemFill = Color(.systemFill)

    /* secondarySystemFillColor is appropriate for filling medium-size shapes.
     * Example: The background of a switch.
     */
    static let secondarySystemFill = Color(.secondarySystemFill)

    /* tertiarySystemFillColor is appropriate for filling large shapes.
     * Examples: Input fields, search bars, buttons.
     */
    static let tertiarySystemFill = Color(.tertiarySystemFill)

    /* quaternarySystemFillColor is appropriate for filling large areas containing complex content.
     * Example: Expanded table cells.
     */
    static let quaternarySystemFill = Color(.quaternarySystemFill)

    // MARK: Text colors

    /* lightTextColor is always light, and darkTextColor is always dark, regardless of the current UIUserInterfaceStyle.
     * When possible, we recommend using `labelColor` and its variants, instead.
     */
    static let lightText = Color(.lightText)
    static let darkText = Color(.darkText)
}
