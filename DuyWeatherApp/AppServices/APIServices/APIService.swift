//
//  APIService.swift
//  DuyWeatherApp
//
//  Created by Duy Le on 24/09/2023.
//

import Foundation
import Combine

final class APIService: APIServiceProtocol {
    func performRequest<T: Decodable>(_ url: URL, method: String, params: [String: Any]? = nil, headers: [String: String]? = nil, body: Data? = nil) -> AnyPublisher<T, Error> {
        let request = createRequest(url: url, method: method, params: params, headers: headers, body: body)
        
        return URLSession.shared.dataTaskPublisher(for: request)
            .tryMap { data, response in
                guard let httpResponse = response as? HTTPURLResponse else {
                    throw APIError.invalidResponse
                }
                
                switch httpResponse.statusCode {
                case 200:
                    return data
                case 400:
                    throw APIError.badRequest
                case 401:
                    throw APIError.unauthorized
                case 403:
                    throw APIError.forbidden
                case 404:
                    throw APIError.notFound
                default:
                    throw APIError.requestFailed
                }
            }
            .decode(type: T.self, decoder: JSONDecoder())
            .mapError { error -> Error in
                if let apiError = error as? APIError {
                    return apiError
                } else {
                    return APIError.decodingFailed
                }
            }
            .eraseToAnyPublisher()
    }
    
    private func createRequest(url: URL, method: String, params: [String: Any]?, headers: [String: String]?, body: Data?) -> URLRequest {
        var request = URLRequest(url: url)
        request.httpMethod = method
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.addValue("application/json", forHTTPHeaderField: "Accept")
        
        if let headers = headers {
            headers.forEach { (key, value) in
                request.addValue(value, forHTTPHeaderField: key)
            }
        }
        
        if let params = params {
            var urlComponents = URLComponents(url: url, resolvingAgainstBaseURL: false)
            urlComponents?.queryItems = params.map { key, value in
                URLQueryItem(name: key, value: "\(value)")
            }
            
            if let urlWithQuery = urlComponents?.url {
                request.url = urlWithQuery
            }
        }
        
        request.httpBody = body
        return request
    }
}
