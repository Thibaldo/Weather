//
//  DynamicWeatherIcon.swift
//  Weather
//
//  Created by Pro on 26/05/2022.
//

import SwiftUI

struct DynamicWeatherIcon: View {
    let description: String
    
    var body: some View {
        Image(systemName:  getWeatherIconName(description))
    }
}

func getWeatherIconName(_ description: String) -> String {
    switch description {
    case "Cloud":
        return "cloud"
    case "Drizzle":
        return "cloud.rain"
    case "Clear":
        return "sun.max"
    case "Rain":
        return "cloud.heavyrain"
    case "Thunderstorm":
        return "cloud.bolt.rain"
    case "Snow":
        return "cloud.snow"
    default:
        return "sun.max"
    }
}


struct DynamicWeatherIcon_Previews: PreviewProvider {
    static var previews: some View {
        DynamicWeatherIcon(description: "Snow")
            .padding()
            .previewLayout(.sizeThatFits)
    }
}
