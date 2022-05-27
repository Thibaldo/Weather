//
//  ForecastElement.swift
//  Weather
//
//  Created by Pro on 27/05/2022.
//

import SwiftUI

struct ForecastElement: View {
    var forecastElement: ForecastResponse.ForecastElementResponse
    let formatter: DateFormatter = getLocaleFormatter()
    
    
    var body: some View {
        VStack {
            HStack {
                Spacer()
                DynamicWeatherIcon(description: forecastElement.weather[0].main)
                    .font(.system(size: 30))
            }
            HStack {
                VStack(alignment: .leading, spacing: 10) {
                    Text(Date(timeIntervalSince1970: Double(forecastElement.dt)), style: .time)
                        .font(.caption)
                    Text(forecastElement.main.feelsLike.roundDouble() + "°")
                        .font(.title2)
                        .bold()
                    
                }
                Spacer()
            }
        }
        .padding()
        .frame(width: 120, height: 130)
        .background(Color(.white).opacity(0.7))
        .cornerRadius(20)
        
    }
}

struct ForecastElement_Previews: PreviewProvider {
    static var previews: some View {
        ForecastElement(forecastElement: previewForecast.list[0])
            .previewLayout(.sizeThatFits)
            .padding()
            .background(.blue)
    }
}
