//
//  color.swift
//  learningApp
//
//  Created by Lana Alyahya on 28/10/2024.
//
import SwiftUI

// MARK: - Color Extension
extension Color {
    init?(hex: String) {
        var cString = hex.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()
        if cString.hasPrefix("#") {
            cString.remove(at: cString.startIndex)
        }
        if cString.count == 6 {
            var rgb: UInt64 = 0
            Scanner(string: cString).scanHexInt64(&rgb)
            self.init(
                .sRGB,
                red: Double((rgb >> 16) & 0xFF) / 255.0,
                green: Double((rgb >> 8) & 0xFF) / 255.0,
                blue: Double(rgb & 0xFF) / 255.0,
                opacity: 1.0
            )
        } else {
            return nil
        }
    }
}
