//
//  HomeViewModel.swift
//  weatherAppBeta
//
//  Created by Kendall Poindexter on 5/25/20.
//  Copyright © 2020 Kendall Poindexter. All rights reserved.
//

import Foundation

class HomeViewModel {
    let locationManger = LocationManager()
    let networkManager = NetworkManager()
    var weatherInfo: WeatherData?
    
    private var latitude: Double {
        guard let latitude = locationManger.lat else { return 0}
        return latitude
    }
    
    private var longitude: Double {
        guard let longitude = locationManger.lon else { return 0}
        return longitude
    }
    
    func fetchWeatherData() {
        networkManager.fetchWeatherData(lat: latitude, lon: longitude) { result in
            switch result {
            case .success(let weatherData):
                self.weatherInfo = weatherData
            case .failure(let error):
                //mention that an alert or notification banner for this
                print(error)
            }
        }
    }
}
