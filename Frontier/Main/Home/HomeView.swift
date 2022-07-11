//
//  HomeView.swift
//  Frontier
//
//  Created by Songyee Park on 2022/06/22.
//

import SwiftUI

struct HomeView: View {
    
    @StateObject var launchFetcher = LaunchFetcher()
    
    var body: some View {
        NavigationView {
            self.content
                .navigationTitle("Upcoming")
        }
        .navigationViewStyle(.stack)
    }
    
    @ViewBuilder private var content: some View {
        if launchFetcher.isLoading {
            LaunchLoadingView()
        } else if launchFetcher.errorMessage != nil {
            LaunchErrorView(launchFetcher: launchFetcher)
        } else if launchFetcher.launches.count == 0 {
            LaunchEmptyView(launchFetcher: launchFetcher)
        } else if let latestLaunch = launchFetcher.launches.first {
            ScrollView {
                VStack(spacing: 0) {
                    HomeLaunchView(launch: latestLaunch)
                        .frame(height: 550)
                    LaunchListView(launches: Array(launchFetcher.launches.dropFirst()))
                    footerView
                }
            }.background(Color.mainBackground)
        }
    }
    
    private var footerView: some View {
        Text("Data provided by Launch Library API")
            .font(.footnote)
            .padding(16)
    }

}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        let fetcher = LaunchFetcher()
        Group {
            HomeView(launchFetcher: fetcher)
                .preferredColorScheme(.dark)
                .task {
                    fetcher.isLoading = false
                    fetcher.launches = [Launch.example(), Launch.localJSONExample()]
            }
            HomeView(launchFetcher: fetcher)
                .preferredColorScheme(.dark)
                .previewDevice("iPad (9th generation)")
                .task {
                    fetcher.isLoading = false
                    fetcher.launches = [Launch.example(), Launch.localJSONExample()]
                }
        }
    }
}
