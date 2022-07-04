//
//  File.swift
//  SalwatTimes
//
//  Created by Yousef Mohamed on 30/06/2022.
//

import UIKit
import Combine

protocol TabBarViewProtocol: AnyObject {
    var prayersTimesPublisher: CurrentValueSubject<UINavigationController?, Never> { get }
    var prayersAlarmPublisher: CurrentValueSubject<UINavigationController?, Never> { get }
    var compassPublisher: CurrentValueSubject<UINavigationController?, Never> { get }
    var QuranRadioPublisher: CurrentValueSubject<UINavigationController?, Never> { get }
    var settingPublisher: CurrentValueSubject<UINavigationController?, Never> { get }
    
    var tabBarNavControllersPublisher: CurrentValueSubject<[UINavigationController]?, Never> { get }
    
}

class MainTabBarController: UITabBarController, TabBarViewProtocol {
    
    
    var tabBarNavControllersPublisher = CurrentValueSubject<[UINavigationController]?, Never> (nil)
    

    var prayersTimesPublisher = CurrentValueSubject<UINavigationController?, Never>(nil)
    var prayersAlarmPublisher = CurrentValueSubject<UINavigationController?, Never>(nil)
    var compassPublisher = CurrentValueSubject<UINavigationController?, Never>(nil)
    var QuranRadioPublisher = CurrentValueSubject<UINavigationController?, Never>(nil)
    var settingPublisher = CurrentValueSubject<UINavigationController?, Never>(nil)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setTabBarNavigationsControllers()
    }

    class func create() -> MainTabBarController {
        let tabBar = MainTabBarController()
        return tabBar
    }

    private func setTabBarNavigationsControllers() {
        let prayersTimesNavigation = UINavigationController()
        let prayersAlarmNavigation = UINavigationController()
        let compassNavigation = UINavigationController()
        let QuranRadioNavigation = UINavigationController()
        let settingNavigation = UINavigationController()
        
        prayersTimesPublisher.send(prayersTimesNavigation)
        prayersAlarmPublisher.send(prayersAlarmNavigation)
        compassPublisher.send(compassNavigation)
        QuranRadioPublisher.send(QuranRadioNavigation)
        settingPublisher.send(settingNavigation)
        
        prayersTimesNavigation.tabBarItem = customTabBarItem(title: L10n.prayersTimes, image: Asset.appLogo.image)
        prayersAlarmNavigation.tabBarItem = customTabBarItem(title: L10n.prayersAlarms, image: Asset.qiblaIcon.image)
        compassNavigation.tabBarItem = customTabBarItem(title: L10n.qibla, image: Asset.qiblaIcon.image)
        QuranRadioNavigation.tabBarItem = customTabBarItem(title: L10n.holyQuran, image: Asset.qiblaIcon.image)
        settingNavigation.tabBarItem = customTabBarItem(title: L10n.settings, image: Asset.qiblaIcon.image)

        let navControllersList = [prayersTimesNavigation, prayersAlarmNavigation, compassNavigation, QuranRadioNavigation, settingNavigation]
        self.viewControllers = navControllersList
        self.tabBarNavControllersPublisher.send(navControllersList)
        //self.tabBarNavControllersPublisher.send(completion: .finished)
        self.selectedIndex = 0
    }

//    private func setTabItemAppearance() {
//        let appearance = UITabBarItem.appearance()
//        let normalAttributes = [NSAttributedString.Key.font: FontFamily.BahijTheSansArabic.semiBold.font(size: 12), NSAttributedString.Key.foregroundColor: ColorName.greenColor.colorc]
//        appearance.setTitleTextAttributes(normalAttributes as [NSAttributedString.Key: Any], for: .normal)
//        appearance.n
//    }

    private func customTabBarItem(title: String, image: UIImage) -> UITabBarItem {
        let selected = image.withTintColor(ColorName.greenColor.color,renderingMode: .alwaysOriginal).scaled(toWidth: 30.0)
        let normal = image.withTintColor(ColorName.whiteColor.color).withRenderingMode(.alwaysOriginal).scaled(toWidth: 30.0)
        let customTabBarItem: UITabBarItem = UITabBarItem(title: title, image: normal, selectedImage: selected)
        return customTabBarItem
    }

}


