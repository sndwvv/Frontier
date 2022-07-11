//
//  HomeLaunchView.swift
//  Frontier
//
//  Created by Songyee Park on 2022/06/27.
//

import SwiftUI

struct HomeLaunchView: View {
    
    let launch: Launch
    
    var body: some View {
        VStack {
            NavigationLink {
                LaunchDetailView(detailFetcher: LaunchDetailFetcher(launch: launch))
            } label: {
                LaunchView(launch: launch)
                    .padding(.bottom, 24)
            }
        }
        // .background(Color.mainBackground)
    }
    
}

struct HomeLaunchView_Previews: PreviewProvider {
    static var previews: some View {
        HomeLaunchView(launch: Launch.example())
            .previewInterfaceOrientation(.portrait)
    }
}
