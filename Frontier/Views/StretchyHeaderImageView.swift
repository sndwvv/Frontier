//
//  StretchyHeaderImageView.swift
//  Frontier
//
//  Created by Songyee Park on 2022/06/23.
//

import SwiftUI

struct StretchyHeaderImageView: View {
    
    @StateObject var imageLoader: ImageLoader
    
    init(urlString: String) {
        self._imageLoader = StateObject(wrappedValue: ImageLoader(url: urlString))
    }
    
    var body: some View {
        GeometryReader { geometry in
            switch imageLoader.state {
            case .loaded(let image):
                if geometry.frame(in: .global).minY <= 0 {
                    Image(uiImage: image)
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: geometry.size.width, height: geometry.size.height)
                        .offset(y: geometry.frame(in: .global).minY/9)
                        .clipped()
                } else {
                    Image(uiImage: image)
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: geometry.size.width, height: geometry.size.height + geometry.frame(in: .global).minY)
                        .clipped()
                        .offset(y: -geometry.frame(in: .global).minY)
                }
            default:
                Image("PlaceholderImage")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .clipped()
            }
        }
        .frame(height: 400)
        .onAppear {
            DispatchQueue.main.async {
                imageLoader.load()
            }
        }
    }
}

struct StretchyHeaderImageView_Previews: PreviewProvider {
    static var previews: some View {
        StretchyHeaderImageView(urlString: Article.example().imageUrl!)
    }
}
