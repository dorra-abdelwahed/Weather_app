//
//  WeatherViewModel.swift
//  Weather_app
//
//  Created by dorra ben abdelwahed on 6/3/2024.
//

import Foundation
import Combine

class WeatherViewModel: ObservableObject {
    
    @Published var weathers: [WeatherResponse] = []
    
    @Published var city: String = ""
    @Published var message: String = ""
    @Published var errorMessage: String = ""
    
    @Published private var currentCityIndex = 0 {
        didSet {
            progress = Double(currentCityIndex) * 0.2
        }
    }
    
    @Published var progress: Double = 0.0
    @Published private var currentMessageIndex = 0
    
    private var messageTimer: Timer?
    private var weatherTimer: Timer?
    private var cancellables: Set<AnyCancellable> = []
    
    init() {
        fetchWeather()
        displayMessages()
    }
    
    func displayMessages() {
        // Display initial message
        self.message = messages[self.currentMessageIndex]
        self.currentMessageIndex = (self.currentMessageIndex + 1) % messages.count
        
        messageTimer = Timer.scheduledTimer(withTimeInterval: 6, repeats: true) { [weak self] timer in
            guard let self = self else { return }
            self.message = messages[self.currentMessageIndex]
            self.currentMessageIndex = (self.currentMessageIndex + 1) % messages.count
        }
    }
    
    func fetchWeather() {
        // Fetch weather at time 0
        Task {
            await self.fetchWeatherForCurrentCity()
        }
        
        weatherTimer = Timer.scheduledTimer(withTimeInterval: 10, repeats: true) { [weak self] timer in
            guard let self = self else { return }
            Task {
                await self.fetchWeatherForCurrentCity()
            }
        }
    }
    
    private func fetchWeatherForCurrentCity() async {
        
        let currentCity = cities[currentCityIndex]
        await fetchWeatherForCity(currentCity)
        
        currentCityIndex += 1
        
        if currentCityIndex == cities.count {
            // reset
            currentCityIndex = 0
            message = ""
            stopTimers()
            
        }
        
    }
    
    func fetchWeatherForCity(_ city: String) async {
        
        let urlString = "\(BASE_URL)?appid=\(API_ID)&q=\(city)"
        guard let url = URL(string: urlString) else { return }
        let request = URLRequest(url: url)
        
        do {
            let response = try await NetworkManager().fetch(type: WeatherResponse.self, with: request)
            weathers.append(response)
        } catch(let error) {
            errorMessage = error.localizedDescription
        }
        
    }
    
    // Method to stop both timers
    func stopTimers() {
        messageTimer?.invalidate()
        messageTimer = nil
        weatherTimer?.invalidate()
        weatherTimer = nil
    }
    
    func imageForWeatherCondition(_ condition: MainEnum?) -> String {
            switch condition {
            case .clear:
                return "sun.max"
            case .clouds:
                return "cloud"
            case .rain:
                return "cloud.rain"
            case .snow:
                return "snow"
            case .none:
                return ""
            }
        }
}
