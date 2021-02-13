//
//  PrayersTimesVM.swift
//  SalwatTimes
//
//  Created by Yousef Mohamed on 12/02/2021.


import Foundation
import CoreLocation


protocol PrayersTimeVMProtocol: class {
    func getCurentMonthPrayersTimes()
    func getCellData(indexPath: IndexPath, data: (_ weekDay: String, _ monthDay: String) -> ())
    func getDayPrayersTiming() -> [String]
    func getDaysCount() -> Int
    func didSelectDate(indexPath: IndexPath)
    func isSelectedDay(indexPath: IndexPath) ->  Bool
    func getUserCurrentLocation()
    func getCurrentDate()
    func getNextMonth()
    func getPreviousMonth()
}

class PrayersTimesVM: PrayersTimeVMProtocol {
    
    private weak var view: PrayersTimesVCProtocol?
    private let dateFormatter = DateFormatter()
    private let locationManager = CLLocationManager() // create Location Manager object
    
    private var monthPrayersData = [PrayersData]()
    private var year =  Int()
    private var month =  Int()
    private var day =  Int()
    private var selectedIndex = Int()
    private var selectedDayIndexPath = IndexPath()
    
    
    init(view: PrayersTimesVCProtocol) {
        self.view = view
    }
    
    internal func getCurrentDate() {
        let curentDate =  Date()
        let calendar = Calendar.current
        self.year = calendar.component(.year, from: curentDate)
        self.month = calendar.component(.month, from: curentDate)
        self.day = calendar.component(.day, from: curentDate)
        self.selectedIndex = day + 1
        dateFormatter.dateFormat = "MMMM, yyy"
        let date = dateFormatter.string(from: curentDate)
        self.view?.updateDateLabel(date: date)
    }
    
    internal func getUserCurrentLocation() {
        
        locationManager.requestAlwaysAuthorization() // Get location permisions
        locationManager.requestWhenInUseAuthorization() // Get location permisions
        //cheack if locations permisions are set and okay
        if CLLocationManager.locationServicesEnabled() {
            locationManager.desiredAccuracy = kCLLocationAccuracyNearestTenMeters
            //locationManager.startUpdatingLocation()
            let currentLocation = locationManager.location
            // Make sure is loactaion is set and not Nil
            if let currentLocation = currentLocation {
                UserDefaultsManager.shared().longitude = String(currentLocation.coordinate.longitude)
                UserDefaultsManager.shared().latitude = String(currentLocation.coordinate.latitude)
                getCurentMonthPrayersTimes()
            }
        }
        
    }
    
    internal func getCurentMonthPrayersTimes() {
        view?.showLoader()
        APIManager.getTimes(month: month, year: year) { [weak self] (result) in
            guard let self = self  else { return }
            switch result {
            case .success(let prayersTimesData):
                self.monthPrayersData = prayersTimesData.monthData
                self.view?.reloadColleCtionview()
                self.view?.setTimesData()
                self.dayToSelect()
                self.updateDateLabel() //
                self.view?.hideLoader()
            case .failure(let error):
                self.view?.hideLoader()
                print(error)
            }
        }
    }

    
    //Return numbers of Days in the curent month
    //based on count of days that back from the api call
    //
    internal func getDaysCount() -> Int {
        return monthPrayersData.count
    }
    
    internal func getCellData(indexPath: IndexPath, data: (_ weekDay: String, _ monthDay: String) -> ()) {
        let timestamp = Double(monthPrayersData[indexPath.row].date.timestamp)!
        let date = Date(timeIntervalSince1970: Double(timestamp))
        let weekDayFormat = "E"
        let monthDayFormat = "d"
        
        dateFormatter.dateFormat = weekDayFormat
        let weekday = dateFormatter.string(from: date)
        dateFormatter.dateFormat = monthDayFormat
        let monthDay = dateFormatter.string(from: date)
        data(weekday, monthDay)
    }
    
    internal func getDayPrayersTiming() -> [String] {
        let dayTimings = monthPrayersData[selectedIndex].timings
        let mirroredObject = Mirror(reflecting: dayTimings)
        var timingsArr = [String]()
        for (_ , attr) in mirroredObject.children.enumerated() {
            if let property_name = attr.value as? String {
                timingsArr.append(property_name)
            }
        }
        return timingsArr
    }
    
    internal func didSelectDate(indexPath: IndexPath) {
        self.selectedDayIndexPath = indexPath
        self.selectedIndex = indexPath.row
        self.view?.setTimesData()
    }
    
    internal func isSelectedDay(indexPath: IndexPath) ->  Bool {
        let selected = indexPath == selectedDayIndexPath ? true : false
        return selected
    }
    
    // This method called after next button pressed
    // And it call api to get prayers timings for next month after modify needed data
    internal func getNextMonth(){
        if month < 12 {
            month += 1
            getCurentMonthPrayersTimes()
        } else if month == 12 {
            year += 1
            month = 1
            getCurentMonthPrayersTimes()
        }
    }
    
    // This method called after previous button pressed
    // And it call api to get prayers timings for previous month after modify needed data
    internal func getPreviousMonth() {
        if month > 1 {
            month -= 1
            getCurentMonthPrayersTimes()
        } else if month == 1 {
            month = 12
            year -= 1
            getCurentMonthPrayersTimes()
        }
    }
}

extension PrayersTimesVM {
    private func updateDateLabel() {
        let timestamp = Double(monthPrayersData[selectedDayIndexPath.row].date.timestamp)!
        let date = Date(timeIntervalSince1970: Double(timestamp))
        dateFormatter.dateFormat = "MMMM, yyy"
        let dateAsString = dateFormatter.string(from: date)
        self.view?.updateDateLabel(date: dateAsString)
    }
    private func dayToSelect() {
        //This function to select and view frist day of the month when user navigate between monthes
        let curentDate =  Date()
        let calendar = Calendar.current
        let year = calendar.component(.year, from: curentDate)
        let month = calendar.component(.month, from: curentDate)
        let day = calendar.component(.day, from: curentDate)
        
        if month == monthPrayersData[0].date.gregorian.month.number &&
            year == Int(monthPrayersData[0].date.gregorian.year) {
            view?.selectCell(index: day-1)
        } else {
            view?.selectCell(index: 0)
        }
    }
}
