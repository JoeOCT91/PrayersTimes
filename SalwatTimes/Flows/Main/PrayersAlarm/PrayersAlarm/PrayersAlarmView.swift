//
//  PrayersAlarmView.swift
//  SalwatTimes
//
//  Created by Yousef Mohamed on 01/07/2022.
//

import UIKit

class PrayersAlarmView: UIView {
    
    let alarmsStack: UIStackView = {
        let stackView = UIStackView(frame: .zero)
        var stackViews = [AlarmView]()
        Prayer.allCases.forEach { prayer in
            let view = AlarmView(alarmIdentifier: prayer)
            stackViews.append(view)
        }
        return stackView
    }()
    
    init() {
        super.init(frame: .zero)
        self.backgroundColor = ColorName.whiteColor.color
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func layout() {
        self.addSubview(alarmsStack)
        alarmsStack.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            alarmsStack.centerXAnchor.constraint(equalTo: centerXAnchor),
            alarmsStack.centerYAnchor.constraint(equalTo: centerYAnchor)
        ])
    }
}


class AlarmView: UIView {
    let alarmIdentifier: Prayer
    let alarmSwitch = UISwitch(frame: .zero)
    let prayerAlarmLabel = UIView(frame: .zero)
    
    init(alarmIdentifier: Prayer) {
        self.alarmIdentifier = alarmIdentifier
        super.init(frame: .zero)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func layoutViews() {
        self.addSubview(prayerAlarmLabel)
        self.addSubview(alarmSwitch)
    }
}
