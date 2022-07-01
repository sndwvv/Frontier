//
//  NewsWebView.swift
//  Frontier
//
//  Created by Songyee Park on 2022/06/28.
//

import SwiftUI

struct NewsWebView: UIViewControllerRepresentable {
    
    let article: Article
    
    func makeUIViewController(context: Context) -> WebViewController {
        let webVC = WebViewController(urlString: article.url)
        return webVC
    }
    
    func updateUIViewController(_ uiViewController: WebViewController, context: Context) {
        //
    }
    
}
