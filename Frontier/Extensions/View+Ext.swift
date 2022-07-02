//
//  View+Extension.swift
//  Frontier
//
//  Created by Songyee Park on 2022/06/29.
//

import Foundation
import SwiftUI

extension View {
    
    func cardFormat() -> some View {
        modifier(CardViewModifier())
    }
    
    func cornerRadius(_ radius: CGFloat, corners: UIRectCorner) -> some View {
        clipShape( RoundedCorner(radius: radius, corners: corners) )
    }
    
}
