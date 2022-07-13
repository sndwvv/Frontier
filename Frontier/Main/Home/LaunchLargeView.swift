//
//  LaunchLargeView.swift
//  Frontier
//
//  Created by Songyee Park on 2022/06/24.
//

import SwiftUI

struct LaunchLargeView: View {
    
    let launch: Launch

    var body: some View {
        VStack(spacing: 4) {
            imageAndTitleHeaderView
            countdownView
            statusView
            Spacer()
        }
    }
    
    private var imageAndTitleHeaderView: some View {
        ZStack(alignment: .bottomLeading) {
            if let imageUrl = launch.image {
                ImageLoadingView(url: imageUrl)
                    .frame(minWidth: 350, maxWidth: .infinity, minHeight: 100, maxHeight: .infinity, alignment: .center)
                    .clipped()
                    .cornerRadius(10)
                Text(launch.name ?? "")
                    .foregroundColor(Color.white)
                    .font(.title).bold()
                    .multilineTextAlignment(.center)
                    .padding(8)
                    .frame(maxWidth: .infinity, maxHeight: 100, alignment: .bottom)
                    .background(
                        LinearGradient(gradient: Gradient(colors: [.clear, .black]), startPoint: .top, endPoint: .bottom)
                            .cornerRadius(10)
                    )
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
        .padding()
        .clipped()
    }
    
    private var countdownView: some View {
        LaunchCountdownView(launchDate: launch.net ?? Date().ISO8601Format())
            .frame(maxWidth: 300)
            .frame(height: 80)
    }
    
    private var statusView: some View {
        Text(launch.status?.name ?? "")
            .font(.headline)
            .foregroundColor(Color.primaryText)
            .frame(minWidth: 350, maxWidth: .infinity)
            .padding()
    }
    
}

struct LaunchLargeView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            LaunchLargeView(launch: Launch.example())
                .previewDevice("iPhone 12")
            LaunchLargeView(launch: Launch.example())
                .previewDevice("iPad (9th generation)")
            LaunchLargeView(launch: Launch.example())
                .previewDevice("iPhone SE (3rd generation)")
        }
    }
}
