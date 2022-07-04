//
//  QuranRadioController.swift
//  SalwatTimes
//
//  Created by Yousef Mohamed on 01/07/2022.
//

import UIKit
import Combine

protocol QuranRadioControllerProtocol: BaseController {

}

final class QuranRadioController: UIViewController, QuranRadioControllerProtocol {

    //----------------------------------------------------------------------------------------------------------------
    //=======>MARK: -  Coordinator handlers ...
    //----------------------------------------------------------------------------------------------------------------

    //----------------------------------------------------------------------------------------------------------------
    //=======>MARK: -  Properties ...
    //----------------------------------------------------------------------------------------------------------------
    private var subscriptions = Set<AnyCancellable>()
    private var viewModel: QuranRadioViewModelProtocol!
    private var quranRadioView: QuranRadioView!

    //----------------------------------------------------------------------------------------------------------------
    //=======>MARK: -  Life cycle methods ...
    //----------------------------------------------------------------------------------------------------------------
    init(viewModel: QuranRadioViewModelProtocol) {
        super.init(nibName: nil, bundle: nil)
        self.viewModel = viewModel
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func loadView() {
        let quranRadioView = QuranRadioView()
        self.quranRadioView = quranRadioView
        self.view = view
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.isNavigationBarHidden = true
        bindToDataStreamsAndUserInteractions()
    }
}
extension QuranRadioController {
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
