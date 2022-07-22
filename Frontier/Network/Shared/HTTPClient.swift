//
//  HTTPClient.swift
//  Frontier
//
//  Created by Songyee Park on 2022/07/14.
//
/*
import Foundation

protocol HTTPClient {
    func sendRequest<T: Decodable>(endpoint: Endpoint, _ responseModel: T.Type) async throws -> T
}

extension HTTPClient {
    func sendRequest<T: Decodable>(endpoint: Endpoint, _ responseModel: T.Type) async throws -> T {
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
*/
