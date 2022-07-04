//
//  AuthModuleFactory.swift
//  SalwatTimes
//
//  Created by Yousef Mohamed on 25/06/2022.
//

import Foundation

protocol AuthModuleFactory {
    func makeLoginOutput() -> LoginViewProtocol
    func makeRegisterHandler(viewModel: AuthenticationViewModelProtocol) -> RegisterViewProtocol
}
