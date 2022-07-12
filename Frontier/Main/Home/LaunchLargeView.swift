//
//  LaunchLargeView.swift
//  Frontier
//
//  Created by Songyee Park on 2022/06/27.
//

import SwiftUI

struct LaunchLargeView: View {
    
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
    }
    
}

struct LaunchLargeView_Previews: PreviewProvider {
    static var previews: some View {
        LaunchLargeView(launch: Launch.example())
            .previewInterfaceOrientation(.portrait)
    }
}
