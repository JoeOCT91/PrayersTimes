//
//  DayCell.swift
//  SalwatTimes
//
//  Created by Yousef Mohamed on 12/02/2021.
//

import UIKit

class DayCell: UICollectionViewCell {
    
    private let weekDay = UILabel(frame: .zero)
    private let monthDay = UILabel(frame: .zero)
    let selectedViewBG = UIView(frame: .zero)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureViews()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        configureViews()
    }
    
    func setupData(weekDay: String, monthDay: String) {
        self.weekDay.text = weekDay
        self.monthDay.text = monthDay
    }
    
    private func configureViews(){
        configureSelectedBackgroundView()
        configureWeekDay()
        configreMonthDay()
    }
    private func configureSelectedBackgroundView() {
        contentView.addSubview(selectedViewBG)
        contentView.sendSubviewToBack(selectedViewBG)
        selectedViewBG.translatesAutoresizingMaskIntoConstraints = false
        selectedViewBG.layer.cornerRadius = 35/2
        NSLayoutConstraint.activate([
            selectedViewBG.heightAnchor.constraint(equalToConstant: 35),
            selectedViewBG.widthAnchor.constraint(equalTo: selectedViewBG.heightAnchor),
            selectedViewBG.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            selectedViewBG.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
    }
    private func configureWeekDay(){
        contentView.addSubview(weekDay)
        weekDay.textAlignment = .center
        weekDay.font = UIFont.systemFont(ofSize: 11, weight: .light)
        weekDay.adjustsFontSizeToFitWidth = true
        weekDay.textColor = .label
        weekDay.minimumScaleFactor = 85.0
        weekDay.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            weekDay.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            weekDay.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            weekDay.topAnchor.constraint(equalTo: contentView.topAnchor)
        ])
    }
    
    private func configreMonthDay(){
        contentView.addSubview(monthDay)
        monthDay.textAlignment = .center
        monthDay.font = UIFont.systemFont(ofSize: 13, weight: .medium)
        monthDay.adjustsFontSizeToFitWidth = true
        monthDay.textColor = .white
        monthDay.minimumScaleFactor = 85.0
        monthDay.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            monthDay.centerXAnchor.constraint(equalTo: selectedViewBG.centerXAnchor),
            monthDay.centerYAnchor.constraint(equalTo: selectedViewBG.centerYAnchor),
        ])
    }

    func selectedDay() {
        selectedViewBG.backgroundColor = UIColor.systemTeal
    }
    
    func deSelectDay() {
        selectedViewBG.backgroundColor = UIColor.clear
    }

    
    
    
    
}

    

