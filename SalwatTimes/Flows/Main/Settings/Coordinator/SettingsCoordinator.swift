//
//  File.swift
//  SalwatTimes
//
//  Created by Yousef Mohamed on 01/07/2022.
//

import Foundation

protocol SettingsCoordinatorOutput: AnyObject {
    
}

final class SettingsCoordinator: BaseCoordinator, SettingsCoordinatorOutput {
    
    private let router: RouterProtocol
    private let factory: SettingsModuleFactory
    
    init(router: RouterProtocol, factory: SettingsModuleFactory) {
        self.router = router
        self.factory = factory
    }
    
    override func start() {
        let settingsOutput = factory.createSettingsOutput()
        settingsOutput.onUserInformationTapPublisher.sink { [weak self] _ in
            guard let self = self else { return }
            self.pushPersonalInformation()
        }.store(in: &subscriptions)
        router.setRootModule(settingsOutput)
    }
    
    private func pushPersonalInformation() {
        let personalInformationHandler = factory.createPersonalInformationHandler()
        router.push(personalInformationHandler)
    }
}

