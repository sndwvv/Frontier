//
//  UIApplication+Ext.swift
//  Frontier
//
//  Created by Songyee Park on 2022/07/14.
//

import UIKit

extension UIApplication {
    
    static var keyWindow: UIWindow? {
        return UIApplication
            .shared
            .connectedScenes
            .flatMap { ($0 as? UIWindowScene)?.windows ?? [] }
            .first { $0.isKeyWindow }
    }
    
}
