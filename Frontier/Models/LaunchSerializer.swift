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

extension LaunchSerializer {
    
    // TODO: Make a generic read local file function
    
//    static func localJSONExample() -> LaunchSerializer? {
//        guard let data = JSONReader().readLocalFile(forName: "UpcomingLaunches") else {
//            return nil
//        }
//        do {
//            let launches = try JSONDecoder().decode(LaunchSerializer.self, from: data)
//            return launches
//        } catch {
//            return nil
//        }
//    }
    
    static func localJSONExample() -> LaunchSerializer? {
        return JSONReader().parseLocalJSON(fileName: "UpcomingLaunches", self)
    }

}
