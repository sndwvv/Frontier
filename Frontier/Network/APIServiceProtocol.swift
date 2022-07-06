//
//  APIServiceProtocol.swift
//  Frontier
//
//  Created by Songyee Park on 2022/06/22.
//

import Foundation

protocol LaunchListAPIServiceProtocol {
    func fetchUpcomingLaunches(completion: @escaping (Result<LaunchSerializer, APIError>) -> Void)
}

protocol LaunchDetailAPIServiceProtocol {
    func fetchLaunchDetail(id: String, completion: @escaping (Result<Launch, APIError>) -> Void)
}

protocol NewsAPIServiceProtocol {
    func fetchLatestNews(completion: @escaping (Result<[Article], APIError>) -> Void)
}
