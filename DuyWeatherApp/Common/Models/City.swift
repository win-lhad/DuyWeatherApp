//
//  City.swift
//  DuyWeatherApp
//
//  Created by Duy Le on 24/09/2023.
//

import Foundation

struct City: Codable {
    var id: Int
    var name: String
    var timezone: Int
    var weather: [Weather]
    var main: MainWeatherData
    
    var time: String {
        Utility.convertTimeZoneOffsetToTime(offsetInSeconds: timezone)
    }
}

struct Weather: Codable {
    var id: Int
    var main: String
    var description: String
    var icon: String
    
    var iconURL: URL? {
        URL(string: "https://openweathermap.org/img/wn/\(icon)@2x.png")
    }
}

struct MainWeatherData: Codable {
    var temp: Double
    var tempMin: Double
    var tempMax: Double
    var humidity: Int
    
    enum CodingKeys: String, CodingKey {
        case temp
        case tempMin = "temp_min"
        case tempMax = "temp_max"
        case humidity
    }
    
    var tempInt: Int {
        Int(round(temp))
    }
    
    var tempMinInt: Int {
        Int(round(tempMin))
    }
    
    var tempMaxInt: Int {
        Int(round(tempMax))
    }
}
