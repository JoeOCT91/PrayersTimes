//
//  File.swift
//  SalwatTimes
//
//  Created by Yousef Mohamed on 25/06/2022.
//

import UIKit

class MamlkaButton: UIButton {

    init(title: String, backgroundColor: UIColor = ColorName.propelColor.color) {
        super.init(frame: .zero)
        setTitleForAllStates(title)
        self.backgroundColor = backgroundColor
        self.setupButton()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupButton() {
        translatesAutoresizingMaskIntoConstraints = false
        heightAnchor.constraint(equalToConstant: 45).isActive = true
        titleLabel?.font = FontFamily.BahijTheSansArabic.semiBold.font(size: 14)
        layer.cornerRadius = 12
    }

}
