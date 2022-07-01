//
//  APIServiceProtocol.swift
//  Frontier
//
//  Created by Songyee Park on 2022/06/22.
//

import Foundation

protocol APIServiceProtocol {
    func fetchLatestNews(completion: @escaping (Result<[Article], APIError>) -> Void)
    func fetchUpcomingLaunches(completion: @escaping (Result<LaunchSerializer, APIError>) -> Void)
}
