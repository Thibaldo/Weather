//
//  WeatherManager.swift
//  Weather
//
//  Created by Pro on 26/05/2022.
//

import Foundation
import CoreLocation

class WeatherManager {
    func getCurrentWeather(latitude: CLLocationDegrees, longitude: CLLocationDegrees) async throws -> CurrentWeatherResponse {
        guard let url = URL(string: "https://api.openweathermap.org/data/2.5/weather?lat=\(latitude)&lon=\(longitude)&appid=\(API_KEY)&units=metric")      else { fatalError("Missing URL") }
        
        let urlRequest = URLRequest(url: url)
        
        let (data, response) = try await URLSession.shared.data(for: urlRequest)
        
        guard (response as? HTTPURLResponse)?.statusCode == 200 else { fatalError("Error fetching weather data") }
        
        let decodedData = try JSONDecoder().decode(CurrentWeatherResponse.self, from: data)
        
        return decodedData
    }
    
    func getForecast(latitude: CLLocationDegrees, longitude: CLLocationDegrees) async throws -> ForecastResponse {
        
        guard let url = URL(string: "https://api.openweathermap.org/data/2.5/forecast?lat=\(latitude)&lon=\(longitude)&appid=\(API_KEY)&units=metric") else { fatalError("Missing URL") }
        
        let urlRequest = URLRequest(url: url)
        
        let (data, response) = try await URLSession.shared.data(for: urlRequest)
        
        
        guard (response as? HTTPURLResponse)?.statusCode == 200 else { fatalError("Error fetching weather data") }
        let decodedData = try JSONDecoder().decode(ForecastResponse.self, from: data)
        
        return decodedData
    }
}
struct MainResponse: Decodable {
    var temp: Double
    var feels_like: Double
    var temp_min: Double
    var temp_max: Double
    var pressure: Double
    var humidity: Double
}

struct CoordinatesResponse: Decodable {
    var lon: Double
    var lat: Double
}

struct WeatherResponse: Decodable {
    var id: Double
    var main: String
    var description: String
    var icon: String
}

struct WindResponse: Decodable {
    var speed: Double
    var deg: Double
}

struct CurrentWeatherResponse: Decodable {
    var coord: CoordinatesResponse
    var weather: [WeatherResponse]
    var main: MainResponse
    var name: String
    var wind: WindResponse
}

struct ForecastResponse: Decodable {
    var list: [ForecastElementResponse]
    
    struct ForecastElementResponse: Decodable, Identifiable {
        var id: Int {dt}
        var weather: [WeatherResponse]
        var main: MainResponse
        var dt: Int
        var wind: WindResponse
    }
}

extension MainResponse {
    var feelsLike: Double { return feels_like }
    var tempMin: Double { return temp_min }
    var tempMax: Double { return temp_max }
}
