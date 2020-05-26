//
//  LocationService .swift
//  weatherAppBeta
//
//  Created by Kendall Poindexter on 5/25/20.
//  Copyright © 2020 Kendall Poindexter. All rights reserved.
//

import CoreLocation

class LocationManager {
    let locationManager = CLLocationManager()
    var lat: Double?
    var lon: Double? 
    
    func requestLocation() {
        requestUserAuthorization {
            locationManager.requestLocation()
        }
    }
    
    private func requestUserAuthorization(completion: () -> Void) {
        locationManager.requestWhenInUseAuthorization()
        completion()
    }
}
