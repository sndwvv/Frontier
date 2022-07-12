//
//  HomeView.swift
//  Frontier
//
//  Created by Songyee Park on 2022/06/22.
//

import SwiftUI

struct HomeView: View {
    
    @StateObject var viewModel = HomeLaunchViewModel()
    
    var body: some View {
        NavigationView {
            VStack {
                switch viewModel.state {
                case .loading:
                    LaunchLoadingView()
                case .error(let errorMessage):
                    LaunchErrorView(viewModel: viewModel, errorMessasge: errorMessage)
                case .empty:
                    LaunchEmptyView(viewModel: viewModel)
                case .loaded(let firstLaunch, let launchList):
                    ScrollView {
                        VStack(spacing: 0) {
                            LaunchLargeView(launch: firstLaunch)
                                .frame(height: 550)
                            LaunchListView(launches: launchList)
                            footerView
                        }
                    }
                    .background(Color.mainBackground)
                }
            }
            .navigationTitle("Upcoming")
        }
        .navigationViewStyle(.stack)
    }
    
    private var footerView: some View {
        Text("Data provided by Launch Library API")
            .font(.footnote)
            .padding(16)
    }

}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        let fetcher = HomeLaunchViewModel()
        Group {
            HomeView(viewModel: fetcher)
                .preferredColorScheme(.dark)
                .task {
                }
            HomeView(viewModel: fetcher)
                .preferredColorScheme(.dark)
                .previewDevice("iPad (9th generation)")
                .task {
                }
        }
    }
}
