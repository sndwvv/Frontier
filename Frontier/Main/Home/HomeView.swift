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
        VStack(alignment: .center) {
            if launchFetcher.isLoading {
                LaunchListLoadingView()
            } else if launchFetcher.errorMessage != nil {
                LaunchErrorView(launchFetcher: launchFetcher)
            } else {
                LaunchListView(launches: launchFetcher.launches)
            }
        }
        .navigationTitle("Upcoming Launches")
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView(launchFetcher: LaunchFetcher())
    }
}
