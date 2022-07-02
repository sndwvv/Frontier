//
//  String+Ext.swift
//  Frontier
//
//  Created by Songyee Park on 2022/07/02.
//

import Foundation

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
