//
//  APIError.swift
//  Frontier
//
//  Created by Songyee Park on 2022/06/22.
//

import Foundation

enum APIError: Error, CustomStringConvertible {
    case badURL
    case noResponse
    case badResponse(statusCode: Int)
    case urlSession(URLError?)
    case parsing(DecodingError?)
    case unauthorized
    case noData
    case unknown
    
    var localizedDescription: String { // description for user
        return "Sorry, something went wrong. Please try again."
    }

    var description: String { // description for developer
        switch self {
        case .unknown:
            return "API ERROR: unknown error"
        case .badURL:
            return "API ERROR: invalid URL"
        case .urlSession(let error):
            return "API ERROR: \(error?.localizedDescription ?? "url session error")"
        case .noResponse:
            return "API ERROR: no response"
        case .badResponse(let statusCode):
            return "API ERROR: bad response with status code \(statusCode)"
        case .parsing(let error):
            return "API ERROR: parsing error, \(error.debugDescription)"
        case .unauthorized:
            return "API ERROR: unauthorized"
        case .noData:
            return "API ERROR: data returned nil"
        }
    }
}
