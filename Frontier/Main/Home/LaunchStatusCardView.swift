//
//  LaunchStatusCardView.swift
//  Frontier
//
//  Created by Songyee Park on 2022/06/29.
//

import SwiftUI

struct LaunchStatusCardView: View {
    
    let status: LaunchStatus
    
    var body: some View {
        VStack(spacing: 8) {
            
            HStack(alignment: .bottom) {
                Text("Launch Status")
                    .frame(height: 20)
                    .font(.footnote)
                    .foregroundColor(Color.secondaryText)
                    .frame(maxWidth: .infinity, alignment: .topLeading)
                    .padding(.top, 8)
                TagView(text: status.abbrev ?? "")
            }

            Text(status.name ?? "")
                .font(.body)
                .foregroundColor(Color.primaryText)
                .frame(maxWidth: .infinity, alignment: .topLeading)
            
            Text(status.description ?? "")
                .font(.body)
                .foregroundColor(Color.primaryText)
                .frame(maxWidth: .infinity, alignment: .topLeading)
                .padding(.bottom, 16)
        }
        .padding(.horizontal, 16)
        .cardFormat()
    }
}

struct LaunchStatusView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            LaunchStatusCardView(status: Launch.example().status!)
                .previewLayout(.fixed(width: 350, height: 150))
            LaunchStatusCardView(status: Launch.example().status!)
                .preferredColorScheme(.dark)
                .previewLayout(.fixed(width: 350, height: 150))
        }
    }
}
