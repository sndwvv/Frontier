//
//  ThemeManager.swift
//  Frontier
//
//  Created by Songyee Park on 2022/07/14.
//

import Foundation
import UIKit

class ThemeManager {
    
    static let shared = ThemeManager()
    
    private init() {}
    
    func handleTheme(darkMode: Bool, system: Bool) {
        guard !system else {
            UIApplication.keyWindow?.overrideUserInterfaceStyle = .unspecified
            return
        }
        UIApplication.keyWindow?.overrideUserInterfaceStyle = darkMode ? .dark : .light
    }
    
}
