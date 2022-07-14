//
//  LaunchEndpoint.swift
//  Frontier
//
//  Created by Songyee Park on 2022/07/15.
//

enum LaunchEndpoint {
    case upcomingLaunches
    case launchDetail(id: String)
}

extension LaunchEndpoint: Endpoint {
    
    var baseURL: String {
        switch self {
        case .upcomingLaunches, .launchDetail:
            #if DEBUG
            return "https://lldev.thespacedevs.com/2.2.0/"
            #else
            return "https://ll.thespacedevs.com/2.2.0/"
            #endif
        }
    }
    
    var path: String {
        switch self {
        case .upcomingLaunches:
            return "launch/upcoming/?limit=10"
        case .launchDetail(let id):
            return "launch/\(id)"
        }
    }
    
    var method: RequestMethod {
        switch self {
        case .upcomingLaunches, .launchDetail:
            return .get
        }
    }
    
    var header: [String : String]? {
        switch self {
        case .upcomingLaunches, .launchDetail:
            return nil
        }
    }
    
    var body: [String : String]? {
        switch self {
        case .upcomingLaunches, .launchDetail:
            return nil
        }
    }
    
}
