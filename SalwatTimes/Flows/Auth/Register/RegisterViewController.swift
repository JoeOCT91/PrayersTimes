//
//  File.swift
//  SalwatTimes
//
//  Created by Yousef Mohamed on 26/06/2022.
//

import UIKit
import Combine

protocol RegisterViewProtocol: BaseController {
    var onRegisterComplete: (() -> Void)? { get set }
}

class RegisterViewController: UIViewController, RegisterViewProtocol {

    // controller handler
    var onRegisterComplete: (() -> Void)?
    var onCompleteAuth: (() -> Void)?
    var onSignUpButtonTap: (() -> Void)?

    // ----------------------------------------------------------------------------------------------------------------
    // MARK: - Properties ...
    // ----------------------------------------------------------------------------------------------------------------
    private var subscriptions = Set<AnyCancellable>()
    private weak var viewModel: AuthenticationViewModelProtocol!
    private var registerView: RegisterView!

    // ----------------------------------------------------------------------------------------------------------------
    // MARK: - Lift cycle methods ...
    // ----------------------------------------------------------------------------------------------------------------
    override func loadView() {
        let registerView = RegisterView()
        self.registerView = registerView
        self.view = registerView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        //title = L10n.register
        bindUserInterActionsAndDateFlows()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.isNavigationBarHidden = false
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.isNavigationBarHidden = true
        navigationController?.navigationBar.isTranslucent = true
    }

    // ----------------------------------------------------------------------------------------------------------------
    // MARK: - Public methods ...
    // ----------------------------------------------------------------------------------------------------------------
    class func create(viewModel: AuthenticationViewModelProtocol) -> RegisterViewProtocol {
        let viewController = RegisterViewController()
        viewController.viewModel = viewModel
        return viewController
    }
}

extension RegisterViewController {
    
    private func bindUserInterActionsAndDateFlows() {
        bindToLoadingPublisher()
        bindToTextFields()
        bindToRegisterTap()
    }

    private func bindToLoadingPublisher() {
        viewModel.isLoadingPublisher.sink { [weak self] state in
            guard let self = self else { return }
            //  self.registerView.setActivityIndicator = state
        }.store(in: &subscriptions)
    }
    
    private func bindToRegisterTap() {
        registerView.registerButton.tapPublisher.sink { [weak self] _ in
            guard let self = self else { return }
            self.viewModel.performRegister()
        }.store(in: &subscriptions)
    }

    private func bindToTextFields() {
        registerView.firstNameTextField.textPublisher.compactMap({$0}).assign(to: \.firstName, on: viewModel).store(in: &subscriptions)
        registerView.lastNameTextField.textPublisher.compactMap({$0}).assign(to: \.lastName, on: viewModel).store(in: &subscriptions)
        registerView.emailTextField.textPublisher.compactMap({$0}).assign(to: \.email, on: viewModel).store(in: &subscriptions)
        registerView.passwordTextField.textPublisher.compactMap({$0}).assign(to: \.password, on: viewModel).store(in: &subscriptions)
        registerView.rePasswordTextField.textPublisher.compactMap({$0}).assign(to: \.rePassword, on: viewModel).store(in: &subscriptions)
        registerView.mobileNumberTextfield.textPublisher.compactMap({$0}).assign(to: \.mobile, on: viewModel).store(in: &subscriptions)
        registerView.countryTextfield.textPublisher.compactMap({$0}).assign(to: \.country, on: viewModel).store(in: &subscriptions)
        registerView.cityTextField.textPublisher.compactMap({$0}).assign(to: \.city, on: viewModel).store(in: &subscriptions)
    }
}
