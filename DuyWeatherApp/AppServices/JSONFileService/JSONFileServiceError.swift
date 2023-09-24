//
//  JSONFileServiceError.swift
//  DuyWeatherApp
//
//  Created by Duy Le on 24/09/2023.
//

import Foundation

enum JSONFileServiceError: LocalizedError {
    case fileNotFound(filename: String)
    case fileLoadFailed(filename: String)
    case fileParsingFailed(filename: String, underlyingError: Error)
    case dataConversionFailed
    
    var errorDescription: String? {
        switch self {
        case .fileNotFound(let filename):
            return "Couldn't find \(filename)."
        case .fileLoadFailed(let filename):
            return "Failed to load \(filename)."
        case .fileParsingFailed(let filename, let underlyingError):
            return "Failed to parse \(filename): \(underlyingError.localizedDescription)"
        case .dataConversionFailed:
            return "Data Conversion Failed"
        }
    }
}
