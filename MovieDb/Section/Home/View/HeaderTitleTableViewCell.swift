//
//  HeaderTitleTableViewCell.swift
//  MovieDb
//
//  Created by Irfan Pertadima on 3/10/19.
//  Copyright © 2019 Irfan Pertadima. All rights reserved.
//

import UIKit
import SnapKit

class HeaderTitleTableViewCell : UIView {
    let label = addComponent.label(id: "title", type: .roboto_medium, text: "A", size: 16, addColor: .black, align: .left)
    let headerContainer = addComponent.view(addColor: .white)
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        addSubview(headerContainer)
        headerContainer.snp.makeConstraints{(make) in
            make.top.equalToSuperview()
            make.left.equalToSuperview()
            make.right.equalToSuperview()
            make.bottom.equalToSuperview()
            make.height.equalTo(50)
        }
        headerContainer.addSubview(label)
        label.snp.makeConstraints{(make) in
            make.left.equalTo(headerContainer).offset(20)
            make.centerY.equalTo(headerContainer).offset(5)
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
