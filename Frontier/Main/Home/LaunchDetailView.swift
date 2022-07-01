//
//  LaunchDetailView.swift
//  Frontier
//
//  Created by Songyee Park on 2022/06/24.
//

import SwiftUI

struct LaunchDetailView: View {
    
    let launch: Launch
    
    var body: some View {
        ScrollView {
            VStack {
                ZStack(alignment: .bottom) {
                    if let imageUri = launch.image {
                        StretchyHeaderImageView(urlString: imageUri)
                    }
                    Text(launch.name ?? "NA")
                        .font(.title).bold()
                        .foregroundColor(Color.primaryText)
                        .frame(maxWidth: .infinity)
                        .padding(.top, 24)
                        .padding(.horizontal, 16)
                        .background(Color.mainBackground)
                        .cornerRadius(20, corners: [.topLeft, .topRight])
                }
            }
            
            VStack(spacing: 16) {
                if let launchDate = launch.net {
                    LaunchCountdownView(launchDate: launchDate)
                        .frame(maxWidth: 300)
                        .frame(height: 80)
                }
                if let launchStatus = launch.status {
                    LaunchStatusCardView(status: launchStatus)
                }
                if let mission = launch.mission {
                    LaunchMissionCardView(mission: mission)
                }
                HStack(spacing: 4) {
                    if let rocket = launch.rocket {
                        LaunchRocketCardView(rocket: rocket)
                    }
                    Spacer()
                    if let service = launch.launchServiceProvider {
                        LaunchServiceCardView(service: service)
                    }
                }
                .frame(minHeight: 120)
                
                if let pad = launch.pad {
                    LaunchPadCardView(pad: pad)
                }
            }
            .padding(.horizontal, 16)
        }
        .background(Color.mainBackground)
    }
}

struct LaunchDetailView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            LaunchDetailView(launch: Launch.example())
                .previewDevice("iPhone 12")
            LaunchDetailView(launch: Launch.example())
                .previewDevice("iPad (9th generation)")
                .preferredColorScheme(.dark)
        }
    }
}
