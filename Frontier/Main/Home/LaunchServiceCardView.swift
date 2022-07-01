//
//  LaunchServiceCardView.swift
//  Frontier
//
//  Created by Songyee Park on 2022/06/28.
//

import SwiftUI

struct LaunchServiceCardView: View {
    
    let service: LaunchServiceProvider
    
    var body: some View {
        VStack(spacing: 8) {
            Text("Service")
                .frame(height: 20)
                .font(.footnote)
                .foregroundColor(Color.secondaryText)
                .frame(maxWidth: .infinity, alignment: .topLeading)
                .padding(EdgeInsets(top: 8, leading: 16, bottom: 0, trailing: 16))
            Text(service.name ?? "")
                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
                .font(.body)
                .foregroundColor(Color.primaryText)
                .padding(EdgeInsets(top: 0, leading: 16, bottom: 8, trailing: 16))
        }
        .cardFormat()
    }
}

struct LaunchServiceCardView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            LaunchServiceCardView(service: Launch.example().launchServiceProvider!)
                .preferredColorScheme(.light)
                .previewLayout(.fixed(width: 200, height: 120))
            LaunchServiceCardView(service: Launch.example().launchServiceProvider!)
                .preferredColorScheme(.dark)
                .previewLayout(.fixed(width: 200, height: 120))
        }
    }
}
