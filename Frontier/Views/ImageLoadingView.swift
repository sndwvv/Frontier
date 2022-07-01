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
        Group {
            if imageLoader.image != nil {
                Image(uiImage: imageLoader.image!)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .clipped()
            } else if imageLoader.errorMessage != nil {
                Text(imageLoader.errorMessage!)
                    .foregroundColor(Color.pink)
            } else {
                ProgressView()
            }
        }.onAppear {
            imageLoader.fetch()
        }
    }
}

struct ImageLoadingView_Previews: PreviewProvider {
    static var previews: some View {
        ImageLoadingView(url: Article.example().imageUrl)
    }
}
