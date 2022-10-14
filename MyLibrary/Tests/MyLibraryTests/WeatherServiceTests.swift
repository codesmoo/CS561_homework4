//
//  WeatherServiceTests.swift
//  
//
//  Created by SUNGHAK SONG on 10/13/22.
//

import XCTest
@testable import MyLibrary

final class WeatherServiceTests: XCTestCase {

    
    func testWeatherModel() {
        //Given
        let sut = WeatherServiceImpl()
        let mockJson = """
{
    "main": {
          "temp": 291.69,
          "feels_like": 291.51,
          "temp_min": 288.23,
          "temp_max": 293.48,
          "pressure": 1015,
          "humidity": 73
        }
}
""".data(using: .utf8)!
        
        //When
        let isTempDouble = sut.printTemp(weatherData: mockJson)
        //Then
        XCTAssertTrue(isTempDouble)
    }

}
