//
//  APIService.swift
//  Frontier
//
//  Created by Songyee Park on 2022/06/22.
//

import SwiftUI

struct APIService {
    
    static func fetch<T: Decodable>(_ type: T.Type, url: String, completion: @escaping (Result<T, APIError>) -> Void) {
        guard let url = URL(string: url) else {
            completion(.failure(.badURL))
            return
        }
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error as? URLError {
                completion(.failure(.urlSession(error)))
            } else if let response = response as? HTTPURLResponse, !(200...299).contains(response.statusCode) {
                completion(.failure(.badResponse(statusCode: response.statusCode)))
            } else if let data = data {
                do {
                    let decoder = JSONDecoder()
                    decoder.keyDecodingStrategy = .convertFromSnakeCase
                    let decodedData = try decoder.decode(T.self, from: data)
                    completion(.success(decodedData))
                } catch {
                    completion(.failure(.parsing(error as? DecodingError)))
                }
            }
        }
        .resume()
    }
    
}

struct NewsAPIService: NewsAPIServiceProtocol {
    
    func fetchLatestNews(completion: @escaping (Result<[Article], APIError>) -> Void) {
        let url = APIPath.spaceFlightNewsBaseURL + "articles?_limit=30"
        APIService.fetch([Article].self, url: url) { result in
            completion(result)
        }
    }
    
}

struct APILaunchService: LaunchListAPIServiceProtocol, LaunchDetailAPIServiceProtocol {
    
    func fetchUpcomingLaunches(completion: @escaping (Result<LaunchSerializer, APIError>) -> Void) {
        let url = APIPath.launchLibaryBaseURL + "launch/upcoming/?limit=10"
        APIService.fetch(LaunchSerializer.self, url: url) { result in
            completion(result)
        }
    }
    
    // TEST
    func fetchUpcomingLaunches() async throws -> LaunchSerializer {
        return try await withCheckedThrowingContinuation({ continuation in
            self.fetchUpcomingLaunches { result in
                continuation.resume(with: result)
            }
        })
    }
    
    func fetchLaunchDetail(id: String, completion: @escaping (Result<Launch, APIError>) -> Void) {
        let url = APIPath.launchLibaryBaseURL + "launch/\(id)"
        APIService.fetch(Launch.self, url: url) { result in
            completion(result)
        }
    }
}
