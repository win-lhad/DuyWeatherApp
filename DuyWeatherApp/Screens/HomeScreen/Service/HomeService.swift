//
//  HomeService.swift
//  DuyWeatherApp
//
//  Created by Duy Le on 24/09/2023.
//

import Foundation
import Combine

protocol HomeServiceProtocol {
    func getCity(name: String) -> AnyPublisher<City, Error>
}

final class HomeService: HomeServiceProtocol {
    private let apiService: APIServiceProtocol
    
    init(apiService: APIServiceProtocol) {
        self.apiService = apiService
    }
    
    func getCity(name: String) -> AnyPublisher<City, Error> {
        guard let weatherURL = OpenWeatherAPI.constructURL(endpoint: OpenWeatherAPI.baseEndpoint) else {
            return Fail(error: APIError.invalidURL).eraseToAnyPublisher()
        }
        
        let cityParams: [String: Any] = [
            "q": name,
            "units": "metric",
            "appid": OpenWeatherAPI.apiKey
        ]
        
        return apiService.get(weatherURL, params: cityParams)
            .eraseToAnyPublisher()
    }
}
