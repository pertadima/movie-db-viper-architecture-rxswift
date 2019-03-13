//
//  CommonUtils.swift
//  MovieDb
//
//  Created by Irfan Pertadima on 3/13/19.
//  Copyright © 2019 Irfan Pertadima. All rights reserved.
//
import UIKit

public func attributeText(boldText: String, lightText: String, boldTextSize: CGFloat, lightTextSize: CGFloat ,color: AppColor, lightColor: AppColor, boldTextFont: AppFonts, lightTextFont: AppFonts) -> NSMutableAttributedString {
    let text = NSMutableAttributedString(string: boldText, attributes: attr(font: boldTextFont, size: boldTextSize, color))
    text.append(NSAttributedString(string: lightText, attributes: attr(font: lightTextFont, size: lightTextSize, lightColor)))
    return text
}

private func attr(font: AppFonts, size: CGFloat, _ color: AppColor) -> [NSAttributedString.Key: Any] {
    return [NSAttributedString.Key.font: UIFont(name: font.customFont, size: size)!, NSAttributedString.Key.foregroundColor: color.color]
}
