//
//  APIService.swift
//  Frontier
//
//  Created by Songyee Park on 2022/06/22.
//

import SwiftUI

struct APIService {
    
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
    
    // ASYNC TEST
    static func sendRequest<T: Decodable>(endpoint: Endpoint, _ responseModel: T.Type) async throws -> T {
        guard let url = URL(string: endpoint.baseURL + endpoint.path) else {
            throw APIError.badURL
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = endpoint.method.rawValue
        request.allHTTPHeaderFields = endpoint.header

        if let body = endpoint.body {
            request.httpBody = try? JSONSerialization.data(withJSONObject: body, options: [])
        }
        
        do {
            let (data, response) = try await URLSession.shared.data(for: request)
            guard let response = response as? HTTPURLResponse else {
                throw APIError.noResponse
            }
            switch response.statusCode {
            case 200...299:
                do {
                    let decoder = JSONDecoder()
                    decoder.keyDecodingStrategy = .convertFromSnakeCase
                    let decodedData = try decoder.decode(responseModel, from: data)
                    return decodedData
                } catch {
                    throw APIError.parsing(error as? DecodingError)
                }
            case 401:
                throw APIError.unauthorized
            default:
                throw APIError.badResponse(statusCode: response.statusCode)
            }
        } catch {
            throw APIError.unknown
        }
    }
    
}
