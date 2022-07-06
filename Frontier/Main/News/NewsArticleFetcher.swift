//
//  NewsArticleFetcher.swift
//  Frontier
//
//  Created by Songyee Park on 2022/06/22.
//

import Foundation
import Combine

class NewsArticleFetcher: ObservableObject {
    
    @Published var articles = [Article]()
    @Published var isLoading: Bool = false
    @Published var errorMessage: String? = nil
    
    let service: NewsAPIServiceProtocol
    
    init(service: NewsAPIServiceProtocol = NewsAPIService()) {
        self.service = service
        fetchArticles()
    }
    
    private var cancellable: AnyCancellable?
    
    func fetchArticles() {
        isLoading = true
        errorMessage = nil
        
        service.fetchLatestNews() { [unowned self] result in
            DispatchQueue.main.async {
                self.isLoading = false
                switch result {
                case .failure(let error):
                    self.errorMessage = error.localizedDescription
                    print(error.description)
                case .success(let articles):
                    self.articles = articles
                }
            }
        }
    }
    
}
