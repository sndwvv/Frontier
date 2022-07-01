//
//  NewsErrorView.swift
//  Frontier
//
//  Created by Songyee Park on 2022/06/22.
//

import SwiftUI

struct NewsErrorView: View {
    
    @ObservedObject var fetcher: NewsArticleFetcher
    
    var body: some View {
        VStack(spacing: 20) {
            Text("😿")
                .font(.system(size: 40))
            ProgressView()
            Text(fetcher.errorMessage ?? "")
                .foregroundColor(.primary)
            Button {
                fetcher.fetchArticles()
            } label: {
                Text("Try Again")
            }
        }
    }
}

struct NewsErrorView_Previews: PreviewProvider {
    static var previews: some View {
        NewsErrorView(fetcher: NewsArticleFetcher())
    }
}
