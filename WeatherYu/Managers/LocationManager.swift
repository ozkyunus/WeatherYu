//
//  LocationManager.swift
//  WeatherYu
//
//  Created by YUNUS EMRE ÖZKAYA on 22.07.2024.
//

import Foundation
import CoreLocation

class LocationManager: NSObject, ObservableObject, CLLocationManagerDelegate {
    let manager =  CLLocationManager()
    
    @Published var location: CLLocationCoordinate2D?
    @Published var isLoading = false
    
    override init() {
        super.init()
        manager.delegate = self
    }
    
    func requestLocation() {
        isLoading = true
        manager.requestLocation()
    }
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        location = locations.first?.coordinate
        isLoading = false
    }
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print("Konum bulunamadı.", error)
        isLoading = false
    }
}
