//
//  UIView+Loader.swift
//  SalwatTimes
//
//  Created by Yousef Mohamed on 12/02/2021.
//


import UIKit

extension UIView {
    
    func showLoader() {
        let activityIndicator = setupActivityIndicator()
        activityIndicator.startAnimating()
        self.addSubview(activityIndicator)
    }
    
    func hideLoader() {
        if let activityIndicator = viewWithTag(333) {
            activityIndicator.removeFromSuperview()
        }
    }
    
    private func setupActivityIndicator() -> UIActivityIndicatorView {
        let activityIndicator = UIActivityIndicatorView()
        activityIndicator.frame = self.bounds
        activityIndicator.center = self.center
        activityIndicator.style = UIActivityIndicatorView.Style.medium
        activityIndicator.tag = 333
        return activityIndicator
    }
}
