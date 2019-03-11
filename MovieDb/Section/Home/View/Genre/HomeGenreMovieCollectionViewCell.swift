//
//  HowGenreMovieCollectionViewCell.swift
//  MovieDb
//
//  Created by Irfan Pertadima on 3/10/19.
//  Copyright © 2019 Irfan Pertadima. All rights reserved.
//

import UIKit
import SnapKit

class HomeGenreMovieCollectionViewCell: BaseCollectionViewCell {
    private let containerView = addComponent.view(addColor: .white)
    
    private let genreName : UILabel = {
        let label = addComponent.label(id: "", type: .roboto_medium, text: "", size: 14, addColor: .textGray, align: .center)
        label.numberOfLines = 1
        label.lineBreakMode = .byTruncatingTail
        return label
    }()
    
    override func setupViews() {
        addSubview(containerView)
        containerView.borderView(lineWidth: 1, cornerRadius: 5, lineColor: .lineGray, isShadow: false)
        containerView.addSubview(genreName)
    }
    
    override func setConstraintsView() {
        containerView.snp.makeConstraints{(make) in
            make.top.equalToSuperview()
            make.bottom.equalToSuperview()
            make.left.equalToSuperview()
            make.right.equalToSuperview()
            make.height.equalTo(50)
        }
        
        genreName.snp.makeConstraints{(make) in
            make.centerY.equalTo(containerView)
            make.left.equalTo(containerView).offset(10)
            make.right.equalTo(containerView).offset(-10)
        }
    }
    
    func configureData(data: MovieGenresModel?) {
        genreName.text = data?.name
    }
}
