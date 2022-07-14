//
//  LaunchRowView.swift
//  Frontier
//
//  Created by Songyee Park on 2022/06/27.
//

import SwiftUI

struct LaunchRowView: View {
    
    let launch: Launch
    
    var body: some View {
        HStack {
            imageView
            launchItemLabels
        }
        .frame(height: imageHeight)
    }
    
    var imageHeight: CGFloat = 100
    
    // MARK: Subviews
    
    private var imageView: some View {
        ImageLoadingView(url: launch.image ?? "")
            .frame(width: imageHeight, height: imageHeight, alignment: .center)
            .cornerRadius(10)
            .clipped()
    }
    
    private var launchItemLabels: some View {
        VStack(spacing: 8) {
            Text(launch.name ?? "")
                .font(.headline)
                .foregroundColor(.primaryText)
                .multilineTextAlignment(.leading)
                .frame(maxWidth: .infinity, alignment: .topLeading)
                .lineLimit(2)
            if let launchTime = launch.net {
                Text(launchTime.readableFormat())
                    .font(.footnote)
                    .foregroundColor(.secondaryText)
                    .frame(maxWidth: .infinity, alignment: .topLeading)
            }
            if let webcastLive = launch.webcastLive, webcastLive {
                TagView(text: "LIVE", backgroundColor: .red)
                    .frame(maxWidth: .infinity, alignment: .topLeading)
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .padding(.trailing, 8)
    }
    
}

struct LaunchRowView_Previews: PreviewProvider {
    static var previews: some View {
        LaunchRowView(launch: Launch.example())
            .previewLayout(.fixed(width: 375, height: 100))
    }
}
