//
//  WeatherRowView.swift
//  DuyWeatherApp
//
//  Created by Duy Le on 24/09/2023.
//

import SwiftUI

struct WeatherRowView: View {
    @Binding var city: City
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                VStack(alignment: .leading) {
                    Text(city.name).font(.headline).fontWeight(.bold).lineLimit(1)
                    Text(city.time).font(.body)
                }.padding(.trailing, 20)
                
                Spacer()
                
                // TODO: Implement custom AsyncImage if needed depending on the app's requirements.
                AsyncImage(url: city.weather.first?.iconURL, scale: 1).frame(width: 30, height: 30)
                
                Text("\(city.main.tempInt)°")
                    .font(.title)
                    .padding(.leading, 15.0)
            }
            
            HStack {
                Text(city.weather.first?.description.capitalized ?? "--")
                
                Spacer()
                
                Text("H: \(city.main.tempMaxInt)°")
                Text("L: \(city.main.tempMinInt)°")
            }
        }
    }
}

#Preview {
    WeatherRowView(city: .constant(City(id: 1, name: "Gothenburg", timezone: 0, weather: [Weather(id: 1, main: "rain", description: "rain", icon: "10d")], main: MainWeatherData(temp: 20, tempMin: 10, tempMax: 30, humidity: 1))))
}
