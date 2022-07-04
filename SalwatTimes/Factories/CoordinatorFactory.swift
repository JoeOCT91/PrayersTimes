//
//  CoordinatorFactory.swift
//  SalwatTimes
//
//  Created by Yousef Mohamed on 25/06/2022.
//

import UIKit

final class CoordinatorFactory: CoordinatorFactoryProtocol {
    
    func createTabBarCoordinator(router:RouterProtocol, coordinatorFactory: MainCoordinatorFactory) -> Coordinator & TapBarCoordinatorOutput {
        let moduleFactory = ModuleFactory()
        let coordinator = TabBarCoordinator(router: router, factory: moduleFactory, coordinatorFactory: coordinatorFactory)
        return coordinator
    }

    func createSplashCoordinator(router: RouterProtocol) -> Coordinator & SplashCoordinatorOutput {
        let coordinator = SplashCoordinator(router: router, factory: ModuleFactory())
        return coordinator
    }
    
    func createAuthCoordinator(router: RouterProtocol) -> AuthCoordinatorOutput & Coordinator {
        let coordinator = AuthCoordinator(router: router, factory: ModuleFactory())
        return coordinator
    }

}

extension CoordinatorFactory: MainCoordinatorFactory {

    func createPrayersTimesCoordinator(navController: UINavigationController) -> Coordinator & PrayersTimesCoordinatorOutput {
        let router = router(navController)
        return PrayersTimesCoordinator(router: router, factory: ModuleFactory())
    }
    
    func createPrayersAlarmsCoordinator(navController: UINavigationController) -> Coordinator & PrayersAlarmCoordinatorOutput {
        let router = router(navController)
        return PrayersAlarmCoordinator(router: router, factory: ModuleFactory())
    }
    
    func createCompassCoordinator(navController: UINavigationController) -> Coordinator & CompassCoordinatorOutput {
        let router = router(navController)
        return CompassCoordinator(router: router, factory: ModuleFactory())
    }
    
    func createQuranRadioCoordinator(navController: UINavigationController) -> Coordinator & QuranRadioCoordinatorOutput {
        let router = router(navController)
        return QuranRadioCoordinator(router: router, factory: ModuleFactory())
    }
    
    func createSettingsCoordinator(navController: UINavigationController) -> Coordinator & SettingsCoordinatorOutput {
        let router: Router = router(navController)
        return SettingsCoordinator(router: router, factory: ModuleFactory())
    }
    
    private func router(_ navController: UINavigationController?) -> Router {
        return Router(rootController: navigationController(navController))
    }

    private func navigationController(_ navController: UINavigationController?) -> UINavigationController {
        if let navController = navController { return navController }
        else { return UINavigationController() }
    }
}
