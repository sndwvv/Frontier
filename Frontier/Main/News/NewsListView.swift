//
//  NewsListView.swift
//  Frontier
//
//  Created by Songyee Park on 2022/06/22.
//

import SwiftUI

struct NewsListView: View {
    
    let articles: [Article]
    
    var body: some View {
        ScrollView {
            ForEach(articles) { article in
                NavigationLink {
                    NewsWebView(article: article)
                        .navigationBarTitleDisplayMode(.inline)
                } label: {
                    NewsRowView(article: article)
                        .padding(.horizontal, 16)
                }
                 .padding(.vertical, 8)
            }
            Text("Data provided by Spaceflight News API")
                .font(.footnote)
                .padding(16)
        }
        .listStyle(.plain)
        .onAppear {
            // print("cache size: \(URLCache.shared.memoryCapacity / 1024)KB")
            URLCache.shared.memoryCapacity = 1024 * 1024 * 512 // 0.5 gb
        }
        .background(Color.mainBackground)
    }
}

struct NewsListView_Previews: PreviewProvider {
    static var previews: some View {
        NewsListView(articles: [Article.example(), Article.exampleTwo()])
    }
}
