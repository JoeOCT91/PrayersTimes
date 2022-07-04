//
//  CompassCoordinator.swift
//  SalwatTimes
//
//  Created by Yousef Mohamed on 01/07/2022.
//

import Foundation

protocol CompassCoordinatorOutput: AnyObject {
    
}

final class CompassCoordinator: BaseCoordinator, CompassCoordinatorOutput {
    
    private let router: RouterProtocol
    private let factory: compassModuleFactory
    
    init(router: RouterProtocol, factory: compassModuleFactory) {
        self.router = router
        self.factory = factory
    }
    
    override func start() {
        showCompassFlow()
    }
    
    private func showCompassFlow() {
        print("showCompassFlow")
        let compassOutput = factory.createCompassOutput()
        self.router.setRootModule(compassOutput)
    }
}

