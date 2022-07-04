//
//  PrayersTimesView.swift
//  SalwatTimes
//
//  Created by Yousef Mohamed on 01/07/2022.
//

import UIKit

class PrayersTimesView: UIView {
    
    private let headLabel = UILabel(frame: .zero)
    private var hijriDateLabel = UILabel(frame: .zero)
    private let gregorianDateLabel = UILabel(frame: .zero)
    private var nextPrayerView = UIView(frame: .zero)
    
    var nextDay = UIButton(frame: .zero)
    var previousDay = UIButton(frame: .zero)
    
    
    private lazy var prayersTimesView: UIStackView = {
        let stackView = UIStackView()
        let firstRow = UIStackView()
        let secondRow = UIStackView()
        
        var stackViews = [PrayerTimeView]()
        Prayer.allCases.forEach { prayer in
            let view = PrayerTimeView(prayerIdentifier: prayer)
            stackViews.append(view)
        }
        
        let splitViews = stackViews.split()
        firstRow.addArrangedSubviews(splitViews.left)
        secondRow.addArrangedSubviews(splitViews.right)
        stackView.axis = .vertical
        firstRow.axis = .horizontal
        secondRow.axis = .horizontal
        stackView.spacing = 8
        firstRow.spacing = 8
        secondRow.spacing = 8
        stackView.addArrangedSubviews([firstRow, secondRow])
        return stackView
    }()
    
    
    
    
    init() {
        super.init(frame: .zero)
        self.backgroundColor = ColorName.whiteColor.color
        configureHeadLabel()
        configureDatesLabels()
        layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configurePrayersTimesView(with prayersTimes: [Prayer: String]) {
        prayersTimesView.arrangedSubviews.forEach { stack in
            (stack as! UIStackView).arrangedSubviews.forEach { prayerTimeView in
                let prayerTimeView = prayerTimeView as! PrayerTimeView
                prayerTimeView.prayerTimeLabel.text = prayersTimes[prayerTimeView.prayerIdentifier]
            }
        }
    }
    
    private func configureHeadLabel() {
        headLabel.font = FontFamily.BahijTheSansArabic.bold.font(size: 22)
        headLabel.textColor = ColorName.blackColor.color
        headLabel.text = L10n.prayersTimes
    }
    
    private func configureDatesLabels() {
        hijriDateLabel.font = FontFamily.BahijTheSansArabic.plain.font(size: 16)
        gregorianDateLabel.font = FontFamily.BahijTheSansArabic.plain.font(size: 16)
        hijriDateLabel.textColor = ColorName.blackColor.color
        gregorianDateLabel.textColor = ColorName.blackColor.color
        let dateFormatter = DateFormatter()
        let islamicCalendar = Calendar.init(identifier: Calendar.Identifier.islamicUmmAlQura)
        let gregorianCalendar = Calendar.init(identifier: Calendar.Identifier.gregorian)
        dateFormatter.calendar = islamicCalendar
        dateFormatter.dateFormat = "EEEE, dd MMMM yyyy"
        hijriDateLabel.text = dateFormatter.string(from: Date())
        dateFormatter.calendar = gregorianCalendar
        gregorianDateLabel.text = dateFormatter.string(from: Date())
    }
    
    private func layout() {
        layoutHeadLabel()
        layoutHijriDateLabel()
        layoutGregorianDateLabel()
        layoutNextPrayerView()
        layoutPrayersTimesView()
    }
    
    private func layoutHeadLabel() {
        addSubview(headLabel)
        headLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            headLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 25),
            headLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -25),
            headLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 55),
        ])
    }
    private func layoutHijriDateLabel() {
        addSubview(hijriDateLabel)
        hijriDateLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            hijriDateLabel.leadingAnchor.constraint(equalTo: headLabel.leadingAnchor),
            hijriDateLabel.trailingAnchor.constraint(equalTo: headLabel.trailingAnchor),
            hijriDateLabel.topAnchor.constraint(equalTo: headLabel.bottomAnchor)
        ])
    }
    private func layoutGregorianDateLabel() {
        addSubview(gregorianDateLabel)
        gregorianDateLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            gregorianDateLabel.leadingAnchor.constraint(equalTo: headLabel.leadingAnchor),
            gregorianDateLabel.trailingAnchor.constraint(equalTo: headLabel.trailingAnchor),
            gregorianDateLabel.topAnchor.constraint(equalTo: hijriDateLabel.bottomAnchor),
        ])
    }
    
    private func layoutNextPrayerView() {
        addSubview(nextPrayerView)
        nextPrayerView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            nextPrayerView.leadingAnchor.constraint(equalTo: hijriDateLabel.leadingAnchor),
            nextPrayerView.trailingAnchor.constraint(equalTo: hijriDateLabel.trailingAnchor),
            nextPrayerView.topAnchor.constraint(equalTo: gregorianDateLabel.bottomAnchor),
            nextPrayerView.heightAnchor.constraint(equalTo: nextPrayerView.widthAnchor, multiplier: 0.33)
        ])
    }
    
    private func layoutPrayersTimesView() {
        addSubview(prayersTimesView)
        prayersTimesView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            prayersTimesView.leadingAnchor.constraint(equalTo: hijriDateLabel.leadingAnchor),
            prayersTimesView.trailingAnchor.constraint(equalTo: hijriDateLabel.trailingAnchor),
            prayersTimesView.topAnchor.constraint(equalTo: nextPrayerView.bottomAnchor)
        ])
    }
    
    private func layoutNextDayButton() {
        addSubview(nextDay)
        
        NSLayoutConstraint.activate([
            
        ])
    }
    
}

