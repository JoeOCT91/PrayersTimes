//
//  UserDefaultsManager.swift
//  SalwatTimes
//
//  Created by Yousef Mohamed on 12/02/2021.
//

import Foundation


class UserDefaultsManager {
    // MARK:- Singleton
    private static let sharedInstance = UserDefaultsManager()
    
    class func shared() -> UserDefaultsManager {
        return UserDefaultsManager.sharedInstance
    }
    
    
    // MARK:- Properties
    var longitude: String? {
        set {
            UserDefaults.standard.set(newValue, forKey: UserDefaultsKeys.longitude)
        }
        get {
            guard UserDefaults.standard.object(forKey: UserDefaultsKeys.longitude) != nil else {
                return nil
            }
            return  UserDefaults.standard.string(forKey: UserDefaultsKeys.longitude)!
        }
    }
    var latitude: String? {
        set {
            UserDefaults.standard.set(newValue, forKey: UserDefaultsKeys.latitude)
        }
        get {
            guard UserDefaults.standard.object(forKey: UserDefaultsKeys.latitude) != nil else {
                return nil
            }
            return  UserDefaults.standard.string(forKey: UserDefaultsKeys.latitude)!
        }
    }
}

