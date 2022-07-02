//
//  LaunchErrorView.swift
//  Frontier
//
//  Created by Songyee Park on 2022/06/24.
//

import SwiftUI

struct LaunchErrorView: View {
    
    let launchFetcher: LaunchFetcher
    
    var body: some View {
        VStack(spacing: 20) {
            Text("👽")
                .font(.system(size: 40))
            Text(launchFetcher.errorMessage ?? "Something went wrong.")
                .foregroundColor(.primaryText)
            Button {
                launchFetcher.fetchLaunches()
            } label: {
                Text("Try Again")
            }
        }
    }
}

struct LaunchErrorView_Previews: PreviewProvider {
    static var previews: some View {
        LaunchErrorView(launchFetcher: LaunchFetcher())
    }
}
