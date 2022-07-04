//
//  PrayersAlarmController.swift
//  SalwatTimes
//
//  Created by Yousef Mohamed on 01/07/2022.
//

import UIKit
import Combine

protocol PrayersAlarmsControllerProtocol: BaseController {

}

final class PrayersAlarmsController: UIViewController, PrayersAlarmsControllerProtocol {

    //----------------------------------------------------------------------------------------------------------------
    //=======>MARK: -  Coordinator handlers ...
    //----------------------------------------------------------------------------------------------------------------

    //----------------------------------------------------------------------------------------------------------------
    //=======>MARK: -  Properties ...
    //----------------------------------------------------------------------------------------------------------------
    private var subscriptions = Set<AnyCancellable>()
    private var viewModel: PrayersAlarmsViewModel!
    private var prayersAlarmView: PrayersAlarmView!

    //----------------------------------------------------------------------------------------------------------------
    //=======>MARK: -  Life cycle methods ...
    //----------------------------------------------------------------------------------------------------------------
    init(viewModel: PrayersAlarmsViewModel) {
        super.init(nibName: nil, bundle: nil)
        self.viewModel = viewModel
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func loadView() {
        let prayersAlarmView = PrayersAlarmView()
        self.prayersAlarmView = prayersAlarmView
        self.view = prayersAlarmView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        bindToDataStreamsAndUserInteractions()
    }
}
extension PrayersAlarmsController {
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
