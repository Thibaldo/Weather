//
//  ForecastListView.swift
//  Weather
//
//  Created by Pro on 27/05/2022.
//

import SwiftUI

struct ForecastListView: View {
    var forecast: ForecastResponse
    @State var selectedDay = Date()
    
    static let taskDateFormat: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateStyle = .short
        return formatter
    }()
    
    var body: some View {
        VStack {
            HStack {
                ForEach(0...5, id: \.self) { day in
                    Button(action: {
                        selectedDay = getOffsetDate(day)
                    }) {
                        ZStack {
                            Text(getOffsetDate(day), formatter: Self.taskDateFormat)
                                .font(.system(size: 10))
                                .foregroundColor(.primary)
                        }
                    }
                    .frame(height: 20)
                    .padding(.vertical, 5)
                    .padding(.horizontal, 10)
                    .overlay(
                        RoundedRectangle(cornerRadius: 20)
                            .stroke(selectedDay.hasSame(.day, as: getOffsetDate(day)) ? .secondary : .primary, lineWidth: 2)
                    )
                    
                    
                }
            }
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 20) {
                    ForEach(getSelectedDayData(selectedDay)) { element in
                        ForecastElement(forecastElement: element)
                    }
                }
                .padding()
            }
        }
    }
    
    func getOffsetDate(_ offset: Int) -> Date {
        return Calendar.current.date(byAdding: .day, value: offset, to: Date()) ?? Date()
    }
    
    
    func getSelectedDayData(_ selectedDate: Date) -> [ForecastResponse.ForecastElementResponse] {
        return forecast.list.filter{ element in
            let date = Date(timeIntervalSince1970: Double(element.dt))
            
            return Calendar.current.isDate(selectedDate, equalTo: date, toGranularity: .day)
        }
    }
}



struct ForecastListView_Previews: PreviewProvider {
    static var previews: some View {
        ForecastListView(forecast: previewForecast)
            .background(.blue)
    }
}
