//
//  WeatherRow.swift
//  Weather_app
//
//  Created by dorra ben abdelwahed on 7/3/2024.
//

import SwiftUI

struct WeatherRow: View {
    
    let weather: WeatherResponse
    @ObservedObject var weatherVM: WeatherViewModel

    var body: some View {
        
        HStack {
            
            Text("\(weather.name)")
                .bold()
            
            Spacer()
            
            HStack(spacing: 20) {
                // Convert Kelvin to Celsius
                Text("\(String(format: "%.0f°", weather.main.temperature - 273.15))")
                
                Image(systemName: weatherVM.imageForWeatherCondition(weather.weather.first?.main))
                    .resizable()
                    .scaledToFit()
                    .frame(width: 25, height: 25)
            }
        }
        .padding()
        
    }
}

//struct WeatherRow_Previews: PreviewProvider {
//    static var previews: some View {
//        WeatherRow(weather: <#WeatherResponse#>, weatherVM: <#WeatherViewModel#>)
//    }
//}
