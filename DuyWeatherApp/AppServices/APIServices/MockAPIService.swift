//
//  MockAPIService.swift
//  DuyWeatherApp
//
//  Created by Duy Le on 24/09/2023.
//

import Foundation
import Combine

final class MockAPIService: APIServiceProtocol {
    private let jsonFileService = JSONFileService()
    
    func performRequest<T>(_ url: URL, method: String, params: [String : Any]?, headers: [String : String]?, body: Data?) -> AnyPublisher<T, Error> where T : Decodable {
        var result: Result<T, Error>
        
        switch url {
        case OpenWeatherAPI.constructURL(endpoint: OpenWeatherAPI.baseEndpoint):
            result = jsonFileService.load(JSONFile.city)
        default:
            return Fail(error: APIError.invalidURL).eraseToAnyPublisher()
        }
        
        return result.publisher.eraseToAnyPublisher()
    }
}
