//
//  NewsView.swift
//  Frontier
//
//  Created by Songyee Park on 2022/06/22.
//

import SwiftUI

struct NewsView: View {
    
    @StateObject var fetcher = NewsArticleFetcher()
    
    var body: some View {
        NavigationView {
            self.content
                .navigationTitle("News")
        }
        .navigationViewStyle(StackNavigationViewStyle())
    }
    
    @ViewBuilder private var content: some View {
        if fetcher.isLoading {
            NewsLoadingView()
        } else if fetcher.errorMessage != nil {
            NewsErrorView(fetcher: fetcher)
        } else {
            NewsListView(articles: fetcher.articles)
        }
    }
    
}

struct NewsView_Previews: PreviewProvider {
    static var previews: some View {
        NewsView()
    }
}
