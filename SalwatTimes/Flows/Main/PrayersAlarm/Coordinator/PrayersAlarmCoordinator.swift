//
//  PrayersAlarmCoordinator.swift
//  SalwatTimes
//
//  Created by Yousef Mohamed on 01/07/2022.
//

import Foundation

protocol PrayersAlarmCoordinatorOutput: AnyObject {
    
}

final class PrayersAlarmCoordinator: BaseCoordinator, PrayersAlarmCoordinatorOutput {
    
    private let router: RouterProtocol
    private let factory: PrayersAlarmsModuleFactory
    
    init(router: RouterProtocol, factory: PrayersAlarmsModuleFactory) {
        self.router = router
        self.factory = factory
    }
    
    override func start() {
        showPrayersAlarmOutput()
    }
    
    private func showPrayersAlarmOutput() {
        let prayersAlarmsOutput = factory.createPrayersAlarmsOutput()
        router.setRootModule(prayersAlarmsOutput)
    }
}

