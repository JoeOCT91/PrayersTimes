//
//  CompassController.swift
//  SalwatTimes
//
//  Created by Yousef Mohamed on 01/07/2022.
//

import UIKit
import Combine

protocol CompassControllerProtocol: BaseController {

}

final class CompassController: UIViewController, CompassControllerProtocol {

    //----------------------------------------------------------------------------------------------------------------
    //=======>MARK: -  Coordinator handlers ...
    //----------------------------------------------------------------------------------------------------------------

    //----------------------------------------------------------------------------------------------------------------
    //=======>MARK: -  Properties ...
    //----------------------------------------------------------------------------------------------------------------
    private var subscriptions = Set<AnyCancellable>()
    private var viewModel: CompassViewModelProtocol!
    private var compassView: CompassView!
    private var compassManager  : CompassDirectionManager!
    //----------------------------------------------------------------------------------------------------------------
    //=======>MARK: -  Life cycle methods ...
    //----------------------------------------------------------------------------------------------------------------
    init(viewModel: CompassViewModelProtocol) {
        super.init(nibName: nil, bundle: nil)
        self.viewModel = viewModel
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func loadView() {
        let compassView = CompassView()
        self.compassView = compassView
        self.view = compassView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        bindToDataStreamsAndUserInteractions()
        compassManager =  CompassDirectionManager(dialerImageView: compassView.ivCompassBack, pointerImageView: compassView.compassVector)
        compassManager.initManager()
    }
}
extension CompassController {
    //----------------------------------------------------------------------------------------------------------------
    //=======>MARK: -  Private methods ...
    //----------------------------------------------------------------------------------------------------------------
    private func bindToDataStreamsAndUserInteractions() {
//        bindToUserDataStream()
//        bindToPersonalInformationsTab()
//        bindToOrdersTab()
    }
    private func bindToUserDataStream() {
       
    }
    private func bindToPersonalInformationsTab() {

    }
    private func bindToOrdersTab() {

    }
}
