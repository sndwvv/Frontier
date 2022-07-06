//
//  LaunchStatus.swift
//  Frontier
//
//  Created by Songyee Park on 2022/07/06.
//

import Foundation

struct LaunchStatus: Codable, Identifiable {
    let id: Int
    let name: String?
    let abbrev: String?
    let description: String?
}
