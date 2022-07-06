//
//  TagView.swift
//  Frontier
//
//  Created by Songyee Park on 2022/06/28.
//

import SwiftUI

struct TagView: View {
    
    let text: String
    let backgroundColor: Color
    
    var body: some View {
        HStack {
            Text(text)
        }
        .padding(.horizontal, 6)
        .padding(.vertical, 2)
        .background(backgroundColor)
        .foregroundColor(.white)
        .cornerRadius(6)
        .font(.system(size: 12).bold())
    }
}

struct TagView_Previews: PreviewProvider {
    static var previews: some View {
        TagView(text: "Test Text", backgroundColor: .blue)
            .previewLayout(.sizeThatFits)
    }
}
