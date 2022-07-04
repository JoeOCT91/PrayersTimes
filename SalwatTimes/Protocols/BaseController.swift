//
//  BaseController.swift
//  SalwatTimes
//
//  Created by Yousef Mohamed on 25/06/2022.
//

import UIKit

protocol BaseController: NSObjectProtocol, Presentable { }

protocol Presentable {
  func toPresent() -> UIViewController?
}


