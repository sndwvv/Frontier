//
//  LaunchEmptyView.swift
//  Frontier
//
//  Created by Songyee Park on 2022/07/05.
//

import SwiftUI

struct LaunchEmptyView: View {
    
    let launchFetcher: LaunchFetcher
    
    var body: some View {
        VStack(spacing: 20) {
            Text("👽")
                .font(.system(size: 40))
            Text("No Results")
                .foregroundColor(.primaryText)
            Button {
                launchFetcher.fetchLaunches()
            } label: {
                Text("Try Again")
            }
        }
    }
}

struct LaunchEmptyView_Previews: PreviewProvider {
    static var previews: some View {
        LaunchEmptyView(launchFetcher: LaunchFetcher())
    }
}
