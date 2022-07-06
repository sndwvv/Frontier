//
//  Mission.swift
//  Frontier
//
//  Created by Songyee Park on 2022/07/06.
//

import Foundation

struct Mission: Codable, Identifiable {
    let id: Int
    let name: String?
    let description: String?
    let launchDesignator: String?
    let type: String?
    let orbit: Orbit?
    
    struct Orbit: Codable, Identifiable {
        let id: Int
        let name: String?
        let abbrev: String?
    }
}
