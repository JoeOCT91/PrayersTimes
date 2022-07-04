//
//  PrayersTimesCoordinator.swift
//  SalwatTimes
//
//  Created by Yousef Mohamed on 01/07/2022.
//

import Foundation
import Combine

protocol PrayersTimesCoordinatorOutput: AnyObject {
    
}

final class PrayersTimesCoordinator: BaseCoordinator, PrayersTimesCoordinatorOutput {
    
    private let router: RouterProtocol
    private let factory: PrayersTimesModuleFactory
    
    init(router: RouterProtocol, factory: PrayersTimesModuleFactory) {
        self.router = router
        self.factory = factory
    }
    
    override func start() {
        self.showPrayersTime()
    }
    
    private func showPrayersTime() {
        let prayersTimesOutput = factory.createPrayersTimesOutput()
        router.setRootModule(prayersTimesOutput)
    }
}


