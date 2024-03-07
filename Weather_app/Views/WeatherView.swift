//
//  WeatherView.swift
//  Weather_app
//
//  Created by dorra ben abdelwahed on 5/3/2024.
//

import SwiftUI

struct WeatherView: View {
    
    @ObservedObject var weatherVM = WeatherViewModel()
    
    var body: some View {
        
        VStack {
            
            if weatherVM.progress == 0 {
                ForEach(weatherVM.weathers, id: \.id) { weather in
                    VStack(alignment: .leading) {
                        
                        WeatherRow(weather: weather,
                                   weatherVM: weatherVM)
                        
                        Divider()
                    }
                }
                
                Spacer()
                
                // reset button
                Button {
                    weatherVM.weathers = []
                    weatherVM.fetchWeather()
                    weatherVM.displayMessages()
                } label: {
                    Text("Restart")
                        .foregroundColor(.white)
                        .bold()
                        .padding()
                        .background(Color("pink"))
                        .cornerRadius(10)
                        .shadow(color: Color.gray.opacity(0.5), radius: 5, x: 5, y: 5)
                }
                
            } else {
                
                Spacer()
                
                ProgressView(LocalizedStringKey(weatherVM.message), value: weatherVM.progress, total: 1)
                    .progressViewStyle(BarProgressStyle(height: 30))
                    .frame(maxWidth: .infinity, alignment: .bottom)
            }
        }
        .padding()
    }
}

struct WeatherView_Previews: PreviewProvider {
    static var previews: some View {
        WeatherView()
    }
}
