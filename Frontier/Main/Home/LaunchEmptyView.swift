//
//  LaunchEmptyView.swift
//  Frontier
//
//  Created by Songyee Park on 2022/07/05.
//

import SwiftUI

struct LaunchEmptyView: View {
    
    let launchFetcher: HomeLaunchFetcher
    
    var body: some View {
        VStack(spacing: 20) {
            Text("👽")
                .font(.system(size: 40))
            Text("No Results")
                .foregroundColor(.primaryText)
            Button {
                launchFetcher.load()
            } label: {
                Text("Try Again")
            }
        }
    }
}

struct LaunchEmptyView_Previews: PreviewProvider {
    static var previews: some View {
        LaunchEmptyView(launchFetcher: HomeLaunchFetcher())
    }
}
