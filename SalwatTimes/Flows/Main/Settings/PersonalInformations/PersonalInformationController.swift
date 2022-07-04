//
//  PersonalInformationViewProtocol.swift
//  SalwatTimes
//
//  Created by Yousef Mohamed on 01/07/2022.
//

import UIKit
import Combine

protocol PersonalInformationViewProtocol: BaseController {
}

class PersonalInformationController: UIViewController, PersonalInformationViewProtocol {
    
    //----------------------------------------------------------------------------------------------------------------
    //=======>MARK: -  Coordinator handlers ...
    //----------------------------------------------------------------------------------------------------------------

    //----------------------------------------------------------------------------------------------------------------
    //=======>MARK: -  Properties ...
    //----------------------------------------------------------------------------------------------------------------
    private var subscriptions = Set<AnyCancellable>()
    private var personalInformationView: PersonalInformationView!
    private var viewModel: PersonalInformationViewModelProtocol!
    //----------------------------------------------------------------------------------------------------------------
    //=======>MARK: -  Life cycle methods ...
    //----------------------------------------------------------------------------------------------------------------
    init(viewModel: PersonalInformationViewModelProtocol) {
        super.init(nibName: nil, bundle: nil)
        self.viewModel = viewModel
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        let personalInformationView = PersonalInformationView()
        self.personalInformationView = personalInformationView
        self.view = personalInformationView
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        title = L10n.personalInformations
        bindUserInterActionsAndDateFlows()
    }
    
}
extension PersonalInformationController {
    
    private func bindUserInterActionsAndDateFlows() {
        bindToUserDataStream()
        bindToSaveButton()
        bindToTextFields()
        bindToLoadingPublisher()
    }
    
    private func bindToUserDataStream() {
        viewModel.userPublisher
            .compactMap({$0})
            .sink { [weak self] userInformation in
            guard let self = self else { return }
            self.personalInformationView.configureView(with: userInformation)
            }.store(in: &subscriptions)
    }
    
    private func bindToSaveButton() {
        personalInformationView.saveButton.tapPublisher.sink { _ in
            self.viewModel.updateUserData()
        }.store(in: &subscriptions)
    }
    
    private func bindToTextFields() {
        personalInformationView.firstNameTextField.textPublisher.compactMap({$0}).assign(to: \.firstName, on: viewModel).store(in: &subscriptions)
        personalInformationView.lastNameTextField.textPublisher.compactMap({$0}).assign(to: \.lastName, on: viewModel).store(in: &subscriptions)
        personalInformationView.emailTextField.textPublisher.compactMap({$0}).assign(to: \.email, on: viewModel).store(in: &subscriptions)
        personalInformationView.mobileTextField.textPublisher.compactMap({$0}).assign(to: \.mobile, on: viewModel).store(in: &subscriptions)
        personalInformationView.countryTextField.textPublisher.compactMap({$0}).assign(to: \.country, on: viewModel).store(in: &subscriptions)
        personalInformationView.cityTextfield.textPublisher.compactMap({$0}).assign(to: \.city, on: viewModel).store(in: &subscriptions)
    }
    
    private func bindToLoadingPublisher() {
        viewModel.isLoadingPublisher.sink { state in
            self.personalInformationView.setActivityIndicator = state
        }.store(in: &subscriptions)
    }
}
