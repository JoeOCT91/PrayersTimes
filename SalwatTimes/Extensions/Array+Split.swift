//
//  Array+Split.swift
//  SalwatTimes
//
//  Created by Yousef Mohamed on 02/07/2022.
//

import Foundation
extension Array {
    func split() -> (left: [Element], right: [Element]) {
        let ct = self.count
        let half = ct / 2
        let leftSplit = self[0 ..< half]
        let rightSplit = self[half ..< ct]
        return (left: Array(leftSplit), right: Array(rightSplit))
    }
}
