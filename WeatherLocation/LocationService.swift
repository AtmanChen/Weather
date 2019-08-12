//
//  LocationService.swift
//  LocationService
//
//  Created by 黄永乐 on 2019/8/11.
//  Copyright © 2019 黄永乐. All rights reserved.
//

import Foundation
import CoreLocation
import WeatherModels

public class LocationService: NSObject {
    
    public static let shared = LocationService()
    private override init() {
        super.init()
        locationManager.delegate = self
    }
    
    private let locationManager = CLLocationManager()
    private var completion: ((Result<Coordinate, Error>) -> Void)!
    
    public func startService(_ completion: @escaping (Result<Coordinate, Error>) -> Void) {
        self.completion = completion
        locationManager.requestLocation()
    }
    
}

extension LocationService: CLLocationManagerDelegate {
    
    public func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        completion(.failure(error))
        manager.stopUpdatingLocation()
    }
    
    public func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        manager.stopUpdatingLocation()
        if let location = locations.first {
            completion(.success(Coordinate(lat: location.coordinate.latitude, lon: location.coordinate.longitude)))
        }
        
    }
    
}
