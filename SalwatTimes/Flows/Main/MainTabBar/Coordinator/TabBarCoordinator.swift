//
//  File.swift
//  SalwatTimes
//
//  Created by Yousef Mohamed on 30/06/2022.
//

import UIKit
import Combine

protocol TapBarCoordinatorOutput: AnyObject {
    
}

final class TabBarCoordinator: BaseCoordinator, TapBarCoordinatorOutput {
    
    private var factory: TabBarModuleFactory
    private weak var router: RouterProtocol!
    private weak var coordinatorFactory: MainCoordinatorFactory!
    
    init(router: RouterProtocol, factory: TabBarModuleFactory, coordinatorFactory: MainCoordinatorFactory) {
        self.coordinatorFactory = coordinatorFactory
        self.router  = router
        self.factory = factory
    }

    override func start() {
        let tabBarOutput = factory.createTabBarOutput()
        let outputsFunctions = [setPrayersTimesFlow, setAlarmFlow, setCompassFlow, setQuranRadioFlow, setSettingsFlow]
        tabBarOutput.tabBarNavControllersPublisher.compactMap{ $0 }.sink { navControllers in
            for (index, navController) in navControllers.enumerated() {
                if index < outputsFunctions.count {
                    outputsFunctions[index](navController)
                }
            }
        }.store(in: &subscriptions)
        
        router.setRootModule(tabBarOutput, hideBar: true)
    }

    private func setPrayersTimesFlow(navController: UINavigationController) {
        let coordinator = coordinatorFactory.createPrayersTimesCoordinator(navController: navController)
        addDependency(coordinator)
        coordinator.start()
    }
    
    private func setAlarmFlow(navController: UINavigationController) {
        let coordinator = coordinatorFactory.createPrayersAlarmsCoordinator(navController: navController)
        addDependency(coordinator)
        coordinator.start()
    }
    
    private func setCompassFlow(navController: UINavigationController) {
        let coordinator = coordinatorFactory.createCompassCoordinator(navController: navController)
        addDependency(coordinator)
        coordinator.start()
    }

    private func setQuranRadioFlow(navController: UINavigationController) {
        let coordinator = coordinatorFactory.createQuranRadioCoordinator(navController: navController)
        addDependency(coordinator)
        coordinator.start()
    }
    
    private func setSettingsFlow(navController: UINavigationController) {
        let coordinator = coordinatorFactory.createSettingsCoordinator(navController: navController)
        addDependency(coordinator)
        coordinator.start()
    }
}
