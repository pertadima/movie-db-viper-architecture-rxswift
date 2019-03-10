//
//  DotIndicatorView.swift
//  MovieDb
//
//  Created by Irfan Pertadima on 3/10/19.
//  Copyright © 2019 Irfan Pertadima. All rights reserved.
//

import UIKit
import SnapKit

public class DotIndicatorView: UIView {
    public var dotParms: DotActivityParam?
    private var isAnimating = false
    private var rootViewController: UIWindow?
    private var info: UILabel = {
        let label: UILabel = addComponent.label(id: "loading", type: .roboto_regular, text: "Please wait...", size: 13, addColor: .textGray, align: .center)
        return label
    }()
    private var views: UIView = {
        let view: UIView = addComponent.view(addColor: .white)
        view.roundedView(cornerRadius: 15, bgColor: .white, isShadow: true)
        return view
    }()
    private var loadingviews: UIView = {
        let view: UIView = addComponent.view(addColor: .clear)
        view.roundedView(cornerRadius: 5, bgColor: .white, isShadow: true)
        return view
    }()
    override public func awakeFromNib() {
        super.awakeFromNib()
        dotParms = loadDotActivityIndicatorParms()
        translatesAutoresizingMaskIntoConstraints = false
    }
    
    public init(){
        rootViewController = UIApplication.shared.keyWindow
        super.init(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
        setSubview()
    }
    
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func loadDotActivityIndicatorParms() -> DotActivityParam {
        let dotParms = DotActivityParam()
        dotParms.activityViewWidth = 200
        dotParms.activityViewHeight = 60
        dotParms.numberOfCircles = 3
        dotParms.internalSpacing = 5
        dotParms.animationDelay = 0.2
        dotParms.animationDuration = 0.6
        dotParms.animationFromValue = 0.3
        dotParms.defaultColor = .appPrimary
        dotParms.isDataValidationEnabled = true
        return dotParms
    }
    
    public func setSubview(){
        if let rootViewController = rootViewController {
            let tap = UITapGestureRecognizer(target: self, action: #selector(self.handleTap(_:)))
            self.addGestureRecognizer(tap)
            rootViewController.addSubview(self)
            self.center = rootViewController.center
            self.backgroundColor = UIColor.black.withAlphaComponent(0.3)
            self.frame = rootViewController.frame
            if dotParms == nil {
                dotParms = DotActivityParam()
            }
            addCircles()
            self.alpha = 0
        } else {
            print("Cannot show DotsLoadingView.")
        }
    }
    
    @objc func handleTap(_ sender: UITapGestureRecognizer) {
        stopAnimating()
    }
    
    public func startAnimating() {
        if !isAnimating {
            self.alpha = 1
            isAnimating = true
        }
    }
    
    private func addCircles() {
        addSubview(views)
        views.addSubview(loadingviews)
        if let dotParms = dotParms {
            for i in 0..<dotParms.numberOfCircles {
                createCircle(with: i)
            }
        }
        views.addSubview(info)
        views.snp.makeConstraints{(make) in
            make.width.equalTo(150)
            make.height.equalTo(120)
            make.center.equalToSuperview()
        }
        
        loadingviews.snp.makeConstraints{(make) in
            make.width.equalTo(60)
            make.height.equalTo(60)
            make.center.equalTo(views)
        }
        
        info.snp.makeConstraints{(make) in
            make.bottom.equalTo(views).offset(-10)
            make.centerX.equalTo(views)
        }
    }
    
    private func createCircle(with index: Int) {
        if let dotParms = dotParms {
            let origonX = CGFloat((CGFloat(index) * (dotParms.activityViewWidth / CGFloat(dotParms.numberOfCircles) + dotParms.internalSpacing)))
            let origonY: CGFloat = dotParms.activityViewHeight / 2 - dotParms.circleWidth / 2
            let sizeW: CGFloat = dotParms.circleWidth - dotParms.internalSpacing
            let circle = UIView(frame: CGRect(x: origonX, y: origonY, width: sizeW, height: sizeW))
            circle.backgroundColor = dotParms.defaultColor?.color
            circle.layer.cornerRadius = sizeW / 2
            circle.translatesAutoresizingMaskIntoConstraints = false
            circle.transform = CGAffineTransform(scaleX: 0, y: 0)
            circle.layer.add(createAnimation(withDelay: (CGFloat(index) * dotParms.animationDelay)), forKey: "scale")
            loadingviews.addSubview(circle)
        }
    }
    
    private func createAnimation(withDelay aDelay: CGFloat) -> CABasicAnimation {
        if let dotParms = dotParms {
            let anim = CABasicAnimation(keyPath: "transform.scale")
            anim.delegate = self as? CAAnimationDelegate
            anim.fromValue = dotParms.animationFromValue
            anim.toValue = dotParms.animationToValue
            anim.autoreverses = true
            anim.duration = CFTimeInterval(dotParms.animationDuration)
            anim.isRemovedOnCompletion = false
            anim.beginTime = (CACurrentMediaTime() + Double(aDelay)) as CFTimeInterval
            anim.repeatCount = .infinity
            anim.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeInEaseOut)
            return anim
        }
        return CABasicAnimation()
    }
    
    public func stopAnimating() {
        if isAnimating {
            removeCircles()
            isAnimating = false
        }
    }
    
    private func removeCircles() {
        self.alpha = 0
    }
}
