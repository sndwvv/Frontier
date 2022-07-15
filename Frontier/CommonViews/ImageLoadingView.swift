//
//  ImageLoadingView.swift
//  Frontier
//
//  Created by Songyee Park on 2022/06/22.
//

import SwiftUI

struct ImageLoadingView: View {
    
    @StateObject var imageLoader: ImageLoader
    
    init(url: String?) {
        self._imageLoader = StateObject(wrappedValue: ImageLoader(url: url))
    }
    
    var body: some View {
        VStack {
            switch imageLoader.state {
            case .loading:
                ProgressView()
            case .error:
                Image("PlaceholderImage")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .clipped()
            case .loaded(let image):
                Image(uiImage: image)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .clipped()
            }
        }
        .onAppear {
            imageLoader.load()
        }
    }
    
}

struct ImageLoadingView_Previews: PreviewProvider {
    static var previews: some View {
        ImageLoadingView(url: Article.example().imageUrl ?? "")
    }
}
