//
//  ViewController.swift
//  SalwatTimes
//
//  Created by Yousef Mohamed on 11/02/2021.
//

import UIKit
import CoreLocation

protocol PrayersTimesVCProtocol: class {
    func hideLoader()
    func showLoader()
    func reloadColleCtionview()
    func setTimesData()
    func selectCell(index: Int)
    func updateDateLabel(date: String)
}

class PrayersTimesVC: UIViewController {
    
    @IBOutlet var prayersTimesView: PrayersTimesView!
    
    private var viewModel: PrayersTimeVMProtocol!
    private let locationManager = LoactionManger.shared() // Use LocationManager (Singleton)
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setup()
    }
    // MARK:- Private Methods
    private func setup(){
        viewModel.getCurrentDate()
        //prayersTimesView.configureViews()
        //prayersTimesView.setup(delgate: self, dataSource: self)
        locationManager.delegate = self
    }
    
    // MARK:- Public Methods
    class func create() -> PrayersTimesVC {
        let prayersTimesVC: PrayersTimesVC = UIViewController.create(storyboardName: Storyboards.prayersTimes, identifier: ViewControllers.prayersTimesVC)
        let viewModel = PrayersTimesVM(view: prayersTimesVC)
        prayersTimesVC.viewModel = viewModel
        return prayersTimesVC
    }
    
    // MARK:- User Intents
    @IBAction func nextMonthPressed(_ sender: Any) {
        viewModel.getNextMonth()
    }
    
    @IBAction func previousMonthPressed(_ sender: Any) {
        viewModel.getPreviousMonth()
    }
}

extension PrayersTimesVC: PrayersTimesVCProtocol {
    
    internal func showLoader() {
        view.showLoader()
    }
    
    internal func hideLoader() {
        view.hideLoader()
    }
    
    internal func reloadColleCtionview() {
        //prayersTimesView.monthDaysCollectionView.reloadData()
    }
    
    internal func selectCell(index: Int){
       // let indexPath = IndexPath(row: index, section: 0)
      // prayersTimesView.monthDaysCollectionView.selectItem(at: indexPath, animated: true, scrollPosition: .centeredHorizontally)
       // viewModel.didSelectDate(indexPath: indexPath) // to update selected day prayers timings
    }
    
    internal func updateDateLabel(date: String){
       // prayersTimesView.dateLabel.text = date
    }
    
    internal func setTimesData(){
//        prayersTimesView.dayPrayersTimes.isHidden = false
//        let stackViews = prayersTimesView.dayPrayersTimes.arrangedSubviews
//        let prayersTimings = viewModel.getDayPrayersTiming()
//        for index in 0 ..< stackViews.count {
//            (stackViews[index] as! PrayerView).setupTimes(prayerTime: prayersTimings[index])
//        }
   }
}

extension PrayersTimesVC: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.getDaysCount()
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell =  collectionView.dequeueReusableCell(withReuseIdentifier: Cells.day, for: indexPath) as! DayCell
        viewModel.getCellData(indexPath: indexPath) { (weekDay, monthDay) in
            cell.setupData(weekDay: weekDay, monthDay: monthDay)
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        guard let cell = cell as? DayCell else { return }
        cell.isSelectedDay(isSelected: viewModel.isSelectedDay(indexPath: indexPath))
 
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        viewModel.didSelectDate(indexPath: indexPath) // to update selected day prayers timings
        let cell = collectionView.cellForItem(at: indexPath) as! DayCell
        cell.selectedDay()
    }
    
    
    func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
        guard let cell = collectionView.cellForItem(at: indexPath) as? DayCell else { return }
        cell.deSelectDay()
    }
}

extension PrayersTimesVC: CLLocationManagerDelegate{
    public func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus){
        viewModel.getUserCurrentLocation()
        viewModel.getCurentMonthPrayersTimes()
    }
}

