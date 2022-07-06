//
//  APIPath.swift
//  Frontier
//
//  Created by Songyee Park on 2022/07/06.
//

import Foundation

struct APIPath {
    
    static var launchLibaryBaseURL: String {
        #if DEBUG
        return "https://lldev.thespacedevs.com/2.2.0/"
        #else
        return "https://ll.thespacedevs.com/2.2.0/"
        #endif
    }
    
    static var spaceFlightNewsBaseURL: String {
        return "https://api.spaceflightnewsapi.net/v3/"
    }
    
}
