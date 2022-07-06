//
//  Rocket.swift
//  Frontier
//
//  Created by Songyee Park on 2022/07/06.
//

import Foundation

struct Rocket: Codable, Identifiable {
    let id: Int
    let configuration: Configuration?
    
    struct Configuration: Codable, Identifiable {
        let id: Int
        let url: String?
        let name: String?
        let description: String?
    }
}
