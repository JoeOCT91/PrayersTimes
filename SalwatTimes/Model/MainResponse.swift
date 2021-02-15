//
//  MainResponse.swift
//  SalwatTimes
//
//  Created by Yousef Mohamed on 12/02/2021.
//
import Foundation

// MARK: - Welcome
struct MainResponse: Codable {
    let code: Int
    let status: String
    let monthData: [PrayersData]
    
    enum CodingKeys: String, CodingKey {
        case code
        case status
        case monthData = "data"
    }
}

// MARK: - Datum
struct PrayersData: Codable {
    let timings: Timings
    let date: DateClass
}

// MARK: - DateClass
struct DateClass: Codable {
    let readable: String
    let timestamp: String
    let gregorian: Gregorian
}

// MARK: - Gregorian Calandar
struct Gregorian: Codable {
    let date: String
    let format: String
    let day: String
    let weekday: GregorianWeekday
    let month: GregorianMonth
    let year: String
}

// MARK: - Designation
struct Designation: Codable {
    let abbreviated: Abbreviated
    let expanded: Expanded
}

enum Abbreviated: String, Codable {
    case ad = "AD"
    case ah = "AH"
}

enum Expanded: String, Codable {
    case annoDomini = "Anno Domini"
    case annoHegirae = "Anno Hegirae"
}


// MARK: - GregorianMonth
struct GregorianMonth: Codable {
    let number: Int
    let en: String
}

// MARK: - GregorianWeekday
struct GregorianWeekday: Codable {
    let en: String
}



// MARK: - Params
struct Params: Codable {
    let fajr, isha: Double

    enum CodingKeys: String, CodingKey {
        case fajr = "Fajr"
        case isha = "Isha"
    }
}

enum MidnightMode: String, Codable {
    case standard = "STANDARD"
}

enum Timezone: String, Codable {
    case africaCairo = "Africa/Cairo"
}



enum Dhuhr: String, Codable {
    case the1208Eet = "12:08 (EET)"
    case the1209Eet = "12:09 (EET)"
}


