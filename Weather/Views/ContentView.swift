//
//  ContentView.swift
//  Weather
//
//  Created by Pro on 26/05/2022.
//

import SwiftUI

struct ContentView: View {
    @StateObject var locationManager = LocationManager()
    @State var weather: CurrentWeatherResponse?
    @State var forecast: ForecastResponse?
    var weatherManager = WeatherManager()
    
    var body: some View {
        ZStack {
            VStack {
                if let location = locationManager.location {
                    if let weather = weather {
                        WeatherView(weather: weather, forecast: forecast)
                            .task {
                                do {
                                    forecast = try await weatherManager.getForecast(latitude: location.latitude, longitude: location.longitude)
                                } catch {
                                    print(error)
                                }
                            }
                    } else {
                        LoadingView()
                            .task {
                                do {
                                    weather = try await weatherManager.getCurrentWeather(latitude: location.latitude, longitude: location.longitude)
                                } catch {
                                    print(error)
                                }
                            }
                    }
                } else {
                    if locationManager.isLoading {
                        LoadingView()
                    } else {
                        WelcomeView()
                            .environmentObject(locationManager)
                    }
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
