//
//  ContentView.swift
//  DuyWeatherApp
//
//  Created by Duy Le on 24/09/2023.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        HomeView(viewModel: HomeViewModel(homeService: HomeService(apiService: APIService())))
    }
}

#Preview {
    ContentView()
}
