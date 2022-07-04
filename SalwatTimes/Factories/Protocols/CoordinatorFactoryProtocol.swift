//
//  CoordinatorFactoryProtocol.swift
//  SalwatTimes
//
//  Created by Yousef Mohamed on 25/06/2022.
//

import UIKit

protocol CoordinatorFactoryProtocol: AnyObject {
    func createSplashCoordinator(router: RouterProtocol) -> Coordinator & SplashCoordinatorOutput
//    func createOnboardingCoordinator(router: RouterProtocol) -> Coordinator & OnboardingCoordinatorOutput
    func createAuthCoordinator(router: RouterProtocol) -> Coordinator & AuthCoordinatorOutput
    func createTabBarCoordinator(router:RouterProtocol, coordinatorFactory: MainCoordinatorFactory) -> Coordinator & TapBarCoordinatorOutput
}

protocol MainCoordinatorFactory: AnyObject  {
    func createPrayersTimesCoordinator(navController: UINavigationController) -> Coordinator & PrayersTimesCoordinatorOutput
    func createPrayersAlarmsCoordinator(navController: UINavigationController) -> Coordinator & PrayersAlarmCoordinatorOutput
    func createCompassCoordinator(navController: UINavigationController) -> Coordinator & CompassCoordinatorOutput
    func createQuranRadioCoordinator(navController: UINavigationController) -> Coordinator & QuranRadioCoordinatorOutput
    func createSettingsCoordinator(navController: UINavigationController) -> Coordinator & SettingsCoordinatorOutput
}
