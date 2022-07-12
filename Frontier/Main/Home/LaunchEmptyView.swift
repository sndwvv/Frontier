//
//  LaunchEmptyView.swift
//  Frontier
//
//  Created by Songyee Park on 2022/07/05.
//

import SwiftUI

struct LaunchEmptyView: View {
    
    let viewModel: HomeLaunchViewModel
    
    var body: some View {
        VStack(spacing: 20) {
            Text("👽")
                .font(.system(size: 40))
            Text("No Results")
                .foregroundColor(.primaryText)
            Button {
                viewModel.load()
            } label: {
                Text("Try Again")
            }
        }
    }
}

struct LaunchEmptyView_Previews: PreviewProvider {
    static var previews: some View {
        LaunchEmptyView(viewModel: HomeLaunchViewModel())
    }
}
