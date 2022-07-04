//
//  LoginController.swift
//  SalwatTimes
//
//  Created by Yousef Mohamed on 25/06/2022.
//

import UIKit
import Combine
import CombineCocoa

protocol LoginViewProtocol: BaseController {
    var onCompleteAuthPublisher: PassthroughSubject<Void, Never> { get }
    var onRegisterButtonTapPublisher: PassthroughSubject<AuthenticationViewModelProtocol, Never> { get }
}

final class LoginViewController: UIViewController, LoginViewProtocol {

    // coordinator controller handler
    var onCompleteAuthPublisher = PassthroughSubject<Void, Never>()
    var onRegisterButtonTapPublisher = PassthroughSubject<AuthenticationViewModelProtocol, Never>()

    private var loginView: LoginView!
    private var viewModel: AuthenticationViewModelProtocol!
    private var subscriptions = Set<AnyCancellable>()

    override func loadView() {
        let loginView = LoginView()
        self.loginView = loginView
        self.view = loginView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        bindUserInterActionsAndDateFlows()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.isNavigationBarHidden = true
//        loginView.passwordTextField.text = nil
//        loginView.usernameTextField.text = nil
        self.loginView.setErrorLabel(errorValue: nil, errorState: false)
    }

    class func create() -> LoginViewProtocol {
        let viewController = LoginViewController()
        let viewModel = AuthenticationViewModel()
        viewController.viewModel = viewModel
        return viewController
    }
}

extension LoginViewController {

    private func bindUserInterActionsAndDateFlows() {
        bindToPasswordTextField()
        bindToEmailTextField()
        bindToLoginButtonTap()

        bindToRegisterButtonTap()
        bindToSuccessfulAuth()
        bindToLoadingStatus()
        bindToAuthErrors()
    }

    private func bindToLoginButtonTap() {
        loginView.loginButton.tapPublisher.sink { [weak self] _ in
            guard let self = self else { return }
            self.viewModel.performLogin()
        }.store(in: &subscriptions)
    }

    private func bindToRegisterButtonTap() {
        loginView.registerButton.tapPublisher.sink { [weak self] _ in
            guard let self = self else { return }
            self.onRegisterButtonTapPublisher.send(self.viewModel)
        }.store(in: &subscriptions)
    }

    private func bindToEmailTextField() {
        loginView.emailTextField.textPublisher
            .compactMap({$0})
            .assign(to: \.email, on: viewModel).store(in: &subscriptions)
    }

    private func bindToPasswordTextField() {
        loginView.passwordTextField.textPublisher
            .compactMap({$0})
            .assign(to: \.password, on: viewModel).store(in: &subscriptions)
    }

    private func bindToSuccessfulAuth() {
        viewModel.successAuthPublisher.sink { [weak self] _ in
            guard let self = self else { return }
            self.onCompleteAuthPublisher.send()
        }.store(in: &subscriptions)
    }
    
    private func bindToLoadingStatus() {
//        viewModel.isLoadingPublisher.sink { [weak self] state in
//            guard let self = self else { return }
//            self.loginView.setActivityIndicator = state
//        }.store(in: &subscriptions)
    }

    private func bindToAuthErrors() {
        viewModel.errorPublisher.sink { [weak self] error in
            guard let self = self else { return }
            self.showAlert(title: "error", message: error.localizedDescription)
        }.store(in: &subscriptions)
    }
}
