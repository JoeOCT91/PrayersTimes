//
//  File.swift
//  SalwatTimes
//
//  Created by Yousef Mohamed on 25/06/2022.
//

import Foundation
import FirebaseAuth
import FirebaseCore
import FirebaseFirestore
import FirebaseFirestoreSwift

import Combine
import RealmSwift

protocol AuthenticationViewModelProtocol: AnyObject {
    var firstName: String { get set }
    var lastName: String { get set}
    var email: String { get set }
    var password: String { get set }
    var rePassword: String { get set }
    var mobile: String { get set}
    var country: String { get set }
    var city: String { get set }
    
    func performLogin()
    func performRegister()
    
    var isLoadingPublisher: PassthroughSubject<Bool, Never> { get }
    var errorPublisher: PassthroughSubject<(AuthError), Never> { get }
    var successAuthPublisher: PassthroughSubject<Void, Never> { get }
    
}

class AuthenticationViewModel: AuthenticationViewModelProtocol {
    
    var firstName = String()
    var lastName = String()
    var email = String()
    var password = String()
    var rePassword = String()
    var mobile = String()
    var country = String()
    var city = String()
    
    private var subscription = Set<AnyCancellable>()
    internal var isLoadingPublisher = PassthroughSubject<Bool, Never>()
    internal var errorPublisher = PassthroughSubject<(AuthError), Never>()
    internal var successAuthPublisher = PassthroughSubject<Void, Never>()
    
    
    func performLogin() {
        guard validateLoginInputs()  else { return }
        self.isLoadingPublisher.send(true)
        Auth.auth().signIn(withEmail: email, password: password) { [weak self] response, error in
            guard let self = self else { return }

            if let error = error {
                self.isLoadingPublisher.send(false)
                print(error)
            } else if let response = response {
                self.retrieveUserInformationDatabase(with: response.user.uid)
            }
        }
    }
    
    private func retrieveUserInformationDatabase(with uid: String ) {
        let db = Firestore.firestore()
        db.collection("Profiles").document(uid).getDocument{ [weak self] snapshot, error in
            guard let self = self else { return }
            if error == nil {
                guard let user  = try? snapshot?.data(as: User.self) else { return }
                UserDefaultsManager.shared().userUId = uid
                RealmManager.shared.add(user)
                self.successAuthPublisher.send()
            } else if let error = error {
                print(error)
            }
        }
    }
    
    func validateLoginInputs() -> Bool {
        guard !password.isEmpty, !email.isEmpty  else {
            self.errorPublisher.send(.allFieldsAreRequired)
            return false
        }
        guard ValidatorManager.shared().isValidEmail(email) else {
            self.errorPublisher.send(.invalidEmail)
            return false
        }
        guard ValidatorManager.shared().isPasswordValid(password) else {
            self.errorPublisher.send(.invalidPassword)
            return false
        }
        return true
    }
    
    func performRegister() {
        guard validateRegisterInputs() else { return }
        Auth.auth().createUser(withEmail: email, password: password) { response, error in
            if let error = error {
                print(error)
            } else if let response = response {
                self.saveAdditionalUserDataToDataBase(to: response.user.uid)
            }
        }
    }
    
    private func saveAdditionalUserDataToDataBase(to userUID: String) {
        let user = User()
        user.uid = userUID
        user.email = email
        user.firstName = firstName
        user.lastName = lastName
        user.mobileNumber = mobile
        user.country = country
        user.city = city
        let db = Firestore.firestore()
        do {
            try db.collection("Profiles").document(userUID).setData(from: user) { [weak self] error in
                guard let self = self else { return }
                if error != nil {
                    RealmManager.shared.add(user)
                    self.successAuthPublisher.send()
                } else {
                    // handle error
                }
            }
        } catch let error {
            print("Error writing city to Firestore: \(error.localizedDescription)")
        }
    }
    
    func validateRegisterInputs() -> Bool {
        guard !firstName.isEmpty, !lastName.isEmpty, !email.isEmpty, !password.isEmpty, !password.isEmpty, !mobile.isEmpty, !country.isEmpty, !city.isEmpty else {
            self.errorPublisher.send(.allFieldsAreRequired)
            return false
        }
        guard ValidatorManager.shared().isValidEmail(email) else {
            self.errorPublisher.send(.invalidEmail)
            return false
        }
        guard ValidatorManager.shared().isPasswordValid(password) else {
            self.errorPublisher.send(.invalidPassword)
            return false
        }
        guard password == rePassword else {
            self.errorPublisher.send(.passwordsNotMatch)
            return false
        }
        return true
    }
}
