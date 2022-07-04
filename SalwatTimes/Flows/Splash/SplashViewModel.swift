//
//  File.swift
//  SalwatTimes
//
//  Created by Yousef Mohamed on 25/06/2022.
//

import Foundation
import Firebase
import Combine

protocol SplashViewModelProtocol: AnyObject {
    var onFinishSetDataPublisher: PassthroughSubject<Void, Never> { get }
}

final class SplashViewModel: SplashViewModelProtocol {
    
    internal var onFinishSetDataPublisher = PassthroughSubject<Void, Never>()

    private var subscriptions = Set<AnyCancellable>()
    
    init() {
        self.checkForValidUser()
    }
    
    private func checkForValidUser() {
        Firebase.Auth.auth().addStateDidChangeListener { auth, user in
            if let user = user {
                print( "## user with \(user.uid) logged ")
                self.retrieveUserInformationDatabase(with: user.uid)
            } else {
                self.deleteUserOldSavedData()
            }
        }
    }
    
    private func retrieveUserInformationDatabase(with uid: String ) {
        print("### start updating user ###")
        let db = Firestore.firestore()
        db.collection("Profiles").document(uid).getDocument { [weak self] snapshot, error in
            guard let self = self else { return }
            if let snapshot = snapshot {
                guard let user  = try? snapshot.data(as: User.self) else { return }
                UserDefaultsManager.shared().userUId = uid
                RealmManager.shared.add(user)
                self.onFinishSetDataPublisher.send()
                print("### user has been updated ###")
            } else {
                self.deleteUserOldSavedData()
            }
        }
    }
    
    private func deleteUserOldSavedData() {
        print("### Deleting old saved data ####")
        RealmManager.shared.clearAllData()
        UserDefaultsManager.shared().userUId = nil
        onFinishSetDataPublisher.send()
    }
}
