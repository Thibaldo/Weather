//
//  WeatherView.swift
//  Weather
//
//  Created by Pro on 26/05/2022.
//

import SwiftUI

struct WeatherView: View {
    var weather: CurrentWeatherResponse
    var forecast: ForecastResponse?
    
    var body: some View {
        ZStack(alignment: .leading) {
            GradientBackground()
            
            VStack {
                VStack(alignment: .leading, spacing: 5) {
                    Text(weather.name)
                        .bold()
                        .font(.title)
                    HStack {
                        DynamicWeatherIcon(description: weather.weather[0].main)
                            .font(.system(size: 80))
                        
                        Spacer()
                        
                        Text(weather.main.feelsLike.roundDouble() + "°")
                            .font(.system(size: 80))
                            .fontWeight(.bold)
                            .padding()
                    }
                    HStack {
                        Text("Aujourd'hui")
                            .bold()
                        Spacer()
                        Text(getCurrentDate())
                            .fontWeight(.light)
                    }
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(25)
                .background(Color(.white).opacity(0.7))
                .cornerRadius(20)
                
                
                Spacer()
            }
            .padding()
            .frame(maxWidth: .infinity, alignment: .leading)
            
            if let forecast = forecast {
                ForecastListView(forecast: forecast)
            }
            
            VStack {
                Spacer()
                
                VStack(alignment: .leading, spacing: 20) {
                    Text("Weather now")
                        .bold().padding(.bottom)
                    
                    HStack {
                        WeatherRow(logo: "thermometer", name: "Max", value: weather.main.tempMin.roundDouble() + "°")
                        
                        Spacer()
                        
                        WeatherRow(logo: "thermometer", name: "Min", value: weather.main.tempMax.roundDouble() + "°")
                    }
                    
                    HStack {
                        WeatherRow(logo: "wind", name: "Vitesse vent", value: weather.wind.speed.roundDouble() + " m/s")
                        
                        Spacer()
                        
                        WeatherRow(logo: "humidity", name: "Humidité", value: weather.main.humidity.roundDouble() + "%")
                    }
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding()
                .padding(.bottom, 20)
                .foregroundColor(Color(hue: 0.656, saturation: 0.787, brightness: 0.354))
                .background(.white)
                .cornerRadius(20, corners: [.topLeft, .topRight])
            }
        }
        .edgesIgnoringSafeArea(.bottom)
    }
}

struct WeatherView_Previews: PreviewProvider {
    static var previews: some View {
        WeatherView(weather: previewWeather)
    }
}
