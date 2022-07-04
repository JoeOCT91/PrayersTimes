//
//  SplashView.swift
//  SalwatTimes
//
//  Created by Yousef Mohamed on 28/05/2022.
//

import UIKit
import SwifterSwift

class SplashView: UIView {
    
    private var applicationLogo = UIImageView(frame: .zero)
    
    init() {
        super.init(frame: .zero)
        backgroundColor = ColorName.propelColor.color
        configureApplicationLogo()
        layoutApplicationLogo()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureApplicationLogo() {
        applicationLogo.image = Asset.appLogo.image
    }

    private func layoutApplicationLogo() {
        addSubview(applicationLogo)
        applicationLogo.anchorCenterSuperview()
        applicationLogo.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width * 0.66).isActive = true
        applicationLogo.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.width * 0.66).isActive = true
    }
}
