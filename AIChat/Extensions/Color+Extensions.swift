//
//  Color+Extensions.swift
//  AIChat
//
//  Created by Jansen Ducusin on 12/12/25.
//

import SwiftUI
import UIKit

extension Color {

    // MARK: - HEX STRING ➜ COLOR
    init?(hex: String) {
        var cleaned = hex.trimmingCharacters(in: .whitespacesAndNewlines)
            .uppercased()

        if cleaned.hasPrefix("#") {
            cleaned.removeFirst()
        }

        // Must be 6 or 8 characters
        guard cleaned.count == 6 || cleaned.count == 8 else { return nil }

        var rgbValue: UInt64 = 0
        Scanner(string: cleaned).scanHexInt64(&rgbValue)

        let colorRed, colorGreen, colorBlue, colorAlpha: Double

        if cleaned.count == 6 {
            colorRed = Double((rgbValue & 0xFF0000) >> 16) / 255
            colorGreen = Double((rgbValue & 0x00FF00) >> 8) / 255
            colorBlue = Double(rgbValue & 0x0000FF) / 255
            colorAlpha = 1.0
        } else {
            colorRed = Double((rgbValue & 0xFF000000) >> 24) / 255
            colorGreen = Double((rgbValue & 0x00FF0000) >> 16) / 255
            colorBlue = Double((rgbValue & 0x0000FF00) >> 8) / 255
            colorAlpha = Double(rgbValue & 0x000000FF) / 255
        }

        self.init(.sRGB, red: colorRed, green: colorGreen, blue: colorBlue, opacity: colorAlpha)
    }

    // MARK: - COLOR ➜ HEX STRING
    func toHex(includeAlpha: Bool = false) -> String? {
        let uiColor = UIColor(self)

        var colorRed: CGFloat = 0
        var colorGreen: CGFloat = 0
        var colorBlue: CGFloat = 0
        var colorAlpha: CGFloat = 0

        guard uiColor.getRed(&colorRed, green: &colorGreen, blue: &colorBlue, alpha: &colorAlpha)
        else { return nil }

        if includeAlpha {
            return String(
                format: "#%02lX%02lX%02lX%02lX",
                lroundf(Float(colorRed * 255)),
                lroundf(Float(colorGreen * 255)),
                lroundf(Float(colorBlue * 255)),
                lroundf(Float(colorAlpha * 255))
            )
        } else {
            return String(
                format: "#%02lX%02lX%02lX",
                lroundf(Float(colorRed * 255)),
                lroundf(Float(colorGreen * 255)),
                lroundf(Float(colorBlue * 255))
            )
        }
    }
}