class PrayerTimeView: UIView {
    
    private var prayerNameLabel = UILabel(frame: .zero)
    private lazy var sepLine: UIView = {
        let view = UIView(frame: .zero)
        view.backgroundColor = ColorName.lightGray.color
        return view
    }()
    
    var prayerTimeLabel = UILabel(frame: .zero)
    var prayerIdentifier: Prayer
    
    
    init(prayerIdentifier: Prayer) {
        self.prayerIdentifier = prayerIdentifier
        self.prayerNameLabel.text = prayerIdentifier.prayerName
        super.init(frame: .zero)
        configureView()
        configureLabels()
        layoutViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureView() {
        layerCornerRadius = 12
        layerBorderWidth = 1
        layer.borderColor = ColorName.greenColor.color.cgColor
        backgroundColor = UIColor(hexString: "EEF7E8")
    }
    
    private func configureLabels() {
        prayerNameLabel.textAlignment = .center
        prayerNameLabel.font = FontFamily.BahijTheSansArabic.bold.font(size: 14)
        prayerTimeLabel.textAlignment = .center
        prayerTimeLabel.font = FontFamily.BahijTheSansArabic.plain.font(size: 16)
    }
    
    
    private func layoutViews() {
        layoutPrayerNameLabel()
        layoutPrayerTimeLabel()
        layoutSepLine()
        self.widthAnchor.constraint(equalTo: self.heightAnchor).isActive = true
    }
    
    private func layoutPrayerNameLabel() {
        addSubview(prayerNameLabel)
        prayerNameLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            prayerNameLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 12),
            prayerNameLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -12),
            prayerNameLabel.topAnchor.constraint(equalTo: topAnchor, constant: 16)
        ])
    }
    
    private func layoutPrayerTimeLabel() {
        addSubview(prayerTimeLabel)
        prayerTimeLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            prayerTimeLabel.leadingAnchor.constraint(equalTo: prayerNameLabel.leadingAnchor),
            prayerTimeLabel.trailingAnchor.constraint(equalTo: prayerNameLabel.trailingAnchor),
            prayerTimeLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -16)
        ])
    }
    
    private func layoutSepLine() {
        self.addSubview(sepLine)
        sepLine.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            sepLine.leadingAnchor.constraint(equalTo: prayerNameLabel.leadingAnchor),
            sepLine.trailingAnchor.constraint(equalTo: prayerNameLabel.trailingAnchor),
            sepLine.heightAnchor.constraint(equalToConstant: 1),
            sepLine.centerYAnchor.constraint(equalTo: centerYAnchor)
        ])
    }
}
