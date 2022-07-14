//
//  NewsEndpoint.swift
//  Frontier
//
//  Created by Songyee Park on 2022/07/15.
//

enum NewsEndpoint {
    case latestNews
}

extension NewsEndpoint: Endpoint {
    var baseURL: String {
        return "https://api.spaceflightnewsapi.net/v3/"
    }
    
    var path: String {
        switch self {
        case .latestNews:
            return "articles?_limit=30"
        }
    }
    
    var method: RequestMethod {
        switch self {
        case .latestNews:
            return .get
        }
    }
    
    var header: [String : String]? {
        switch self {
        case .latestNews:
            return nil
        }
    }
    
    var body: [String : String]? {
        switch self {
        case .latestNews:
            return nil
        }
    }
}
