//
//  UIView.swift
//  Task4
//
//  Created by PRANSHUR GOEL on 18/07/22.
//

import Foundation
import UIKit

enum AssetsColor {
   case lightGreen
    case lightGrey
    case grey
    case black
    case themeColor
}
extension UIColor {

    static func appColor(_ name: AssetsColor) -> UIColor {
        switch name {
        case .themeColor:
            return UIColor(named: "ThemeColor")!
        case .lightGrey:
            return UIColor(named: "SepraterColor")!
        case .grey:
            return UIColor(named: "TabBar")!
        case .black:
            return UIColor(named: "TabBarSelected")!
        case .lightGreen:
            return UIColor(named: "SelectionIndicatorColor")!
        }
    }
}
