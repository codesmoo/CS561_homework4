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
        var returnValue = 0.0
        let decoder = JSONDecoder()
        let mockJson = """
{
    "main": {
          "temp": 290.6,
          "feels_like": 291.51,
          "temp_min": 288.23,
          "temp_max": 293.48,
          "pressure": 1015,
          "humidity": 73
        }
}
""".data(using: .utf8)!
        
        //When
        
        do{
            let tempData = try decoder.decode(Weather.self, from: mockJson)
            print("temp : \(tempData.main.temp)")
            returnValue = tempData.main.temp
        }catch{
            print(error)
        }
        
        //Then
        XCTAssertEqual(returnValue, 290.6)
    }
    
    func testWeatherServerResponse() async {
        //Given
        let sut = WeatherServiceImpl()
        let mockTemp = Int(291)
        //When 
        do{
            let realTemp = try await sut.getTemperature()
            //Then
            XCTAssertEqual(realTemp, mockTemp)
        }catch{
            print(error)
        }
    }

}
