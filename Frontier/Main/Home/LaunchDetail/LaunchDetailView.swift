//
//  LaunchDetailView.swift
//  Frontier
//
//  Created by Songyee Park on 2022/06/24.
//

import SwiftUI

struct LaunchDetailView: View {
    
    @StateObject var detailFetcher: LaunchDetailFetcher
    
    var body: some View {
        ScrollView {
            headerView
            cardViews
                .padding(.horizontal, 16)
        }
        .background(Color.mainBackground)
        .task {
            detailFetcher.fetchLaunchDetail()
        }
    }
    
    private var headerView: some View {
        VStack {
            ZStack(alignment: .bottom) {
                if let imageUri = detailFetcher.launchDetail?.image {
                    StretchyHeaderImageView(urlString: imageUri)
                }
                Text(detailFetcher.launchDetail?.name ?? "NA")
                    .font(.title).bold()
                    .foregroundColor(Color.primaryText)
                    .frame(maxWidth: .infinity)
                    .padding(.top, 24)
                    .padding(.horizontal, 16)
                    .background(Color.mainBackground)
                    .cornerRadius(20, corners: [.topLeft, .topRight])
            }
        }
    }
    
    private var cardViews: some View {
        VStack(spacing: 16) {
            if let launchDate = detailFetcher.launchDetail?.net {
                LaunchCountdownView(launchDate: launchDate)
                    .frame(maxWidth: 300)
                    .frame(height: 80)
            }
            if let launchStatus = detailFetcher.launchDetail?.status {
                LaunchStatusCardView(status: launchStatus)
            }
            if let mission = detailFetcher.launchDetail?.mission {
                LaunchMissionCardView(mission: mission)
            }
            HStack(spacing: 4) {
                if let rocket = detailFetcher.launchDetail?.rocket {
                    LaunchRocketCardView(rocket: rocket)
                }
                Spacer()
                if let service = detailFetcher.launchDetail?.launchServiceProvider {
                    LaunchServiceCardView(service: service)
                }
            }
            .frame(minHeight: 120)
            
            if let pad = detailFetcher.launchDetail?.pad {
                LaunchPadCardView(pad: pad)
            }
        }
    }
    
}

struct LaunchDetailView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            LaunchDetailView(detailFetcher: LaunchDetailFetcher(launch: Launch.localJSONExample()))
                .previewDevice("iPhone 12")
                .onAppear {
                    //
                }
            LaunchDetailView(detailFetcher: LaunchDetailFetcher(launch: Launch.localJSONExample()))
                .previewDevice("iPad (9th generation)")
                .preferredColorScheme(.dark)
                .onAppear {
                    //
                }
        }
    }
}
