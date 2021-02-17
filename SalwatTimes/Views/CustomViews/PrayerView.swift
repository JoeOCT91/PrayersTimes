//
//  PrayerView.swift
//  SalwatTimes
//
//  Created by Yousef Mohamed on 11/02/2021.
//

import UIKit

class PrayerView: UIView {
    
    private static var prayerIndex = 0
    private let prayersNames = ["Fajr", "Zohr", "Asr", "Magrem", "Eshaa"]
    
    private let seperator = UIView(frame: .zero)
    private let prayerNameLabel = UILabel()
    private let prayerTimeLabel = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        configure()
    }
    
    func setupTimes(prayerTime: String){
        prayerTimeLabel.text = prayerTime
    }
    
    private func configure(){
        configurePrayerName()
        configurePrayerTimeLabel()
        configureSeperator()
    }
    
    private func configurePrayerName(){
        self.addSubview(prayerNameLabel)
        prayerNameLabel.translatesAutoresizingMaskIntoConstraints =  false
        prayerNameLabel.text = prayersNames[PrayerView.prayerIndex]
        PrayerView.prayerIndex += 1
        NSLayoutConstraint.activate([
            prayerNameLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10),
            prayerNameLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -15),
	        ])
    }
    
    private func configurePrayerTimeLabel() {
        self.addSubview(prayerTimeLabel)
        prayerTimeLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            prayerTimeLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -10),
            prayerTimeLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -15),
        ])
    }
    
    private func configureSeperator() {
        self.addSubview(seperator)
        seperator.translatesAutoresizingMaskIntoConstraints = false
        seperator.backgroundColor = UIColor.cyan
        NSLayoutConstraint.activate([
            seperator.heightAnchor.constraint(equalToConstant: 1),
            seperator.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            seperator.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            seperator.bottomAnchor.constraint(equalTo: self.bottomAnchor)
        ])
    }

}
