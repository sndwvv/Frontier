//
//  APIMockService.swift
//  Frontier
//
//  Created by Songyee Park on 2022/06/22.
//

import Foundation

struct APIMockService: APIServiceProtocol {
    
    var result: Result<[Article], APIError>
    
    func fetchLatestNews(completion: @escaping (Result<[Article], APIError>) -> Void) {
        completion(result)
    }
    
    func fetchUpcomingLaunches(completion: @escaping (Result<LaunchSerializer, APIError>) -> Void) {
        // completion(result)
    }
}
