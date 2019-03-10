//
//  UICollectionViewCell.swift
//  MovieDb
//
//  Created by Irfan Pertadima on 3/11/19.
//  Copyright © 2019 Irfan Pertadima. All rights reserved.
//

import UIKit

extension UICollectionViewCell {
    func animateCell() {
        self.layer.transform = CATransform3DMakeScale(0.1,0.1,1)
        UIView.animate(withDuration: 0.3, animations: {
            self.layer.transform = CATransform3DMakeScale(1.05,1.05,1)
        },completion: { finished in
            UIView.animate(withDuration: 0.1, animations: {
                self.layer.transform = CATransform3DMakeScale(1,1,1)
            })
        })
    }
}
