//
//  MoviesCollectionViewCell.swift
//  MovieDb
//
//  Created by Irfan Pertadima on 3/11/19.
//  Copyright © 2019 Irfan Pertadima. All rights reserved.
//

import UIKit
import SnapKit

class MoviesCollectionViewCell: BaseCollectionViewCell {
    private let image : CustomImageView = {
        let image = addComponent.customImage(rounded: 5)
        image.backgroundColor = AppColor.lineGray.color
        return image
    }()
    
    private let movieTitle : UILabel = {
        let title = addComponent.label(id: "label", type: .roboto_bold, text: "", size: 16, addColor: .black, align: .left)
        title.numberOfLines = 1
        title.lineBreakMode = .byTruncatingTail
        return title
    }()
    
    private let star = addComponent.image(id: "ic_star", image: #imageLiteral(resourceName: "ic_star"))
    
    private let rating = addComponent.label(id: "", type: .roboto_regular, text: "", size: 14, addColor: .textGray, align: .left)
    
    override func setupViews() {
        addBackgroundColor(addColor: .white)
        addSubview(image)
        addSubview(movieTitle)
        addSubview(star)
        addSubview(rating)
    }
    
    override func setConstraintsView() {
        image.snp.makeConstraints{(make) in
            make.top.equalTo(self)
            make.left.equalTo(self)
            make.right.equalTo(self)
            make.height.equalTo(230)
        }
        
        movieTitle.snp.makeConstraints{(make) in
            make.top.equalTo(image.snp_bottomMargin).offset(20)
            make.left.equalToSuperview().offset(5)
            make.right.equalToSuperview().offset(-5)
        }
        
        star.snp.makeConstraints{(make) in
            make.left.equalToSuperview().offset(5)
            make.height.equalTo(14)
            make.width.equalTo(14)
            make.centerY.equalTo(rating)
        }
        
        rating.snp.makeConstraints{(make) in
            make.top.equalTo(movieTitle.snp_bottomMargin).offset(10)
            make.left.equalTo(star.snp_rightMargin).offset(10)
        }
    }
    
    func configureCell(data: UpcomingMoviesModel?) {
        if let imageData = data?.posterPath {
            let placeHolder = #imageLiteral(resourceName: "ic_image")
            let urlFullImage = urlImage + imageData
            image.loadImageUsingUrlString(urlFullImage, defaultImg: placeHolder, completion: {(data) in
            }, contentMode: .scaleAspectFill)
        }
        
        movieTitle.text = data?.title
        rating.text = "\(data?.voteAverage ?? 0)"
    }
}
