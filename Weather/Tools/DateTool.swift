//
//  DateTool.swift
//  Weather
//
//  Created by Pro on 26/05/2022.
//

import Foundation

func getLocaleFormatter() -> DateFormatter {
    let dateFormatter = DateFormatter()
    
    dateFormatter.locale = Locale(identifier: Locale.preferredLanguages[0])
    
    return dateFormatter
}

func getCurrentDate() -> String {
    let now = Date()
    let dateFormatter = getLocaleFormatter()
    dateFormatter.dateStyle = .medium
    
    return dateFormatter.string(from: now)
}

func getFormattedHour(_ date: Date) -> String {
    let dateFormatter = getLocaleFormatter()
    dateFormatter.timeStyle = .short
    
    return dateFormatter.string(from: date)
}
