//
//  NewsRowView.swift
//  Frontier
//
//  Created by Songyee Park on 2022/06/22.
//

import SwiftUI

struct NewsRowView: View {
    
    let article: Article
    let imageLength: CGFloat = 120
    
    // MARK: Main Content
    
    var body: some View {
        HStack(alignment: .top, spacing: 8) {
            imageView
            infoView
        }
    }
    
    // MARK: Subviews
    
    private var imageView: some View {
        ImageLoadingView(url: article.imageUrl)
            .aspectRatio(contentMode: .fill)
            .frame(width: imageLength)
            .frame(height: imageLength)
            .clipped()
            .cornerRadius(10)
    }
    
    private var infoView: some View {
        VStack(alignment: .leading, spacing: 8) {
            HStack {
                TagView(text: article.newsSite ?? "", backgroundColor: .blue)
            }
            Text(article.title ?? "")
                .font(.headline)
                .foregroundColor(Color.primaryText)
                .multilineTextAlignment(.leading)
                .lineLimit(3)
            if let publishedAt = article.publishedAt {
                Text(publishedAt.timeAgoDisplay())
                    .font(.caption)
                    .foregroundColor(Color.secondaryText)
            }
        }
        .padding(EdgeInsets(top: 0, leading: 8, bottom: 0, trailing: 8))
        .frame(
              minWidth: 0,
              maxWidth: .infinity,
              minHeight: 0,
              maxHeight: .infinity,
              alignment: .topLeading
            )
    }
    
}

struct NewsRowView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            NewsRowView(article: Article.example())
                .previewLayout(.fixed(width: 375, height: 120))
            NewsRowView(article: Article.exampleTwo())
                .preferredColorScheme(.dark)
                .previewLayout(.fixed(width: 375, height: 120))
        }
    }
}
