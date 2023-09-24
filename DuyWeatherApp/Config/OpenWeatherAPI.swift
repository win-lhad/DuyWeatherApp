//
//  OpenWeatherAPI.swift
//  DuyWeatherApp
//
//  Created by Duy Le on 24/09/2023.
//

import Foundation

struct OpenWeatherAPI {
    // MARK: To make sure the project is runnable, I put my API Key here, while it should be stored in a more secure place.
    static let apiKey: String = "53ab69037642e922c8e038b69d0c5d69"
    
    static let baseEndpoint: String = "https://api.openweathermap.org/data/2.5/weather"
    
    static func constructURL(endpoint: String, path: String? = "") -> URL? {
        let urlString = "\(endpoint)\(path ?? "")"
        return URL(string: urlString)
    }
}
