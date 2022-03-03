//
//  UIColorExtensions.swift
//  TFCC
//
//  Created by Phaedra Solutions  on 25/02/2022.
//

import UIKit

extension UIColor {
    static var themeColor: UIColor {
        return UIColor(named: "ThemeColor") ?? UIColor(hexString: "31D0D4")
    }
    static var darkBlueText: UIColor {
        return UIColor(named: "DarkBlueText") ?? UIColor(hexString: "050D1A")
    }
    static var blackText: UIColor {
        return UIColor(named: "BlackText") ?? UIColor(hexString: "1C1C1C")
    }
    static var borderGrey: UIColor {
        return UIColor(named: "BorderGrey") ?? UIColor(hexString: "B8B8B8")
    }
}
