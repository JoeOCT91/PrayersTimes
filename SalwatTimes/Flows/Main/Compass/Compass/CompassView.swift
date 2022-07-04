//
//  CompassView.swift
//  SalwatTimes
//
//  Created by Yousef Mohamed on 01/07/2022.
//

import UIKit

class CompassView: UIView {
    
    var ivCompassBack = UIImageView(frame: .zero)
    var ivCompassNeedle = UIImageView(frame: .zero)
    
    var descriptionLabel = UILabel(frame: .zero)
    var compassVector = UIImageView(frame: .zero)
    var locationIcon = UIImageView(frame: .zero)
    
    
    
    init() {
        super.init(frame: .zero)
        self.backgroundColor = ColorName.whiteColor.color
        configureImages()
        configureDescriptionLabel()
        layoutViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureImages() {
        ivCompassBack.image = Asset.compassback.image
        ivCompassNeedle.image = Asset.needleneedle.image
        
        compassVector.image = Asset.qiblaIcon.image.withTintColor(ColorName.greenColor.color, renderingMode: .alwaysOriginal)
        locationIcon.image = UIImage(systemName: "location.north")
        locationIcon.transform = CGAffineTransform(rotationAngle: 0)
    }
    
    private func configureDescriptionLabel() {
        descriptionLabel.text = L10n.qiblaDirectionDescription
        descriptionLabel.font = FontFamily.BahijTheSansArabic.light.font(size: 18)
        descriptionLabel.textColor = ColorName.blackColor.color
        descriptionLabel.numberOfLines = 0
        descriptionLabel.textAlignment = .center
    }
    
    private func layoutViews() {
        self.addSubview(compassVector)
        compassVector.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            compassVector.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            compassVector.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            compassVector.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width * 0.85),
            compassVector.heightAnchor.constraint(equalTo: compassVector.widthAnchor),
        ])
        
        self.addSubview(descriptionLabel)
        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            descriptionLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 45),
            descriptionLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -45),
            descriptionLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            descriptionLabel.bottomAnchor.constraint(equalTo: compassVector.topAnchor, constant: -16)
        ])
    }
    
}
