//
//  StringExtensions.swift
//  DuyWeatherApp
//
//  Created by Duy Le on 24/09/2023.
//

import Foundation

extension String {
    func localized(_ comment: String = "") -> String {
        return NSLocalizedString(self, comment: comment)
    }
}
