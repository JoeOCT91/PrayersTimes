//
//  Timings.swift
//  SalwatTimes
//
//  Created by Yousef Mohamed on 12/02/2021.
//

import Foundation

// MARK: - Timings
struct Timings: Codable {
    let fajr: String
    let dhuhr: String
    let asr, maghrib, isha: String

    enum CodingKeys: String, CodingKey {
        case fajr = "Fajr"
        case dhuhr = "Dhuhr"
        case asr = "Asr"
        case maghrib = "Maghrib"
        case isha = "Isha"
    }
}
