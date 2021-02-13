//
//  UIViewController+Storyboard.swift
//  SalwatTimes
//
//  Created by Yousef Mohamed on 12/02/2021.
//

import UIKit

extension UIViewController {
    class func create<T: UIViewController>(storyboardName: String, identifier: String) -> T {
        let storyboard = UIStoryboard(name: storyboardName, bundle: nil)
        return storyboard.instantiateViewController(withIdentifier: identifier) as! T
    }
}
