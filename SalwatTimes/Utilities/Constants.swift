//
//  Constants.swift
//  SalwatTimes
//
//  Created by Yousef Mohamed on 12/02/2021.
//

import Foundation

struct Storyboards {
    static let prayersTimes = "prayersTimes"
    static let main = "Main"
}

struct ViewControllers {
    static let prayersTimesVC = "PrayersTimesVC"
}

// Cells
struct Cells {
    static let day = "Day"
}

struct UserDefaultsKeys {
    static let longitude = "LONGITUDE"
    static let latitude = "LATITUDE"
}
struct URLs {
    static let base = "http://api.aladhan.com/v1/calendar?"
}

// Header Keys
struct HeaderKeys {
    static let contentType = "Content-Type"
    static let accept = "accept"

}

struct ParameterKeys {
    static let latitude = "latitude"
    static let longitude = "longitude"
    static let month = "month"
    static let year = "year"
    static let method = "method"
}
