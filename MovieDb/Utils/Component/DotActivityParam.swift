//
//  DotActivityParam.swift
//  MovieDb
//
//  Created by Irfan Pertadima on 3/10/19.
//  Copyright © 2019 Irfan Pertadima. All rights reserved.
//

import Foundation
import UIKit

public class DotActivityParam: NSObject {
    public var numberOfCircles: Int = 0
    public var internalSpacing: CGFloat = 0.0
    // Width per circle
    public var circleWidth: CGFloat = 0.0
    // Animation delay per circle
    public var animationDelay: CGFloat = 0.0
    // Animation Duration per circle
    public var animationDuration: CGFloat = 0.0
    public var animationFromValue: CGFloat = 0.0
    public var animationToValue: CGFloat = 0.0
    public var activityViewWidth: CGFloat = 0.0
    public var activityViewHeight: CGFloat = 0.0
    public var defaultColor: AppColor?
    public var isDataValidationEnabled:Bool = false
    
    public override init() {
        super.init()
        validateData()
    }
    
    func validateData() {
        activityViewWidth = activityViewWidth == 0 ? 50 : activityViewWidth
        activityViewHeight = activityViewHeight == 0 ? 50 : activityViewHeight
        numberOfCircles = numberOfCircles == 0 ? 3 : numberOfCircles
        circleWidth = (activityViewWidth / CGFloat(numberOfCircles))
        internalSpacing = internalSpacing == 0 ? 5 : internalSpacing
        animationDelay = ( animationDelay == 0) ? 0.3 : animationDelay
        animationDuration = (animationDuration == 0) ? 0.8 : animationDuration
        animationFromValue = (animationFromValue == 0) ? 0.2 : animationFromValue
        animationToValue = (animationToValue == 0) ? 1.0 : animationToValue
        defaultColor = ( self.defaultColor == nil ) ? .appPrimary : .clear
        
    }
    
    func setIsDataValidationEnabled(_ isDataValidationEnabled: Bool) {
        self.isDataValidationEnabled = isDataValidationEnabled
        validateData()
    }
}
