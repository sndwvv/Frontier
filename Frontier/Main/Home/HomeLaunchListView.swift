//
//  HomeLaunchListView.swift
//  Frontier
//
//  Created by Songyee Park on 2022/07/13.
//

import SwiftUI

struct HomeLaunchListView: View {
    
    let firstLaunch: Launch
    let launchList: [Launch]
    
    var body: some View {
        ScrollView {
            VStack(spacing: 0) {
                largeLaunchView
                LaunchListView(launches: launchList)
                footerView
            }
        }
        .background(Color.mainBackground)
    }
    
    private var largeLaunchView: some View {
        NavigationLink {
            LaunchDetailView(detailFetcher: LaunchDetailFetcher(launch: firstLaunch))
        } label: {
            LaunchLargeView(launch: firstLaunch)
                .padding(.bottom, 24)
                .frame(height: 550)
        }
    }
    
    private var footerView: some View {
        Text("Data provided by Launch Library API")
            .font(.footnote)
            .padding(16)
    }
    
}

struct HomeLaunchListView_Previews: PreviewProvider {
    static var previews: some View {
        HomeLaunchListView(firstLaunch: Launch.localJSONExample(), launchList: [Launch.localJSONExample(), Launch.localJSONExample()])
    }
}
