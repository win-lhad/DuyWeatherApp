//
//  OpenWeatherAPI.swift
//  DuyWeatherApp
//
//  Created by Duy Le on 24/09/2023.
//

import Foundation

struct OpenWeatherAPI {
    // MARK: Register OpenWeatherAPI and put your key here, in real project, the APIKey is store in a more secure place
    static let apiKey: String = "YOUR_API_KEY_HERE"
    
    static let baseEndpoint: String = "https://api.openweathermap.org/data/2.5/weather"
    
    static func constructURL(endpoint: String, path: String? = "") -> URL? {
        let urlString = "\(endpoint)\(path ?? "")"
        return URL(string: urlString)
    }
}
