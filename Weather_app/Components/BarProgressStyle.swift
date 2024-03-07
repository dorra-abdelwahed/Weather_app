//
//  BarProgressStyle.swift
//  Weather_app
//
//  Created by dorra ben abdelwahed on 5/3/2024.
//

import SwiftUI

struct BarProgressStyle: ProgressViewStyle {
    
    var color: Color = Color("pink")
    var height: Double = 20.0
    
    func makeBody(configuration: Configuration) -> some View {
        
        let progress = configuration.fractionCompleted ?? 0.0
        
        GeometryReader { geometry in
            
            VStack(alignment: .leading) {
                
                Spacer() // Add Spacer to push the progress bar to the bottom
                
                configuration.label
                    .font(.body)
                
                ZStack(alignment: .leading) {
                    
                    RoundedRectangle(cornerRadius: 10.0)
                        .opacity(0.2)
                        .frame(height: height)
                        .frame(width: geometry.size.width)
                    
                    RoundedRectangle(cornerRadius: 10.0)
                        .fill(color)
                        .frame(height: height)
                        .frame(width: geometry.size.width * progress)
                        .overlay {
                            Text("\(Int(progress * 100))%")
                                .foregroundColor(.white)
                                .bold()
                                .padding(.horizontal, 4)
                        }
                }
            }
        }
    }
}

struct BarProgressStyle_Previews: PreviewProvider {
    static var previews: some View {
        WeatherView()
    }
}
