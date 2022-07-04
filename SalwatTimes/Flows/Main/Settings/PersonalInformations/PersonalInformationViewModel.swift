//
//  PersonalInformationViewModel.swift
//  SalwatTimes
//
//  Created by Yousef Mohamed on 01/07/2022.
//

import Foundation

import Foundation
import FirebaseFirestore
import Combine

protocol PersonalInformationViewModelProtocol: AnyObject {
    var firstName: String { get set }
    var lastName: String { get set}
    var email: String { get set }
    var password: String { get set }
    var rePassword: String { get set }
    var mobile: String { get set}
    var country: String { get set }
    var city: String { get set }
    
    func updateUserData()
    
    var userPublisher: CurrentValueSubject<User?, Never> { get }
    var isLoadingPublisher: CurrentValueSubject<Bool, Never> { get }
}

class PersonalInformationViewModel: PersonalInformationViewModelProtocol {
    
    var firstName = String()
    var lastName = String()
    var email = String()
    var password = String()
    var rePassword = String()
    var mobile = String()
    var country = String()
    var city = String()
    
    var userPublisher = CurrentValueSubject<User?, Never>(nil)
    var isLoadingPublisher = CurrentValueSubject<Bool, Never>(false)


    init() {
        guard let userUID = UserDefaultsManager.shared().userUId else { return }
        guard let user = RealmManager.shared.object(User.self, key: userUID) else { return }
        self.userPublisher.send(user)
    }
    
    
    func updateUserData() {
        guard let userUID = UserDefaultsManager.shared().userUId else { return }
        let user = User()
        user.uid = userUID
        user.email = email
        user.firstName = firstName
        user.lastName = lastName
        user.mobileNumber = mobile
        user.country = country
        user.city = city
        print("start update\(user)")

        let db = Firestore.firestore()
        do {
            self.isLoadingPublisher.send(true)
            try db.collection("Profiles").document(userUID).setData(from: user) { [weak self] error in
                guard let self = self else { return }
                self.isLoadingPublisher.send(false)
                if error == nil {
                    RealmManager.shared.add(user)
                } else {
                    // handle error
                }
            }
        } catch let error {
            print("Error writing city to Firestore: \(error.localizedDescription)")
        }
    }

}
