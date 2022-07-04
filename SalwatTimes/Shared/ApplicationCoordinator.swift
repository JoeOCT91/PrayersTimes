//
//  ApplicationCoordinator.swift
//  SalwatTimes
//
//  Created by Yousef Mohamed on 03/06/2022.
//

import UIKit
import Combine

fileprivate var ishAuthHasBeenFinished: Bool {
    get {
        return UserDefaultsManager.shared().userUId != nil
    }
}

fileprivate var splashHasBeenShowed: Bool = false

fileprivate enum LaunchInstructor {
    case splash, auth, main
    
    static func configure(isSplashWasShown: Bool = splashHasBeenShowed,
                          authFinished: Bool = ishAuthHasBeenFinished) -> LaunchInstructor {
        
        switch (isSplashWasShown ,authFinished) {
        case (false, _):
            return .splash
        case (true, false):
            return .auth
        case (true, true):
            return .main
        }
    }
}


class ApplicationCoordinator: BaseCoordinator {
    
    private var router: RouterProtocol
    private let coordinatorFactory: CoordinatorFactory
    
    private var instructor: LaunchInstructor {
        return LaunchInstructor.configure()
    }
    
    init(router: RouterProtocol, coordinatorFactory: CoordinatorFactory) {
        self.router = router
        self.coordinatorFactory = coordinatorFactory
    }
    
    override func start() {
        switch instructor {
        case .splash: runSplashFlow()
        case .auth: runAuthFlow()
        case .main: runMainFlow()
        }
    }
    
    private func runSplashFlow() {
        let coordinator = coordinatorFactory.createSplashCoordinator(router: router)
        coordinator.finishFlowPublisher.sink { [weak self] _ in
            guard let self = self else { return }
            splashHasBeenShowed = true
            self.start()
            self.removeDependency(coordinator)
        }.store(in: &subscriptions)
        addDependency(coordinator)
        coordinator.start()
    }
    
    func runAuthFlow() {
        let coordinator = coordinatorFactory.createAuthCoordinator(router: router)
        coordinator.finishFlowPublisher.sink { [weak self] _ in
            guard let self = self else { return }
            self.start()
            self.removeDependency(coordinator)
        }.store(in: &subscriptions)
        addDependency(coordinator)
        coordinator.start()
    }
    
    func runMainFlow() {
        let coordinator = coordinatorFactory.createTabBarCoordinator(router: router, coordinatorFactory: coordinatorFactory)
        addDependency(coordinator)
        coordinator.start()
    }
}
