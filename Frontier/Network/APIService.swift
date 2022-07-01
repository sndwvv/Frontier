//
//  APIService.swift
//  Frontier
//
//  Created by Songyee Park on 2022/06/22.
//

import Foundation

struct APIService: APIServiceProtocol {
    
    private func fetch<T: Decodable>(_ type: T.Type, url: String, completion: @escaping (Result<T, APIError>) -> Void) {
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
    
    func fetchLatestNews(completion: @escaping (Result<[Article], APIError>) -> Void) {
        let url = spaceFlightNewsBaseURL + "articles?_limit=30"
        fetch([Article].self, url: url) { result in
            completion(result)
        }
    }
    
    func fetchLaunches(completion: @escaping (Result<LaunchSerializer, APIError>) -> Void) {
        let url = launchLibaryBaseURL + "launch/"
        fetch(LaunchSerializer.self, url: url) { result in
            completion(result)
        }
    }
    
    func fetchUpcomingLaunches(completion: @escaping (Result<LaunchSerializer, APIError>) -> Void) {
        let url = launchLibaryBaseURL + "launch/upcoming/?limit=10"
        fetch(LaunchSerializer.self, url: url) { result in
            completion(result)
        }
    }
    
    var launchLibaryBaseURL: String {
        #if DEBUG
        return "https://lldev.thespacedevs.com/2.2.0/"
        #else
        return "https://ll.thespacedevs.com/2.2.0/"
        #endif
    }
    
    var spaceFlightNewsBaseURL: String {
        return "https://api.spaceflightnewsapi.net/v3/"
    }
    
}
