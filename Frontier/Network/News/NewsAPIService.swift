//
//  NewsAPIService.swift
//  Frontier
//
//  Created by Songyee Park on 2022/07/15.
//

struct NewsAPIService: NewsAPIServiceProtocol {
    
    func fetchLatestNews(completion: @escaping (Result<[Article], APIError>) -> Void) {
        APIService.fetch(endpoint: NewsEndpoint.latestNews, [Article].self) { result in
            completion(result)
        }
    }
    
}


// MARK: Protocols

protocol NewsAPIServiceProtocol {
    func fetchLatestNews(completion: @escaping (Result<[Article], APIError>) -> Void)
}

// MARK: Mock

struct NewsAPIMockService: NewsAPIServiceProtocol {
    
    var result: Result<[Article], APIError>
    
    func fetchLatestNews(completion: @escaping (Result<[Article], APIError>) -> Void) {
        completion(result)
    }
    
}
