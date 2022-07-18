//
//  NewsArticleFetcher.swift
//  Frontier
//
//  Created by Songyee Park on 2022/06/22.
//

import Foundation
import Combine

class NewsArticleFetcher: ObservableObject {
    
    let service: NewsAPIServiceProtocol
    
    init(service: NewsAPIServiceProtocol = NewsAPIService()) {
        self.service = service
    }
    
    enum State {
        case loading
        case error(String)
        case empty
        case loaded([Article])
    }
    
    @Published var state: State = .loading
    
    func load() {
        service.fetchLatestNews { [unowned self] result in
            DispatchQueue.main.async {
                switch result {
                case .failure(let error):
                    self.state = .error(error.localizedDescription)
                case .success(let articles):
                    if articles.isEmpty {
                        self.state = .empty
                    } else {
                        self.state = .loaded(articles)
                    }
                }
            }
        }
    }
    
    func mockErrorState() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0, execute: {
            self.state = .error(APIError.badURL.localizedDescription)
        })
    }
    
    func loadAsync() {
        Task {
            await loadAsyncTest()
        }
    }
    
    func loadAsyncTest() async {
        do {
            let articles = try await APIService.sendRequest(endpoint: NewsEndpoint.latestNews, [Article].self)
            DispatchQueue.main.async {
                if articles.isEmpty {
                    self.state = .empty
                } else {
                    self.state = .loaded(articles)
                }
            }
        } catch {
            DispatchQueue.main.async {
                self.state = .error(error.localizedDescription)
            }
        }
    }
    
}
