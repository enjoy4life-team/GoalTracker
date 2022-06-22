//
//  UITabBar+DefaultAppearance.swift
//  GoalTracker
//
//  Created by Agus Budianto on 22/06/22.
//

import Foundation
import UIKit
import SwiftUI

extension UITabBarAppearance {
    static var defaultAppearance: UITabBarAppearance {
        let tabBarAppearance = UITabBarAppearance()
        tabBarAppearance.backgroundColor = UIColor(Color(hex: 0xD8D8D8))
        return tabBarAppearance
    }
}
