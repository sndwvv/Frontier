//
//  APIService.swift
//  Frontier
//
//  Created by Songyee Park on 2022/06/22.
//

import SwiftUI

struct APIService {
    
    // 1 Workable fetch method
    /*
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
     */
    
    static func fetch<T:Decodable>(endpoint: Endpoint, _ type: T.Type, completion: @escaping (Result<T, APIError>) -> Void) {
        guard let url = URL(string: endpoint.baseURL + endpoint.path) else {
            completion(.failure(.badURL))
            return
        }
        var request = URLRequest(url: url)
        request.httpMethod = endpoint.method.rawValue
        request.allHTTPHeaderFields = endpoint.header
        
        if let body = endpoint.body {
            request.httpBody = try? JSONSerialization.data(withJSONObject: body, options: [])
        }
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            if let error = error as? URLError {
                completion(.failure(.urlSession(error)))
            } else {
                guard let response = response as? HTTPURLResponse else {
                    completion(.failure(.noResponse))
                    return
                }
                guard let data = data else {
                    completion(.failure(.noData))
                    return
                }
                switch response.statusCode {
                case 200...299:
                    do {
                        let decoder = JSONDecoder()
                        decoder.keyDecodingStrategy = .convertFromSnakeCase
                        let decodedData = try decoder.decode(type, from: data)
                        completion(.success(decodedData))
                    }
                    catch {
                        completion(.failure(.parsing(error as? DecodingError)))
                    }
                case 401:
                    completion(.failure(.unauthorized))
                default:
                    completion(.failure(.badResponse(statusCode: response.statusCode)))
                }
            }
        }
        task.resume()
    }
    
}
