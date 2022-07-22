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
            return "date error"
        }
        let relativeFormatter = RelativeDateTimeFormatter()
        relativeFormatter.unitsStyle = .full
        return relativeFormatter.localizedString(for: date, relativeTo: Date())
    }
    
    func readableFormat() -> String {
        let dateFormatterGet = ISO8601DateFormatter()
        let dateFormatterPrint = DateFormatter()
        dateFormatterPrint.dateFormat = "MMM d, yyyy"

        if let date = dateFormatterGet.date(from: self) {
            return dateFormatterPrint.string(from: date)
        } else {
            return "date error"
        }
    }
    
}


extension Date {
    
    func ISOFormattedString() -> String {
        if #available(iOS 15.0, *) {
            return self.ISO8601Format()
        }
        let formatter = ISO8601DateFormatter()
        formatter.formatOptions.insert(.withFractionalSeconds)
        return formatter.string(from: self)
    }
    
}
