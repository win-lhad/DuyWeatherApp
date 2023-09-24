//
//  APIError.swift
//  DuyWeatherApp
//
//  Created by Duy Le on 24/09/2023.
//

import Foundation

enum APIError: Error {
    case requestFailed
    case invalidResponse
    case decodingFailed
    case invalidURL
    case badRequest
    case unauthorized
    case forbidden
    case notFound
}
