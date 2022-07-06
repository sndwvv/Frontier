//
//  APIMockService.swift
//  Frontier
//
//  Created by Songyee Park on 2022/06/22.
//

import Foundation

struct NewsAPIMockService: NewsAPIServiceProtocol {
    
    var result: Result<[Article], APIError>
    
    func fetchLatestNews(completion: @escaping (Result<[Article], APIError>) -> Void) {
        completion(result)
    }
}

struct LaunchListAPIMockService: LaunchListAPIServiceProtocol {
    
    var result: Result<LaunchSerializer, APIError>
    
    func fetchUpcomingLaunches(completion: @escaping (Result<LaunchSerializer, APIError>) -> Void) {
         completion(result)
    }
}

struct LaunchDetailAPIMockService: LaunchDetailAPIServiceProtocol {
    
    var result: Result<Launch, APIError>
    
    func fetchLaunchDetail(id: String, completion: @escaping (Result<Launch, APIError>) -> Void) {
         completion(result)
    }
}
