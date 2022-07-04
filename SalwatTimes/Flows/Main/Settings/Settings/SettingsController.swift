//
//  SettingsController.swift
//  SalwatTimes
//
//  Created by Yousef Mohamed on 01/07/2022.
//

import UIKit
import Combine

protocol SettingsControllerProtocol: BaseController {
    var onUserInformationTapPublisher: PassthroughSubject<Void, Never> { get }
    var onCompleteAuthPublisher: PassthroughSubject<Void, Never> { get }
}

final class SettingsController: UIViewController, SettingsControllerProtocol {

    //----------------------------------------------------------------------------------------------------------------
    //=======>MARK: -  Coordinator handlers ...
    //----------------------------------------------------------------------------------------------------------------
    var onCompleteAuthPublisher = PassthroughSubject<Void, Never>()
    var onUserInformationTapPublisher = PassthroughSubject<Void, Never>()
    //----------------------------------------------------------------------------------------------------------------
    //=======>MARK: -  Properties ...
    //----------------------------------------------------------------------------------------------------------------
    private var subscriptions = Set<AnyCancellable>()
    private var viewModel: SettingsViewModelProtocol!
    private var settingsView: SettingsView!

    //----------------------------------------------------------------------------------------------------------------
    //=======>MARK: -  Life cycle methods ...
    //----------------------------------------------------------------------------------------------------------------
    init(viewModel: SettingsViewModelProtocol) {
        super.init(nibName: nil, bundle: nil)
        self.viewModel = viewModel
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func loadView() {
        let settingsView = SettingsView()
        self.settingsView = settingsView
        self.view = settingsView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = L10n.accountSettings
        bindToDataStreamsAndUserInteractions()
    }
}
extension SettingsController {
    //----------------------------------------------------------------------------------------------------------------
    //=======>MARK: -  Private methods ...
    //----------------------------------------------------------------------------------------------------------------
    private func bindToDataStreamsAndUserInteractions() {
//        bindToUserDataStream()
        bindToPersonalInformationsTab()
//        bindToOrdersTab()
    }
    private func bindToUserDataStream() {
       
    }
    private func bindToPersonalInformationsTab() {
        settingsView.personalInfoTapGesture.tapPublisher.sink {  [weak self] _ in
            guard let self = self else { return }
            self.onUserInformationTapPublisher.send()
        }.store(in: &subscriptions)
    }
    private func bindToOrdersTab() {

    }
}
