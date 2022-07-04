//
//  ModuleFactory.swift
//  SalwatTimes
//
//  Created by Yousef Mohamed on 25/06/2022.
//

import Foundation


final class ModuleFactory {
    

}

extension ModuleFactory: SplashModuleFactory {
    func createSplashOutput() -> SplashViewProtocol {
        let viewModel = SplashViewModel()
        let viewController = SplashController(viewModel: viewModel)
        return viewController
    }
}

extension ModuleFactory: AuthModuleFactory {

    func makeLoginOutput() -> LoginViewProtocol {
        return LoginViewController.create()
    }
        
    func makeRegisterHandler(viewModel: AuthenticationViewModelProtocol) -> RegisterViewProtocol {
        return RegisterViewController.create(viewModel: viewModel)
    }
}

extension ModuleFactory: TabBarModuleFactory {
    func createTabBarOutput() -> MainTabBarController {
        return MainTabBarController.create()
    }
}

extension ModuleFactory: PrayersTimesModuleFactory {
    func createPrayersTimesOutput() -> PrayersTimesControllerProtocol {
        let viewModel = PrayersTimesViewModel()
        return PrayersTimesController(viewModel: viewModel)
    }
}

extension ModuleFactory: PrayersAlarmsModuleFactory{
    func createPrayersAlarmsOutput() -> PrayersAlarmsController {
        let viewModel = PrayersAlarmsViewModel()
        return PrayersAlarmsController(viewModel: viewModel)
    }
}

extension ModuleFactory: compassModuleFactory {
    func createCompassOutput() -> CompassControllerProtocol {
        let viewModel = CompassViewModel()
        return CompassController(viewModel: viewModel)
    }
}

extension ModuleFactory: QuranRadioModuleFactory {
    func createQuranRadioOutput() -> QuranRadioControllerProtocol {
        let viewModel = QuranRadioViewModel()
        return QuranRadioController(viewModel: viewModel)
    }
}

extension ModuleFactory: SettingsModuleFactory {
    func createSettingsOutput() -> SettingsControllerProtocol {
        let viewModel = SettingsViewModel()
        return SettingsController(viewModel: viewModel)
    }
    func createPersonalInformationHandler() -> PersonalInformationViewProtocol {
        let viewModel = PersonalInformationViewModel()
        return PersonalInformationController(viewModel: viewModel)
    }
}
