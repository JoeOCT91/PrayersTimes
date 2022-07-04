//
//  AppDelegate.swift
//  SalwatTimes
//
//  Created by Yousef Mohamed on 11/02/2021.
//

import UIKit
import FirebaseCore
import FirebaseFirestore
import FirebaseAuth
import CoreLocation
import SwifterSwift
import Firebase



@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    var rootController: UINavigationController {
        return self.window!.rootViewController as! UINavigationController
    }
    private lazy var  applicationCoordinator: ApplicationCoordinator = self.createApplicationCoordinator()
    var locationManager = LoactionManger.shared()
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {

        FirebaseApp.configure()
        //setUITabBarAppearance()
        setUINavigationAppearance()
        

        let rootViewController = UINavigationController()
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = rootViewController
        window?.makeKeyAndVisible()
        applicationCoordinator.start()
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
    
    private func createApplicationCoordinator() -> ApplicationCoordinator {
        let router = Router(rootController: rootController)
        let coordinatorFactory = CoordinatorFactory()
        return ApplicationCoordinator(router: router, coordinatorFactory: coordinatorFactory)
    }
    
    private func setUITabBarAppearance() {
        let tabBarAppearance = UITabBarAppearance()
        let tabBarItemAppearance = UITabBarItemAppearance()

        let selectedTitleAttributes = [NSAttributedString.Key.font: UIFont(font: FontFamily.BahijTheSansArabic.semiBold, size: 12) as Any,
                                       NSAttributedString.Key.foregroundColor: ColorName.greenColor.color
        ]
        let normalTitlesAttributes = [NSAttributedString.Key.font: UIFont(font: FontFamily.BahijTheSansArabic.semiBold, size: 12) as Any,
                                      NSAttributedString.Key.foregroundColor: ColorName.lightGray.color
        ]
        
        tabBarItemAppearance.selected.titleTextAttributes = selectedTitleAttributes
        tabBarItemAppearance.normal.titleTextAttributes = normalTitlesAttributes

        tabBarAppearance.stackedLayoutAppearance = tabBarItemAppearance
        UITabBar.appearance().standardAppearance = tabBarAppearance
    }
    
    private func setUINavigationAppearance() {

        let navigationBarAppearance = UINavigationBarAppearance()
        navigationBarAppearance.configureWithTransparentBackground()

        

        let largeTitlesAttributes = [NSAttributedString.Key.font: UIFont(font: FontFamily.BahijTheSansArabic.semiBold, size: 16),
                                     NSAttributedString.Key.foregroundColor: ColorName.blackColor.color]
        let normalTitlesAttributes = [NSAttributedString.Key.font: UIFont(font: FontFamily.BahijTheSansArabic.semiBold, size: 16),
                                      NSAttributedString.Key.foregroundColor: ColorName.blackColor.color,
        ]

        navigationBarAppearance.titleTextAttributes = normalTitlesAttributes as [NSAttributedString.Key: Any]
        navigationBarAppearance.largeTitleTextAttributes = largeTitlesAttributes as [NSAttributedString.Key: Any]
        navigationBarAppearance.shadowColor = .clear

        UINavigationBar.appearance().standardAppearance = navigationBarAppearance
        UINavigationBar.appearance().scrollEdgeAppearance = navigationBarAppearance
    }
    
    
}

