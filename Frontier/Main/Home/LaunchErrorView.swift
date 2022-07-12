//
//  LaunchErrorView.swift
//  Frontier
//
//  Created by Songyee Park on 2022/06/24.
//

import SwiftUI

struct LaunchErrorView: View {
    
    let viewModel: HomeLaunchViewModel
    let errorMessasge: String
    
    var body: some View {
        VStack(spacing: 20) {
            Text("👽")
                .font(.system(size: 40))
            Text(errorMessasge)
                .foregroundColor(.primaryText)
            Button {
                viewModel.load()
            } label: {
                Text("Try Again")
            }
        }
    }
}

struct LaunchErrorView_Previews: PreviewProvider {
    static var previews: some View {
        LaunchErrorView(viewModel: HomeLaunchViewModel(), errorMessasge: "Something went wrong.")
    }
}
