
//
//  MoviesHeaderCollectionView.swift
//  MovieDb
//
//  Created by Irfan Pertadima on 3/11/19.
//  Copyright © 2019 Irfan Pertadima. All rights reserved.
//

import UIKit
import SnapKit

class MoviesHeaderCollectionView: UICollectionReusableView {
    let label = addComponent.label(id: "", type: .roboto_medium, text: "", size: 12, addColor: .black, align: .left)
    
    let headerContainer = addComponent.view(addColor: .white)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupHeaderView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupHeaderView() {
        addSubview(headerContainer)
        headerContainer.snp.makeConstraints{(make) in
            make.top.equalToSuperview()
            make.left.equalToSuperview()
            make.right.equalToSuperview()
            make.bottom.equalToSuperview()
        }
        setupComponentView()
    }
    
    private func setupComponentView() {
        headerContainer.addSubview(label)
        label.snp.makeConstraints{(make) in
            make.left.equalTo(headerContainer).offset(20)
            make.right.equalTo(headerContainer).offset(-20)
            make.centerY.equalTo(headerContainer)
        }
    }
    
    func configureHeader(data: Int?, dataTotal: Int?) {
        label.text = "Showing \(data ?? 0) from \(dataTotal ?? 0) Movies"
    }
}
