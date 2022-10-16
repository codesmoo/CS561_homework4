import Alamofire
import Foundation

public protocol WeatherService {
    func getTemperature() async throws -> Int
}

class WeatherServiceImpl: WeatherService {
    enum baseURL: String {
        case real = "https://api.openweathermap.org"
        case mock = "http://localhost:3000"
    }
    
    let url = "\(baseURL.real.rawValue)/data/2.5/weather?q=corvallis&units=imperial&appid=<appID>"
    func getTemperature() async throws -> Int {
        return try await withCheckedThrowingContinuation { continuation in
            AF.request(url, method: .get).validate(statusCode: 200..<300).responseDecodable(of: Weather.self) { response in
                switch response.result {
                case let .success(weather):
                    let temperature = weather.main.temp
                    let temperatureAsInteger = Int(temperature)
                    continuation.resume(with: .success(temperatureAsInteger))

                case let .failure(error):
                    continuation.resume(with: .failure(error))
                }
            }
        }
    }
    
    func printTemp(weatherData: Data) -> Double{
        var returnValue = 0.0
        let decoder = JSONDecoder()
        do{
            let tempData = try decoder.decode(Weather.self, from: weatherData)
            print("temp : \(tempData.main.temp)")
            returnValue = tempData.main.temp
        }catch{
            print(error)
        }
        
        return returnValue
    }
}

private struct Weather: Decodable {
    let main: Main

    struct Main: Decodable {
        let temp: Double
    }
}
