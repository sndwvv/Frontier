//
//  Article.swift
//  Frontier
//
//  Created by Songyee Park on 2022/06/22.
//

import Foundation

struct Article: Codable, Identifiable {
    let id: Int
    let title: String?
    let url: String?
    let imageUrl: String?
    let newsSite: String?
    let summary: String?
    let publishedAt: String?
    let updatedAt: String?
    let featured: Bool
    
    static func example() -> Article {
        return Article(
            id: 15493,
            title: "SmallSat Alliance unveils Collegiate Space Competition",
            url: "https://spacenews.com/first-collegiate-smallsat-c/",
            imageUrl: "https://spacenews.com/wp-content/uploads/2022/06/rsz_screen_shot_2022-06-21_at_20832_pm.png",
            newsSite: "SpaceNews",
            summary: "The SmallSat Alliance is inviting U.S. university students to propose space-related solutions for formidable technical and policy challenges as part of the Collegiate Space Competition.",
            publishedAt: "2022-06-21T23:52:29.000Z",
            updatedAt: "2022-06-21T23:52:29.565Z",
            featured: false
        )
    }
    
    static func exampleTwo() -> Article {
        return Article(
            id: 15486,
            title: "NASA, SpaceX to test satellite crash-prevention strategies NASA",
            url: "https://spacenews.com/nasa-spacex-to-test-satellite-crash-prevention-strategies/",
            imageUrl: "https://spacenews.com/wp-content/uploads/2022/06/helioswarm_image_credit_unh.jpg",
            newsSite: "SpaceNews",
            summary: "Through the Starling mission, NASA and SpaceX will begin testing strategies for preventing autonomous satellites from crashing into each other.",
            publishedAt: "2022-06-21T15:22:30.000Z",
            updatedAt: "2022-06-21T15:22:31.010Z",
            featured: false
        )
    }
}

extension String {
    
    func timeAgoDisplay() -> String {
        let dateFormatter = ISO8601DateFormatter()
        dateFormatter.formatOptions.insert(.withFractionalSeconds)
        guard let date = dateFormatter.date(from: self) else {
            return "error"
        }
        let relativeFormatter = RelativeDateTimeFormatter()
        relativeFormatter.unitsStyle = .full
        return relativeFormatter.localizedString(for: date, relativeTo: Date())
    }
    
}

/*
 {
   "id": 15493,
   "title": "SmallSat Alliance unveils Collegiate Space Competition",
   "url": "https://spacenews.com/first-collegiate-smallsat-c/",
   "imageUrl": "https://spacenews.com/wp-content/uploads/2022/06/rsz_screen_shot_2022-06-21_at_20832_pm.png",
   "newsSite": "SpaceNews",
   "summary": "The SmallSat Alliance is inviting U.S. university students to propose space-related solutions for formidable technical and policy challenges as part of the Collegiate Space Competition.",
   "publishedAt": "2022-06-21T23:52:29.000Z",
   "updatedAt": "2022-06-21T23:52:29.565Z",
   "featured": false,
   "launches": [],
   "events": []
 }
 */
