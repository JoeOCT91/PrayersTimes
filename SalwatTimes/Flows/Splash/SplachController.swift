//
//  SplashController.swift
//  SalwatTimes
//
//  Created by Yousef Mohamed on 28/05/2022.
//

import UIKit
import Combine

protocol SplashViewProtocol: BaseController {
    var onCompleteSplashPublisher: PassthroughSubject <Void, Never> { get }
}

class SplashController: UIViewController, SplashViewProtocol {
    
    var onCompleteSplashPublisher = PassthroughSubject <Void, Never> ()
    private var subscriptions = Set<AnyCancellable>()
    private var viewModel: SplashViewModelProtocol!
    
    init(viewModel: SplashViewModelProtocol) {
        super.init(nibName: nil, bundle: nil)
        self.viewModel = viewModel
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        let splashView = SplashView()
        self.view = splashView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        observeFlowFinishPublisher()
    }
    
    private func observeFlowFinishPublisher() {
        viewModel.onFinishSetDataPublisher.sink { _ in
            self.onCompleteSplashPublisher.send()
        }.store(in: &subscriptions)
    }
}
