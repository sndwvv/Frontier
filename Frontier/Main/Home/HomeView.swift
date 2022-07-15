//
//  HomeView.swift
//  Frontier
//
//  Created by Songyee Park on 2022/06/22.
//

import SwiftUI

struct HomeView: View {
    
    @StateObject var launchFetcher = HomeLaunchFetcher()
    
    var body: some View {
        NavigationView {
            VStack {
                switch launchFetcher.state {
                case .loading:
                    LaunchLoadingView()
                case .error(let errorMessage):
                    LaunchErrorView(launchFetcher: launchFetcher, errorMessasge: errorMessage)
                case .empty:
                    LaunchEmptyView(launchFetcher: launchFetcher)
                case .loaded(let firstLaunch, let launchList):
                    HomeLaunchListView(firstLaunch: firstLaunch, launchList: launchList)
                }
            }
            .navigationTitle("Upcoming")
         }
        .task {
            launchFetcher.load()
        }
        .navigationViewStyle(.stack)
    }

}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        let launchFetcher = HomeLaunchFetcher()
        Group {
            HomeView(launchFetcher: launchFetcher)
                .preferredColorScheme(.light)
                .previewDevice("iPhone 12")
                .task {
                    launchFetcher.loadMock()
                }
            /*
            HomeView(launchFetcher: launchFetcher)
                .preferredColorScheme(.light)
                .previewDevice("iPhone 13 mini")
                .task {
                    launchFetcher.state = .empty
                }
            HomeView(launchFetcher: launchFetcher)
                .preferredColorScheme(.dark)
                .previewDevice("iPhone SE (3rd generation)")
                .task {
                    launchFetcher.state = .error(APIError.badURL.localizedDescription)
                }
             */
        }
    }
}
