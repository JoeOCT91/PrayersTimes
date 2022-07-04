//
//  AuthErrors.swift
//  SalwatTimes
//
//  Created by Yousef Mohamed on 30/06/2022.
//

import Foundation
import UIKit

enum AuthError: Error {
    case allFieldsAreRequired
    case invalidEmail
    case invalidPassword
    case passwordsNotMatch
}

extension AuthError: LocalizedError {
    public var errorDescription: String? {
        switch self {
        case .allFieldsAreRequired:
            return NSLocalizedString("جميع الحقول مطلوبة, تأكد من إدخال كافة البيانات", comment: "")
        case .invalidEmail:
            return NSLocalizedString("البريد الإلكتروني غير صحيح, من فضلك ادخل بريد الكتروني صحيح", comment: "")
        case .invalidPassword:
            return NSLocalizedString("كلمة المرور غير صحيحة, كلمة المرور يجب ان تتكون من سته أحرف علي الاقل ", comment: "")
        case .passwordsNotMatch:
            return NSLocalizedString("كلمة المرور لا تتطابق مع تاكيد كلمة المرور", comment: "")
        }
    }
}
