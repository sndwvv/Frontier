//
//  UIApplication+Ext.swift
//  Frontier
//
//  Created by Songyee Park on 2022/07/14.
//

import UIKit

extension UIApplication {
    static var keyWindow: UIWindow? {
        return UIApplication.shared.connectedScenes
            .filter { $0.activationState == .foregroundActive }
            .first(where: { $0 is UIWindowScene })
            .flatMap( { $0 as? UIWindowScene })?.windows
            .first(where: \.isKeyWindow)
        
    }
}
