//
//  NewsErrorView.swift
//  Frontier
//
//  Created by Songyee Park on 2022/06/22.
//

import SwiftUI

struct NewsErrorView: View {
    
    @ObservedObject var viewModel: NewsViewModel
    let errorMessage: String
    
    var body: some View {
        VStack(spacing: 20) {
            Text("😿")
                .font(.system(size: 40))
            Text(errorMessage)
                .foregroundColor(.primary)
            Button {
                viewModel.load()
            } label: {
                Text("Try Again")
            }
        }
    }
}

struct NewsErrorView_Previews: PreviewProvider {
    static var previews: some View {
        NewsErrorView(viewModel: NewsViewModel(), errorMessage: "Something went wrong.")
    }
}
