//
//  Utility.swift
//  DuyWeatherApp
//
//  Created by Duy Le on 24/09/2023.
//

import Foundation

final class Utility {
    static func convertTimeZoneOffsetToTime(offsetInSeconds: Int) -> String {
        let offsetTimeInterval = TimeInterval(offsetInSeconds)
        let utcDate = Date()
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "HH:mm"
        dateFormatter.timeZone = TimeZone(identifier: "UTC")
        
        let localDate = utcDate.addingTimeInterval(offsetTimeInterval)
        
        let formattedTime = dateFormatter.string(from: localDate)
        
        return formattedTime
    }
}
