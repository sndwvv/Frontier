//
//  HomeView.swift
//  Frontier
//
//  Created by Songyee Park on 2022/06/22.
//

import SwiftUI

struct HomeView: View {
    
    @StateObject var viewModel = HomeViewModel()
    
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
                    HomeLaunchListView(firstLaunch: firstLaunch, launchList: launchList)
                }
            }
            .navigationTitle("Upcoming")
         }
         .navigationViewStyle(.stack)
    }

}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        let viewModel = HomeViewModel()
        Group {
            HomeView(viewModel: viewModel)
                .preferredColorScheme(.light)
                .previewDevice("iPhone 12")
                .task {
                    viewModel.state = .loaded(Launch.example(), [Launch.localJSONExample(), Launch.localJSONExample()])
                }
            HomeView(viewModel: viewModel)
                .preferredColorScheme(.light)
                .previewDevice("iPhone 13 mini")
                .task {
                    viewModel.state = .empty
                }
            HomeView(viewModel: viewModel)
                .preferredColorScheme(.dark)
                .previewDevice("iPhone SE (3rd generation)")
                .task {
                    viewModel.state = .error(APIError.badURL.localizedDescription)
                }
        }
    }
}
