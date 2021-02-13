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


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        let prayersTimesVC = PrayersTimesVC.create()
        window?.rootViewController = prayersTimesVC
        return true
    }

}

