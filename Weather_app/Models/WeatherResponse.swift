//
//  WeatherResponse.swift
//  Weather_app
//
//  Created by dorra ben abdelwahed on 5/3/2024.
//

import Foundation

struct WeatherResponse: Codable {
    
    let id: Int
    let date: Date
    let main: Main
    let weather: [Weather]
    let coord: Coord
    let name: String
    
    enum CodingKeys: String, CodingKey {
        case id
        case date = "dt"
        case main
        case weather
        case coord
        case name
    }
    
}

struct Coord: Codable{
    
    let lon: Double
    let lat: Double
}


struct Weather: Codable {
    let main: MainEnum
    let weatherDescription: String
    let icon : String?
    
    enum CodingKeys: String, CodingKey {
        case main
        case weatherDescription = "description"
        case icon
    }
}

enum MainEnum: String, Codable {
    case clear = "Clear"
    case clouds = "Clouds"
    case rain = "Rain"
    case snow = "Snow"
}



struct Main: Codable {
    let temperature: Double
    let humidity: Int
    let maxTemperature: Double
    let minTemperature: Double
    let feelsTemperature: Double
    let pressure: Double
    
    enum CodingKeys: String, CodingKey {
        case temperature = "temp"
        case humidity
        case maxTemperature = "temp_max"
        case minTemperature = "temp_min"
        case feelsTemperature = "feels_like"
        case pressure
    }
}
