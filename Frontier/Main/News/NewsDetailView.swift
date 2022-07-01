//
//  NewsDetailView.swift
//  Frontier
//
//  Created by Songyee Park on 2022/06/22.
//

import SwiftUI

struct NewsDetailView: View {
    
    let article: Article
    
    var body: some View {
        ScrollView {
            VStack {
                if let imageUri = article.imageUrl {
                    StretchyHeaderImageView(urlString: imageUri)
                }
                VStack(alignment: .leading, spacing: 16) {
                    Text(article.newsSite ?? "")
                        .font(.system(size: 15))
                    Text(article.title ?? "")
                        .font(.system(size: 30, weight: .bold, design: .default))
                        .lineLimit(nil)
                    Text(article.publishedAt?.timeAgoDisplay() ?? "")
                        .font(.system(size: 15))
                        .foregroundColor(.secondary)
                    Text(article.summary ?? "")
                        .lineSpacing(4)
                    
                    Link("Read Full Story", destination: URL(string: article.url!)!)
                }
                .padding(32)
                
            }
        }
        .edgesIgnoringSafeArea(.top)
    }
}

struct NewsDetailView_Previews: PreviewProvider {
    static var previews: some View {
        NewsDetailView(article: Article.exampleTwo())
    }
}
