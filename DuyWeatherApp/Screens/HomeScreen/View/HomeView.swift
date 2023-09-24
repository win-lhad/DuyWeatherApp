//
//  HomeView.swift
//  DuyWeatherApp
//
//  Created by Duy Le on 24/09/2023.
//

import SwiftUI
import Combine

struct HomeView: View {
    @StateObject var viewModel: HomeViewModel
    
    var body: some View {
        NavigationView {
            List {
                if let message = viewModel.message {
                    Text(message)
                        .fontWeight(.medium)
                        .foregroundColor(.black)
                        .padding(.top, 10)
                } else {
                    ForEach($viewModel.cities, id: \.id) { city in
                        WeatherRowView(city: city)
                    }
                }
            }
            .refreshable {
                viewModel.refreshCities()
            }
            .navigationTitle("app_name".localized())
        }
    }
}

#Preview {
    HomeView(viewModel: HomeViewModel(homeService: HomeService(apiService: APIService())))
}
