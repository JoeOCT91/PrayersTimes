//
//  DayTimeView.swift
//  SalwatTimes
//
//  Created by Yousef Mohamed on 03/06/2022.
//

import UIKit

class DayTimeView: UIView {
    
    let backGroundImage = UIImageView(frame: .zero)
    let currentDayDate = UILabel(frame: .zero)
    
    init() {
        super.init(frame: .zero)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureBackGroundImage() {
        
    }
    
    private func layout() {
        
    }
    private func layoutBackGroundImageView() {
        self.addSubview(backGroundImage)
        backGroundImage.translatesAutoresizingMaskIntoConstraints = false
    }
    
    
}
