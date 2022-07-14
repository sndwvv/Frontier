//
//  CardViewModifier.swift
//  Frontier
//
//  Created by Songyee Park on 2022/06/29.
//

import SwiftUI

struct CardViewModifier: ViewModifier {
    
    func body(content: Content) -> some View {
        content
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color.cardBackground)
            .cornerRadius(20)
    }
    
}
