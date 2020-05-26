//
//  NetworkManager.swift
//  weatherAppBeta
//
//  Created by Kendall Poindexter on 5/25/20.
//  Copyright © 2020 Kendall Poindexter. All rights reserved.
//

import Foundation

struct NetworkManager {
    
    func fetchWeatherData(lat: Double, lon: Double, completion: @escaping (Result<WeatherData, Error>) -> Void) {
        //Refactor to abstract api key from code
        let urlString = "https://api.openweathermap.org/data/2.5/weather?lat=\(lat)&lon=\(lon)&units=imperial&appid=5eae362e1dbc9c3adc8bd6e4825e9a5a"
        
        fetchObjectFromData(with: urlString, type: WeatherData.self) { result in
            switch result {
            case .success(let weatherData):
                completion(.success(weatherData))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
    
    private func fetchObjectFromData<T: Decodable>(with urlString: String,
                                                   type: T.Type,
                                                   completion: @escaping (Result<T, Error>) -> Void) {
        guard let url = URL(string: urlString) else { return }
        let session = URLSession(configuration: .default)
        let task = session.dataTask(with: url) { (data, response, error) in
            if let error = error {
                completion(.failure(error))
            }else if let httpResponse = response as? HTTPURLResponse,
                200...299 ~= httpResponse.statusCode,
                let data = data {
                do {
                    let decodedData = try self.decodeData(data: data, type: type)
                    completion(.success(decodedData))
                }catch {
                    completion(.failure(error))
                }
            }
        }
        
        task.resume()
    }
    private func decodeData<T: Decodable>(data: Data, type: T.Type) throws -> T {
        let decoder = JSONDecoder()
        let data = try decoder.decode(type, from: data)
        
        return data
    }
}
