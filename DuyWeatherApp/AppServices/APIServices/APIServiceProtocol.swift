//
//  APIServiceProtocol.swift
//  DuyWeatherApp
//
//  Created by Duy Le on 24/09/2023.
//

import Foundation
import Combine

protocol APIServiceProtocol {
    func performRequest<T: Decodable>(_ url: URL, method: String, params: [String: Any]?, headers: [String: String]?, body: Data?) -> AnyPublisher<T, Error>
    func get<T: Decodable>(_ url: URL, params: [String: Any]?, headers: [String: String]?) -> AnyPublisher<T, Error>
}

extension APIServiceProtocol {
    func get<T: Decodable>(_ url: URL, params: [String: Any]? = nil, headers: [String: String]? = nil) -> AnyPublisher<T, Error> {
        performRequest(url, method: "GET", params: params, headers: headers, body: nil)
    }
}
