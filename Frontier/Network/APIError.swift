//
//  APIError.swift
//  Frontier
//
//  Created by Songyee Park on 2022/06/22.
//

import Foundation

enum APIError: Error, CustomStringConvertible {
    case badURL
    case badResponse(statusCode: Int)
    case urlSession(URLError?)
    case parsing(DecodingError?)
    case unknown
    
    var localizedDescription: String { // description for user
        switch self {
        case .badURL, .parsing, .unknown:
            return "Sorry, something went wrong."
        case .badResponse:
            return "Sorry, the connection to our server failed."
        case .urlSession(let error):
            return error?.localizedDescription ?? "Something went wrong."
        }
    }

    var description: String { // description for developer
        switch self {
        case .unknown:
            return "unknown error"
        case .badURL:
            return "invalid URL"
        case .urlSession(let error):
            return error?.localizedDescription ?? "url session error"
        case .badResponse(let statusCode):
            return "bad response with status code: \(statusCode)"
        case .parsing(let error):
            return "parsing error: \(error.debugDescription)"
        }
    }
}
