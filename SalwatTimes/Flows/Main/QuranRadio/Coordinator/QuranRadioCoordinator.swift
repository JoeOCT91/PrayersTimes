//
//  QuranRadioCoordinator.swift
//  SalwatTimes
//
//  Created by Yousef Mohamed on 01/07/2022.
//

import Foundation

protocol QuranRadioCoordinatorOutput: AnyObject {
    
}

final class QuranRadioCoordinator: BaseCoordinator, QuranRadioCoordinatorOutput {
    
    private let router: RouterProtocol
    private let factory: SettingsModuleFactory
    
    init(router: RouterProtocol, factory: SettingsModuleFactory) {
        self.router = router
        self.factory = factory
    }
    
    override func start() {

    }

}

