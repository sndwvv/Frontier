//
//  LaunchSerializer.swift
//  Frontier
//
//  Created by Songyee Park on 2022/07/06.
//

import Foundation

struct LaunchSerializer: Codable {
    let count: Int
    let next: String?
    let previous: String?
    let results: [Launch]
}
