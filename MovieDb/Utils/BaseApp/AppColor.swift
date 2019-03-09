//
//  AppColor.swift
//  MovieDb
//
//  Created by Irfan Pertadima on 3/9/19.
//  Copyright © 2019 Irfan Pertadima. All rights reserved.
//

import UIKit

enum AppColor {
    case appPrimary, appPrimaryDarker, textGray, lineGray, white, black, clear
    
    var color : UIColor {
        switch self {
        case .appPrimary:
            return UIColor(rgb: 0x733572)
        case .appPrimaryDarker:
            return UIColor(red: 0.41, green: 0.19, blue: 0.4, alpha: 1.0)
        case .textGray:
            return UIColor(red: 0.0, green: 0.0, blue: 0.0, alpha: 0.54)
        case .lineGray:
            return UIColor(red: 0.0, green: 0.0, blue: 0.0, alpha: 0.15)
        case .white:
            return UIColor.white
        case .black:
            return UIColor.black
        case .clear:
            return UIColor.clear
        }
    }
}
