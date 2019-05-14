//
//  HomePopularMovieTableViewCell.swift
//  MovieDb
//
//  Created by Irfan Pertadima on 3/10/19.
//  Copyright © 2019 Irfan Pertadima. All rights reserved.
//

import UIKit
import SnapKit

class HomePopularMovieTableViewCell: BaseTableViewCell {
    
    private lazy var imageMovie : CustomImageView = {
        let image = addComponent.customImage(rounded: 5)
        image.backgroundColor = AppColor.lineGray.color
        return image
    }()
    
    private let movieTitle = addComponent.label(id: "", type: .roboto_medium, text: "", size: 14, addColor: .black, align: .left)
    
    private let descMovie : UILabel = {
        let label = addComponent.label(id: "", type: .roboto_regular, text: "", size: 12, addColor: .textGray, align: .left)
        label.numberOfLines = 4
        label.lineBreakMode = .byTruncatingTail
        return label
    }()
    
    private let star = addComponent.image(id: "ic_star", image: #imageLiteral(resourceName: "ic_star"))
    
    private let rating = addComponent.label(id: "", type: .roboto_regular, text: "", size: 12, addColor: .textGray, align: .left)
    
    override func prepareView() {
        addSubview(imageMovie)
        addSubview(movieTitle)
        addSubview(descMovie)
        addSubview(star)
        addSubview(rating)
    }
    
    override func setConstraintsView() {
        imageMovie.snp.makeConstraints{(make) in
            make.top.equalToSuperview().offset(20)
            make.left.equalToSuperview().offset(20)
            make.width.equalTo(100)
            make.height.equalTo(130)
            make.bottom.equalToSuperview()
        }
        
        movieTitle.snp.makeConstraints{(make) in
            make.top.equalTo(imageMovie).offset(5)
            make.left.equalTo(imageMovie.snp_rightMargin).offset(20)
            make.right.equalToSuperview().offset(-20)
            
        }
        
        descMovie.snp.makeConstraints{(make) in
            make.top.equalTo(movieTitle.snp_bottomMargin).offset(10)
            make.left.equalTo(imageMovie.snp_rightMargin).offset(20)
            make.right.equalToSuperview().offset(-20)
        }
        
        star.snp.makeConstraints{(make) in
            make.left.equalTo(imageMovie.snp_rightMargin).offset(20)
            make.height.equalTo(14)
            make.width.equalTo(14)
            make.centerY.equalTo(rating)
        }
        
        rating.snp.makeConstraints{(make) in
            make.top.equalTo(descMovie.snp_bottomMargin).offset(20)
            make.left.equalTo(star.snp_rightMargin).offset(10)
        }
    }
    
    func configureCell(data: UpcomingMoviesModel?) {
        if let imageData = data?.posterPath {
            let placeHolder = #imageLiteral(resourceName: "ic_image")
            let urlFullImage = urlImage + imageData
            imageMovie.loadImageUsingUrlString(urlFullImage, defaultImg: placeHolder, completion: {(data) in
            }, contentMode: .scaleAspectFill)
        }
        movieTitle.text = data?.title
        descMovie.text = data?.overview
        rating.text = "\(data?.voteAverage ?? 0)"
    }
}
