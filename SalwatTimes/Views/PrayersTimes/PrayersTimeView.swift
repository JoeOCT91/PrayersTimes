////
////  PrayersTimeView.swift
////  SalwatTimes
////
////  Created by Yousef Mohamed on 12/02/2021.
////
//
//import UIKit
//
//class PrayersTimesView: UIView {
//    
//    @IBOutlet weak var dateLabel: UILabel!
//    @IBOutlet weak var nextMonth: UIButton!
//    @IBOutlet weak var previousMonth: UIButton!
//    @IBOutlet weak var monthDaysCollectionView: UICollectionView!
//    @IBOutlet weak var dayPrayersTimes: UIStackView!
//    @IBOutlet weak var bgView: UIView!
//    @IBOutlet weak var scrollView: UIScrollView!
//    
//    override init(frame: CGRect) {
//        super.init(frame: frame)
//    }
//    
//    required init?(coder: NSCoder) {
//        super.init(coder: coder)
//    }
//    func setup(delgate: UICollectionViewDelegate, dataSource: UICollectionViewDataSource) {
//        monthDaysCollectionView.collectionViewLayout = creatTwoColumnFlowLayout()
//        monthDaysCollectionView.delegate = delgate
//        monthDaysCollectionView.dataSource = dataSource
//        monthDaysCollectionView.register(DayCell.self, forCellWithReuseIdentifier: Cells.day)
//    }
//    
//    
//    
//    func configureViews() {
//        configureNextButton()
//        configurePreviousButton()
//        configureDayPrayersTimes()
//        configureCollectionView()
//        configureBGView()
//        configureScrollview()
//        configureDateLabel()
//    }
//    
//    //MARK:- Private Methods
//    private func configureBGView(){
//        bgView.backgroundColor = UIColor.cyan
//    }
//    
//    private func configureCollectionView(){
//        monthDaysCollectionView.showsHorizontalScrollIndicator = false
//        monthDaysCollectionView.backgroundColor = .clear
//        monthDaysCollectionView.allowsMultipleSelection = false
//    }
//    private func configureScrollview(){
//        scrollView.layer.cornerRadius = 25
//        scrollView.layer.maskedCorners = [.layerMinXMinYCorner , .layerMaxXMinYCorner]
//    }
//    
//    private func configureDateLabel(){
//        dateLabel.font = UIFont.systemFont(ofSize: 22, weight: .bold)
//        dateLabel.adjustsFontSizeToFitWidth = true
//        dateLabel.minimumScaleFactor = 85.0
//        dateLabel.tintColor = .label
//        dateLabel.textColor = .label
//    }
//    
//    private func configureDayPrayersTimes() {
//        dayPrayersTimes.isHidden = true // Hide timings in the frist lunch due it will be empty
//    }
//    
//    private func configureNextButton() {
//        let largeConfig = UIImage.SymbolConfiguration(pointSize: 25, weight: .medium, scale: .medium)
//        let largeBoldDoc = UIImage(systemName: "arrow.backward", withConfiguration: largeConfig)
//        nextMonth.tintColor = UIColor.label
//        nextMonth.setImage(largeBoldDoc, for: .normal)
//    }
//    
//    private func configurePreviousButton() {
//        let largeConfig = UIImage.SymbolConfiguration(pointSize: 25, weight: .medium, scale: .medium)
//        let largeBoldDoc = UIImage(systemName: "arrow.right", withConfiguration: largeConfig)
//        previousMonth.tintColor = UIColor.label
//        previousMonth.setImage(largeBoldDoc, for: .normal)
//    }
//    
//    private func creatTwoColumnFlowLayout() -> UICollectionViewFlowLayout {
//        let width = UIScreen.main.bounds.width
//        let padding: CGFloat = 10
//        let avilableWidth = width - (padding * 8)
//        let itemwidth = avilableWidth / 7
//        let flowlayout = UICollectionViewFlowLayout()
//        flowlayout.sectionInset = UIEdgeInsets(top: 0, left: padding, bottom: 10, right: padding)
//        flowlayout.itemSize = CGSize(width: itemwidth, height: 50)
//        flowlayout.scrollDirection = .horizontal
//        return flowlayout
//    }
//}
//    
//    
//
