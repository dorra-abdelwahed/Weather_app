//
//  WeatherViewModelTests.swift
//  Weather_appTests
//
//  Created by dorra ben abdelwahed on 7/3/2024.
//

import XCTest
@testable import Weather_app

final class WeatherViewModelTests: XCTestCase {
    
    var sut: WeatherViewModel!
    
    override func setUpWithError() throws {
        sut = WeatherViewModel()
    }
    
    override func tearDownWithError() throws {
        sut = nil
    }
    
    func testImageForWeatherCondition() {
        
        let clearCondition: MainEnum = .clear
        let cloudyCondition: MainEnum = .clouds
        let rainCondition: MainEnum = .rain
        let snowCondition: MainEnum = .snow
        
        let clearImage = sut.imageForWeatherCondition(clearCondition)
        let cloudyImage = sut.imageForWeatherCondition(cloudyCondition)
        let rainImage = sut.imageForWeatherCondition(rainCondition)
        let snowImage = sut.imageForWeatherCondition(snowCondition)
        
        XCTAssertEqual(clearImage, "sun.max")
        XCTAssertEqual(cloudyImage, "cloud")
        XCTAssertEqual(rainImage, "cloud.rain")
        XCTAssertEqual(snowImage, "snow")
    }
    
    func testFetchWeather() {
        
        let expectation = expectation(description: "Weather fetched periodically")
        
        sut.fetchWeather()
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 10) {
            
            let weathersCount = self.sut.weathers.count
            
            XCTAssertEqual(weathersCount, 2)
            
            expectation.fulfill()
        }
        
        waitForExpectations(timeout: 15) { error in
            XCTAssertNil(error, "Error: \(error!.localizedDescription)")
        }
    }
    
    func testFetchWeatherForCurrentCity() {
        
        let expectation = expectation(description: "Weather fetched for the current city")
        sut.currentCityIndex = 0
        
        sut.fetchWeatherForCurrentCity()
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            XCTAssertEqual(self.sut.currentCityIndex, 1)
            
            expectation.fulfill()
        }
        
        waitForExpectations(timeout: 5) { error in
            XCTAssertNil(error, "Error: \(error!.localizedDescription)")
        }
    }
    
    
    func testDisplayMessages() {
        
        let expectation = expectation(description: "Display messages periodically")
        
        sut.displayMessages()
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 6) {
            
            XCTAssertNotNil(self.sut.message)
            
            expectation.fulfill()
        }
        
        waitForExpectations(timeout: 15) { error in
            XCTAssertNil(error, "Error: \(error!.localizedDescription)")
        }
    }
}
