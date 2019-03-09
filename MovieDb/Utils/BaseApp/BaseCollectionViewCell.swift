//
//  BaseCollectionViewCell.swift
//  MovieDb
//
//  Created by Irfan Pertadima on 3/10/19.
//  Copyright © 2019 Irfan Pertadima. All rights reserved.
//

import UIKit

class BaseCollectionViewCell: UICollectionViewCell {
    override public init(frame: CGRect) {
        super.init(frame: frame)
        self.setupViews()
        self.setConstraintsView()
    }
    
    func setupViews() {
        
    }
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
        self.setupViews()
        self.setConstraintsView()
    }
    
    func setConstraintsView(){
        
    }
}
