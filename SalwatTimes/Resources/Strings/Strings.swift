// swiftlint:disable all
// Generated using SwiftGen — https://github.com/SwiftGen/SwiftGen

import Foundation

// swiftlint:disable superfluous_disable_command file_length implicit_return

// MARK: - Strings

// swiftlint:disable explicit_type_interface function_parameter_count identifier_name line_length
// swiftlint:disable nesting type_body_length type_name vertical_whitespace_opening_braces
internal enum L10n {
  /// إعدادات الحساب
  internal static let accountSettings = L10n.tr("Localizable", "accountSettings")
  /// 
  internal static let arabic = L10n.tr("Localizable", "arabic")
  /// صلاة العصر
  internal static let asr = L10n.tr("Localizable", "asr")
  /// تغير كلمة المرور
  internal static let changePassword = L10n.tr("Localizable", "changePassword")
  /// building
  internal static let cityIconName = L10n.tr("Localizable", "cityIconName")
  /// المدينة
  internal static let cityPlaceHolder = L10n.tr("Localizable", "cityPlaceHolder")
  /// الدولة
  internal static let countryPlaceHolder = L10n.tr("Localizable", "countryPlaceHolder")
  /// صلاة الطهر
  internal static let dhuhr = L10n.tr("Localizable", "dhuhr")
  /// البريد الإلكتروني
  internal static let emailAddressPlaceHolder = L10n.tr("Localizable", "emailAddressPlaceHolder")
  /// البريد الإلكتروني
  internal static let emailHead = L10n.tr("Localizable", "emailHead")
  /// envelope
  internal static let emailIconName = L10n.tr("Localizable", "emailIconName")
  /// صلاة الفجر
  internal static let fajr = L10n.tr("Localizable", "fajr")
  /// الأسم
  internal static let firstName = L10n.tr("Localizable", "firstName")
  /// الإسم بالكامل
  internal static let fullnameHead = L10n.tr("Localizable", "fullnameHead")
  /// globe
  internal static let globeIconName = L10n.tr("Localizable", "globeIconName")
  /// القرآن الكريم
  internal static let holyQuran = L10n.tr("Localizable", "holyQuran")
  /// صلاة العشاء
  internal static let isha = L10n.tr("Localizable", "isha")
  /// اسم العائلة
  internal static let lastName = L10n.tr("Localizable", "lastName")
  /// تسجيل الدخول
  internal static let loginButtonTitle = L10n.tr("Localizable", "loginButtonTitle")
  /// مرحباً بك في مواقيت الصلاة
  internal static let loginWelcomeTitle = L10n.tr("Localizable", "loginWelcomeTitle")
  /// تسجيل الخروج
  internal static let logout = L10n.tr("Localizable", "logout")
  /// صلاة المغرب
  internal static let maghrib = L10n.tr("Localizable", "maghrib")
  /// iphone
  internal static let mobileIconName = L10n.tr("Localizable", "mobileIconName")
  /// رقم التليفون المحمول
  internal static let mobileNumberPlaceHolder = L10n.tr("Localizable", "mobileNumberPlaceHolder")
  /// كلمة المرور الجديدة
  internal static let newPasswordHead = L10n.tr("Localizable", "newPasswordHead")
  /// lock
  internal static let passwordIconName = L10n.tr("Localizable", "passwordIconName")
  /// كلمة المرور
  internal static let passwordPlaceHolder = L10n.tr("Localizable", "passwordPlaceHolder")
  /// البيانات الشخصية
  internal static let personalInformations = L10n.tr("Localizable", "personalInformations")
  /// التنبيهات
  internal static let prayersAlarms = L10n.tr("Localizable", "prayersAlarms")
  /// مواقيت الصلاة
  internal static let prayersTimes = L10n.tr("Localizable", "prayersTimes")
  /// الطلبات السابقة
  internal static let previousOrders = L10n.tr("Localizable", "previousOrders")
  /// القبلة
  internal static let qibla = L10n.tr("Localizable", "qibla")
  /// لتحديد اتجاة القبلة اجعل السهم يتجه الي أعلي منتصف الشاشة
  internal static let qiblaDirectionDescription = L10n.tr("Localizable", "qiblaDirectionDescription")
  /// تسجيل جديد
  internal static let registerButtonTitle = L10n.tr("Localizable", "registerButtonTitle")
  /// كلمة المرور مرة أخري
  internal static let rePasswordPlaceHolder = L10n.tr("Localizable", "rePasswordPlaceHolder")
  /// حفظ
  internal static let saveButton = L10n.tr("Localizable", "saveButton")
  /// الإعدادات
  internal static let settings = L10n.tr("Localizable", "settings")
  /// مواقيت الصلاة
  internal static let splashTitle = L10n.tr("Localizable", "splashTitle")
  /// شروق الشمس
  internal static let sunrise = L10n.tr("Localizable", "sunrise")
  /// person
  internal static let usernameIconName = L10n.tr("Localizable", "usernameIconName")
  /// مرحبا بك
  internal static let welcome = L10n.tr("Localizable", "welcome")
}
// swiftlint:enable explicit_type_interface function_parameter_count identifier_name line_length
// swiftlint:enable nesting type_body_length type_name vertical_whitespace_opening_braces

// MARK: - Implementation Details

extension L10n {
  private static func tr(_ table: String, _ key: String, _ args: CVarArg...) -> String {
    let format = BundleToken.bundle.localizedString(forKey: key, value: nil, table: table)
    return String(format: format, locale: Locale.current, arguments: args)
  }
}

// swiftlint:disable convenience_type
private final class BundleToken {
  static let bundle: Bundle = {
    #if SWIFT_PACKAGE
    return Bundle.module
    #else
    return Bundle(for: BundleToken.self)
    #endif
  }()
}
// swiftlint:enable convenience_type
