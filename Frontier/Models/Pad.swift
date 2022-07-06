//
//  Pad.swift
//  Frontier
//
//  Created by Songyee Park on 2022/07/06.
//

import Foundation

struct Pad: Codable, Identifiable {
    let id: Int
    let url: String?
    let agencyId: Int?
    let name: String?
    let infoUrl: String?
    let wikiUrl: String?
    let mapUrl: String?
    let latitude: String?
    let longitude: String?
    let location: Location?
    let mapImage: String?
    let totalLaunchCount: Int?
    
    struct Location: Codable, Identifiable {
        let id: Int
        let url: String?
        let name: String?
        let countryCode: String?
        let mapImage: String?
        let totalLaunchCount: Int
        let totalLandingCount: Int
    }
}
