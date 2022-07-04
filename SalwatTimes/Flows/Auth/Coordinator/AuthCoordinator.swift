//
//  AuthCoordinator.swift
//  SalwatTimes
//
//  Created by Yousef Mohamed on 25/06/2022.
//

import Foundation
import Combine

protocol AuthCoordinatorOutput: AnyObject {
    var finishFlowPublisher: PassthroughSubject<Void, Never> { get }
}

final class AuthCoordinator: BaseCoordinator, AuthCoordinatorOutput {

    var finishFlowPublisher =  PassthroughSubject<Void, Never>()

    private let factory: AuthModuleFactory
    private let router: RouterProtocol

    init(router: RouterProtocol, factory: AuthModuleFactory) {
        self.factory = factory
        self.router = router
    }

    override func start() {
        showLogin()
    }

    // MARK: - Run current flow's controllers
    private func showLogin() {
        let loginOutput = factory.makeLoginOutput()
        loginOutput.onCompleteAuthPublisher.sink { [weak self] in
            guard let self = self else { return }
            self.finishFlowPublisher.send()
        }.store(in: &subscriptions)
        loginOutput.onRegisterButtonTapPublisher.sink { [weak self] viewModel in
            self?.showRegister(with: viewModel)
        }.store(in: &subscriptions)
        router.setRootModule(loginOutput, hideBar: true)
    }

    private func showRegister(with viewModel: AuthenticationViewModelProtocol) {
        let registerHandler = factory.makeRegisterHandler(viewModel: viewModel)
        router.push(registerHandler, animated: true)
    }
}
