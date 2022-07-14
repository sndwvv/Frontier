//
//  LaunchAPIService.swift
//  Frontier
//
//  Created by Songyee Park on 2022/07/15.
//

import Foundation

struct LaunchAPIService: LaunchListAPIServiceProtocol, LaunchDetailAPIServiceProtocol {
    
    func fetchUpcomingLaunches(completion: @escaping (Result<LaunchSerializer, APIError>) -> Void) {
        APIService.fetch(endpoint: LaunchEndpoint.upcomingLaunches, LaunchSerializer.self) { result in
            completion(result)
        }
    }
    
    func fetchLaunchDetail(id: String, completion: @escaping (Result<Launch, APIError>) -> Void) {
        APIService.fetch(endpoint: LaunchEndpoint.launchDetail(id: id), Launch.self) { result in
            completion(result)
        }
    }
    
    // :: TEST with async wrapper
    func fetchUpcomingLaunches() async throws -> LaunchSerializer {
        return try await withCheckedThrowingContinuation({ continuation in
            self.fetchUpcomingLaunches { result in
                continuation.resume(with: result)
            }
        })
    }
}

// MARK: Protocols

protocol LaunchListAPIServiceProtocol {
    func fetchUpcomingLaunches(completion: @escaping (Result<LaunchSerializer, APIError>) -> Void)
}

protocol LaunchDetailAPIServiceProtocol {
    func fetchLaunchDetail(id: String, completion: @escaping (Result<Launch, APIError>) -> Void)
}

// MARK: Mock

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
