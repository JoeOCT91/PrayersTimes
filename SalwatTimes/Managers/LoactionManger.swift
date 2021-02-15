//
//  LoactionManger.swift
//  SalwatTimes
//
//  Created by Yousef Mohamed on 15/02/2021.
//

import Foundation
import CoreLocation

class LoactionManger {
    // MARK:- Singleton
    private static let sharedInstance = CLLocationManager()
    
    class func shared() -> CLLocationManager {
        return LoactionManger.sharedInstance
    }
}
