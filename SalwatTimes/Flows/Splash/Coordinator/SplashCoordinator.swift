//
//  SplashCoordinator.swift
//  SalwatTimes
//
//  Created by Yousef Mohamed on 25/06/2022.
//

import Combine

protocol SplashCoordinatorOutput: AnyObject {
    var finishFlowPublisher: PassthroughSubject<Void, Never> { get }
}


class SplashCoordinator: BaseCoordinator, SplashCoordinatorOutput {
    
    
    var finishFlowPublisher = PassthroughSubject<Void, Never>()
    
    private let factory: SplashModuleFactory
    private weak var router: RouterProtocol!
    
    init(router: RouterProtocol, factory: SplashModuleFactory) {
        self.factory = factory
        self.router = router
    }
    
    override func start() {
        showSplash()
    }
    
    //MARK: - Run current flow's controllers
    private func showSplash() {
        let splashOutPut = factory.createSplashOutput()
        splashOutPut.onCompleteSplashPublisher.sink { [weak self] _ in
            guard let self = self else { return }
            self.finishFlowPublisher.send()
        }.store(in: &subscriptions)
        router.setRootModule(splashOutPut, hideBar: true)
    }
}
