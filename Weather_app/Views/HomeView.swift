//
//  HomeView.swift
//  Weather_app
//
//  Created by dorra ben abdelwahed on 5/3/2024.
//

import SwiftUI

struct HomeView: View {
    
    var body: some View {
        
        VStack(spacing: 20) {
            
            Image("weather")
                .resizable()
                .frame(width: 200, height: 200)
                .padding(.bottom, 50)
            
            Text("Hi, tap the weather button to instantly uncover forecasts.")
                .foregroundColor(.purple)
                .multilineTextAlignment(.center)
                .font(.title)
            
            NavigationLink {
                WeatherView()
            } label: {
                Text("Weather")
                    .foregroundColor(.white)
                    .bold()
                    .padding()
                    .background(Color.purple.opacity(0.6))
                    .cornerRadius(10)
                    .shadow(color: Color.gray.opacity(0.5), radius: 5, x: 5, y: 5)
            }
        }
        .padding()
        
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
