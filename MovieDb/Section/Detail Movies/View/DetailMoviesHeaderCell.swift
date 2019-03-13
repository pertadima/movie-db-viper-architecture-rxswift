//
//  DetailMoviesHeaderCell.swift
//  MovieDb
//
//  Created by Irfan Pertadima on 3/13/19.
//  Copyright © 2019 Irfan Pertadima. All rights reserved.
//

import UIKit
import SnapKit

class DetailMoviesHeaderCell: BaseTableViewCell {
    
    private let imageHeader : CustomImageView = {
        let image = addComponent.customImage(rounded: 0)
        image.backgroundColor = AppColor.lineGray.color
        return image
    }()
    
    private let imagePosterView: CustomImageView = {
        let image = addComponent.customImage(rounded: 5)
        image.backgroundColor = AppColor.lineGray.color
        image.borderView(lineWidth: 3, cornerRadius: 5, lineColor: .white, isShadow: true)
        return image
    }()
    
    private let movieTitle : UILabel = {
        let label = addComponent.label(id: "title", type: .roboto_bold, text: "", size: 22, addColor: .white, align: .left)
        label.lineBreakMode = .byTruncatingTail
        label.numberOfLines = 2
        return label
    }()
    
    private let transparentBackground = addComponent.view(addColor: .transparentBlack)
    
    private let star = addComponent.image(id: "ic_star", image: #imageLiteral(resourceName: "ic_star"))
    
    private let rating = addComponent.label(id: "", type: .roboto_regular, text: "", size: 14, addColor: .textGray, align: .left)
    
    private let lineBorder1 = addComponent.view(addColor: .lineGray)
    
    private let imagePeopleCount = addComponent.image(id: "ic_people", image: #imageLiteral(resourceName: "ic_people"))
    
    private let peopleCount = addComponent.label(id: "", type: .roboto_regular, text: "", size: 14, addColor: .textGray, align: .left)
    
    private let lineBorder2 = addComponent.view(addColor: .lineGray)
    
    private let imagePopularity = addComponent.image(id: "ic_popularity", image: #imageLiteral(resourceName: "ic_tv"))
    
    private let popularityCount = addComponent.label(id: "", type: .roboto_regular, text: "", size: 14, addColor: .textGray, align: .left)
    
    override func prepareView() {
        addSubview(imageHeader)
        addSubview(transparentBackground)
        addSubview(imagePosterView)
        addSubview(movieTitle)
        addSubview(star)
        addSubview(rating)
        addSubview(lineBorder1)
        addSubview(imagePeopleCount)
        addSubview(peopleCount)
        addSubview(lineBorder2)
        addSubview(imagePopularity)
        addSubview(popularityCount)
    }
    
    override func setConstraintsView() {
        imageHeader.snp.makeConstraints{(make) in
            make.top.equalToSuperview()
            make.left.equalToSuperview()
            make.right.equalToSuperview()
            make.height.equalTo(230)
        }
        
        transparentBackground.snp.makeConstraints{(make) in
            make.top.equalToSuperview()
            make.left.equalToSuperview()
            make.right.equalTo(self)
            make.height.equalTo(230)
        }
        
        imagePosterView.snp.makeConstraints{(make) in
            make.top.equalTo(imageHeader.snp_bottomMargin).offset(-60)
            make.left.equalTo(self).offset(20)
            make.width.equalTo(80)
            make.height.equalTo(120)
            make.bottom.equalToSuperview()
        }
        
        movieTitle.snp.makeConstraints{(make) in
            make.bottom.equalTo(imageHeader.snp_bottomMargin).offset(-5)
            make.left.equalTo(imagePosterView.snp_rightMargin).offset(20)
            make.right.equalToSuperview().offset(-20)
        }
        
        star.snp.makeConstraints{(make) in
            make.left.equalTo(imagePosterView.snp_rightMargin).offset(20)
            make.height.equalTo(14)
            make.width.equalTo(14)
            make.centerY.equalTo(rating)
        }
        
        rating.snp.makeConstraints{(make) in
            make.top.equalTo(imageHeader.snp_bottomMargin).offset(20)
            make.left.equalTo(star.snp_rightMargin).offset(20)
        }
        
        lineBorder1.snp.makeConstraints{(make) in
            make.centerY.equalTo(rating)
            make.height.equalTo(20)
            make.left.equalTo(rating.snp_rightMargin).offset(20)
            make.width.equalTo(1)
        }
        
        imagePeopleCount.snp.makeConstraints{(make) in
            make.left.equalTo(lineBorder1.snp_rightMargin).offset(20)
            make.height.equalTo(14)
            make.width.equalTo(14)
            make.centerY.equalTo(peopleCount)
        }
        
        peopleCount.snp.makeConstraints{(make) in
            make.top.equalTo(imageHeader.snp_bottomMargin).offset(20)
            make.left.equalTo(imagePeopleCount.snp_rightMargin).offset(20)
        }
        
        lineBorder2.snp.makeConstraints{(make) in
            make.centerY.equalTo(peopleCount)
            make.height.equalTo(20)
            make.left.equalTo(peopleCount.snp_rightMargin).offset(20)
            make.width.equalTo(1)
        }
        
        imagePopularity.snp.makeConstraints{(make) in
            make.left.equalTo(lineBorder2.snp_rightMargin).offset(20)
            make.height.equalTo(14)
            make.width.equalTo(14)
            make.centerY.equalTo(popularityCount)
        }
        
        popularityCount.snp.makeConstraints{(make) in
            make.top.equalTo(imageHeader.snp_bottomMargin).offset(20)
            make.left.equalTo(imagePopularity.snp_rightMargin).offset(20)
        }
    }
    
    func configureData(data: DetailMoviesResponse?) {
        if let imageData = data?.backdropPath, let imagePoster = data?.posterPath {
            let placeHolder = #imageLiteral(resourceName: "ic_image")
            let urlFullImage = urlImage + imageData
            let urlPosterFull = urlImage + imagePoster
            
            imageHeader.loadImageUsingUrlString(urlFullImage, defaultImg: placeHolder, completion: {(data) in
            }, contentMode: .scaleAspectFill)
            
            imagePosterView.loadImageUsingUrlString(urlPosterFull, defaultImg: placeHolder, completion: {(data) in }, contentMode: .scaleAspectFill)
        }
        movieTitle.text = data?.originalTitle
        rating.text = "\(data?.voteAverage ?? 0)"
        peopleCount.text = "\(data?.voteCount ?? 0)"
        popularityCount.text = "\(data?.popularity ?? 0)"
    }
}
