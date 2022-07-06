//
//  LaunchLoadingView.swift
//  Frontier
//
//  Created by Songyee Park on 2022/06/29.
//

import SwiftUI

struct LaunchLoadingView: View {
    var body: some View {
        VStack(spacing: 20) {
            Text("🚀")
                .font(.system(size: 40))
            ProgressView()
            Text("Fetching upcoming launches...")
                .foregroundColor(.primaryText)
        }
    }
}

struct LaunchLoadingView_Previews: PreviewProvider {
    static var previews: some View {
        LaunchLoadingView()
    }
}
