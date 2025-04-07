//
//  Utility.swift
//  CUBEInterview
//
//  Created by CheChenLiu on 2025/3/30.
//

import Foundation
import UIKit

public var viewState = ListState.onlyFriends

public enum ListState {
    case noneFriends
    case onlyFriends
    case friensWithInvite
}

extension UIColor {
    static let gray474747 = UIColor(red: 71/255, green: 71/255, blue: 71/255, alpha: 1)
    static let gray8E8E93 = UIColor(red: 142/255, green: 142/255, blue: 147/255, alpha: 1)
    static let gray999999 = UIColor(red: 153/255, green: 153/255, blue: 153/255, alpha: 1)
    static let grayC9C9C9 = UIColor(red: 201/255, green: 201/255, blue: 201/255, alpha: 1)
    static let grayE4E4E4 = UIColor(red: 228/255, green: 228/255, blue: 228/255, alpha: 1)
    static let grayEFEFEF = UIColor(red: 239/255, green: 239/255, blue: 239/255, alpha: 1)
    static let pinkEC008C = UIColor(red: 236/255, green: 0/255, blue: 140/255, alpha: 1)
    static let pinkF9B2DC = UIColor(red: 249/255, green: 178/255, blue: 220/255, alpha: 1)
    static let green56B30B = UIColor(red: 86/255, green: 179/255, blue: 11/255, alpha: 1)
    static let greenA6CC42 = UIColor(red: 166/255, green: 204/255, blue: 66/255, alpha: 1)
    
}

extension DateFormatter {
    static let yyyyMMddFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyyMMdd"
        formatter.locale = Locale(identifier: "zh-TW")
        return formatter
    }()
    
    static let yyyyMMddSlashFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy/MM/dd"
        formatter.locale = Locale(identifier: "zh-TW")
        return formatter
    }()
}
