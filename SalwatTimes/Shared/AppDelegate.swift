//
//  AppDelegate.swift
//  SalwatTimes
//
//  Created by Yousef Mohamed on 11/02/2021.
//

import UIKit
import CoreLocation


@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    var locationManager = LoactionManger.shared()
    


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        getUserCurrentLocation()
        let prayersTimesVC = PrayersTimesVC.create()
        window?.rootViewController = prayersTimesVC
        return true
    }
    
    private func getUserCurrentLocation() {
        
        locationManager.requestAlwaysAuthorization() // Get location permisions
        locationManager.requestWhenInUseAuthorization() // Get location permisions
        //cheack if locations permisions are set and okay
        if CLLocationManager.locationServicesEnabled() {
            locationManager.desiredAccuracy = kCLLocationAccuracyNearestTenMeters
            //locationManager.startUpdatingLocation()
            let currentLocation = locationManager.location
            // Make sure is loactaion is set and not Nil
            if let currentLocation = currentLocation {
                UserDefaultsManager.shared().longitude = String(currentLocation.coordinate.longitude)
                UserDefaultsManager.shared().latitude = String(currentLocation.coordinate.latitude)
            }
        }
        
    }
    
    

}

