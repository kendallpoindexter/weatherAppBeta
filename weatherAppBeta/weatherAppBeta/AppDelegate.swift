//
//  AppDelegate.swift
//  weatherAppBeta
//
//  Created by Kendall Poindexter on 5/25/20.
//  Copyright © 2020 Kendall Poindexter. All rights reserved.
//

import UIKit
import CoreLocation

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    let locationService = LocationService()


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        locationService.locationManager.delegate = self
        locationService.requestLocation()
        return true
    }
}

extension AppDelegate: CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let location = locations.last
        let latitude = location?.coordinate.latitude
        let longitude = location?.coordinate.longitude

        locationService.lat = latitude
        locationService.lon = longitude
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        // Refactor would be to add an alert here to show any potential errors upon app launch
        print(error)
    }
}

