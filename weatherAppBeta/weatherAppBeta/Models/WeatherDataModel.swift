//
//  WeatherDataModel.swift
//  weatherAppBeta
//
//  Created by Kendall Poindexter on 5/25/20.
//  Copyright © 2020 Kendall Poindexter. All rights reserved.
//

import Foundation

struct WeatherData: Decodable {
    let name: String
    let weather: [Weather]
    let main: Main
}

struct Weather: Decodable {
    let description: String
    let icon: String
}

struct Main: Decodable {
    let temp: Double
    let lowTemp: Double
    let highTemp: Double
    
    enum CodingKeys: String, CodingKey {
        case temp
        case lowTemp = "temp_min"
        case highTemp = "temp_max"
    }
}
