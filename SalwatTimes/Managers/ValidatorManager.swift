//
//  ValidatorManager.swift
//  SalwatTimes
//
//  Created by Yousef Mohamed on 30/06/2022.
//

import Foundation

class ValidatorManager {
    
    // MARK:- Singleton
    private static let sharedInstance = ValidatorManager()
    
    class func shared() -> ValidatorManager {
        return ValidatorManager.sharedInstance
    }
    
    //MARK Methods
    func isValidEmail(_ email: String) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailPred = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailPred.evaluate(with: email)
    }
    
    func isPasswordValid(_ Password : String) -> Bool {
        let passwordRegEx =  "^[A-Za-z\\d$@$!%*?&]{6,32}"
        let PasswordPred = NSPredicate(format: "SELF MATCHES %@", passwordRegEx)
        return PasswordPred.evaluate(with: Password)
    }
}
