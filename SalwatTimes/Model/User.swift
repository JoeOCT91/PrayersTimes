//
//  User.swift
//  SalwatTimes
//
//  Created by Yousef Mohamed on 30/06/2022.
//

import Foundation
import Realm
import RealmSwift

public class User: Object, Codable {
    
    @Persisted(primaryKey: true) var uid: String
    @Persisted var email: String
    @Persisted var firstName: String
    @Persisted var lastName: String
    @Persisted var mobileNumber: String
    @Persisted var country: String
    @Persisted var city: String
    
}
