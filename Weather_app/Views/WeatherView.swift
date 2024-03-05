//
//  WeatherView.swift
//  Weather_app
//
//  Created by dorra ben abdelwahed on 5/3/2024.
//

import SwiftUI

struct WeatherView: View {
    
    @State private var progress = 0.4
    
    var body: some View {
        
        VStack {
            
            Spacer()
            
            ProgressView("Loading...", value: progress, total: 1)
                .progressViewStyle(BarProgressStyle(height: 30))
            
        }
        .padding()
    }
}

struct WeatherView_Previews: PreviewProvider {
    static var previews: some View {
        WeatherView()
    }
}
