//
//  compassModuleFactory.swift
//  SalwatTimes
//
//  Created by Yousef Mohamed on 01/07/2022.
//

import Foundation

protocol compassModuleFactory {
    func createCompassOutput() -> CompassControllerProtocol
}
