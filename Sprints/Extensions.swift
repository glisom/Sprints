//
//  Extensions.swift
//  Sprints
//
//  Created by Grant Isom on 11/18/23.
//

import SwiftData
import SwiftUI
import UIKit

extension Color {
    var hex: UInt {
        let components = self.cgColor?.components
        let r = components?[0] ?? 0
        let g = components?[1] ?? 0
        let b = components?[2] ?? 0

        let red = UInt(r * 255) << 16
        let green = UInt(g * 255) << 08
        let blue = UInt(b * 255)

        return red | green | blue
    }

    init(hex: UInt, alpha: Double = 1) {
        self.init(
            .sRGB,
            red: Double((hex >> 16) & 0xff) / 255,
            green: Double((hex >> 08) & 0xff) / 255,
            blue: Double((hex >> 00) & 0xff) / 255,
            opacity: alpha
        )
    }
}
