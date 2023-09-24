//
//  JSONFileService.swift
//  DuyWeatherApp
//
//  Created by Duy Le on 24/09/2023.
//

import Foundation

final class JSONFileService {
    func load<T: Decodable>(_ filename: String) -> Result<T, Error> {
        let data: Data
        guard let file = Bundle.main.url(forResource: filename, withExtension: nil)
        else {
            let error = JSONFileServiceError.fileNotFound(filename: filename)
            return .failure(error)
        }
        
        do {
            data = try Data(contentsOf: file)
        } catch {
            return .failure(JSONFileServiceError.fileLoadFailed(filename: filename))
        }
        
        do {
            let decoder = JSONDecoder()
            let decodedData = try decoder.decode(T.self, from: data)
            return .success(decodedData)
        } catch {
            return .failure(JSONFileServiceError.fileParsingFailed(filename: filename, underlyingError: error))
        }
    }
}
