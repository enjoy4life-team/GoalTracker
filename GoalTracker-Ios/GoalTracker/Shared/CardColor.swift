//
//  CardColor.swift
//  GoalTracker
//
//  Created by Agus Budianto on 20/07/22.
//

import Foundation
import SwiftUI


extension Color {
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


func chooseColor(goalName: String) -> Color {
    let communicationString = "Communication"
    let collaborationString = "Collaboration"
    let presentationString = "Presentation"
    
    switch goalName {
    case communicationString:
        return Color(hex: 0xFF453A)
    case collaborationString:
        return Color(hex: 0x63E6E2)
    case presentationString:
        return Color(hex: 0xBF5AF2)
    default:
        return .black
    }
}


func chooseColorIos(goalName: String) -> Color {
    let communicationString = "Communication"
    let collaborationString = "Collaboration"
    let presentationString = "Presentation"
    
    switch goalName {
    case communicationString:
        return Color(hex: 0xDD261C)
    case collaborationString:
        return Color(hex: 0x00A39B)
    case presentationString:
        return Color(hex: 0xA54BD2)
    default:
        return .black
    }
}
