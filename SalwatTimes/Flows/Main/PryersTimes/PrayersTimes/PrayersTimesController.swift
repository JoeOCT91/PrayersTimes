//
//  PrayersTimesController.swift
//  SalwatTimes
//
//  Created by Yousef Mohamed on 01/07/2022.
//

import UIKit
import Combine

protocol PrayersTimesControllerProtocol: BaseController {

}

final class PrayersTimesController: UIViewController, PrayersTimesControllerProtocol {
    
    //----------------------------------------------------------------------------------------------------------------
    //=======>MARK: -  Coordinator handlers ...
    //----------------------------------------------------------------------------------------------------------------

    
    //----------------------------------------------------------------------------------------------------------------
    //=======>MARK: -  Properties ...
    //----------------------------------------------------------------------------------------------------------------
    private var subscriptions = Set<AnyCancellable>()
    private var viewModel: PrayersTimesViewModelProtocol!
    private var prayersTimeView: PrayersTimesView!
    //----------------------------------------------------------------------------------------------------------------
    //=======>MARK: -  Life cycle methods ...
    //----------------------------------------------------------------------------------------------------------------
    init(viewModel: PrayersTimesViewModelProtocol) {
        super.init(nibName: nil, bundle: nil)
        self.viewModel = viewModel
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        let prayersTimeView = PrayersTimesView()
        self.prayersTimeView = prayersTimeView
        self.view = prayersTimeView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        bindToDataStreamsAndUserInteractions()
    }
}
extension PrayersTimesController {
    //----------------------------------------------------------------------------------------------------------------
    //=======>MARK: -  Private methods ...
    //----------------------------------------------------------------------------------------------------------------
    private func bindToDataStreamsAndUserInteractions() {
        bindToPrayersTimesDataStream()
    }
    
    func bindToPrayersTimesDataStream() {
        viewModel.prayerDataPublisher
            .dropFirst()
            .sink { prayersTimes in
                self.prayersTimeView.configurePrayersTimesView(with: prayersTimes)
            }.store(in: &subscriptions)
    }

}
