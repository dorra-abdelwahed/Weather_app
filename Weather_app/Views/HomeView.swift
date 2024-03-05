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
           
            Text("Bonjour, veuillez cliquer sur le bouton ci-dessous.")
                .multilineTextAlignment(.center)
                .bold()
            
            NavigationLink {
                WeatherView()
            } label: {
                Text("Commencez")
                    .foregroundColor(.white)
                    .bold()
                    .padding()
                    .background(Color.blue)
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
