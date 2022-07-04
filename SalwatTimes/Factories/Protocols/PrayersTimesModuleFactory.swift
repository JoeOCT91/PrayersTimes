//
//  PrayersTimesModuleFactory.swift
//  SalwatTimes
//
//  Created by Yousef Mohamed on 01/07/2022.
//

import Foundation

protocol PrayersTimesModuleFactory {
    func createPrayersTimesOutput() -> PrayersTimesControllerProtocol
}
