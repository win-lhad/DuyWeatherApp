//
//  HomeViewModel.swift
//  DuyWeatherApp
//
//  Created by Duy Le on 24/09/2023.
//

import Foundation
import Combine

final class HomeViewModel: ObservableObject {
    @Published var cities: [City] = []
    @Published var message: String?
    
    private let homeService: HomeServiceProtocol
    
    private var cancellables = Set<AnyCancellable>()
    
    init(homeService: HomeServiceProtocol) {
        self.homeService = homeService
        self.getSpecificCities()
    }
    
    deinit {
        cancellables.forEach { cancellable in
            cancellable.cancel()
        }
    }
    
    private func getCity(name: String) {
        homeService.getCity(name: name)
            .receive(on: DispatchQueue.main)
            .sink { [weak self] completion in
                switch completion {
                case .finished:
                    break
                case .failure(let error):
                    self?.message = "loading_failed_error".localized()
                    // TODO: Write to log file
                    print("There's an error when getting the city data: \(error)")
                    break
                }
            } receiveValue: { [weak self] city in
                self?.cities.append(city)
            }
            .store(in: &cancellables)
    }
    
    private func getSpecificCities() {
        getCity(name: "Gothenburg")
        getCity(name: "Stockholm")
        getCity(name: "Mountain View")
        getCity(name: "London")
        getCity(name: "New York")
        getCity(name: "Berlin")
    }
    
    func refreshCities() {
        cities.removeAll()
        getSpecificCities()
    }
}
