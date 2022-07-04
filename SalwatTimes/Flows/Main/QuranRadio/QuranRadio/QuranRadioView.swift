//
//  QuranRadioView.swift
//  SalwatTimes
//
//  Created by Yousef Mohamed on 01/07/2022.
//

import UIKit

class QuranRadioView: UIView {
    
    
    let headLabel = UILabel(frame: .zero)
    let quranImage = UIImageView(frame: .zero)
    let nextButton = UIButton(frame: .zero)
    let previousButton = UIButton(frame: .zero)
    let progressBar = UIProgressView(frame: .zero)
    
    
    init() {
        super.init(frame: .zero)
        self.backgroundColor = ColorName.whiteColor.color
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    private func layout() {
        
    }
    
    private func layoutHeadLabel() {
        self.addSubview(headLabel)
        headLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            headLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
            headLabel.trailingAnchor.constraint(equalTo: trailingAnchor),
            headLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor)
        ])
    }
    
    private func layoutQuranImage() {
        addSubview(quranImage)
        quranImage.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            //quranImage.heightAnchor.constraint(equalToConstant: quranImage.widthAnchor)
        ])
    }
}

