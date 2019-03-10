//
//  HomeGenreMovieCollectionViewCell.swift
//  MovieDb
//
//  Created by Irfan Pertadima on 3/10/19.
//  Copyright © 2019 Irfan Pertadima. All rights reserved.
//

import UIKit
import SnapKit

class HomeUpcomingMoviesCollectionViewCell: BaseCollectionViewCell {
    private let image : CustomImageView = {
        let image = addComponent.customImage(rounded: 5)
        image.backgroundColor = AppColor.lineGray.color
        return image
    }()
    
    private let movieTitle : UILabel = {
        let title = addComponent.label(id: "label", type: .roboto_medium, text: "", size: 14, addColor: .black, align: .left)
        title.numberOfLines = 1
        title.lineBreakMode = .byTruncatingTail
        return title
    }()
    
    override func setupViews() {
        addBackgroundColor(addColor: .white)
        addSubview(image)
        addSubview(movieTitle)
    }
    
    override func setConstraintsView() {
        image.snp.makeConstraints{(make) in
            make.top.equalTo(self)
            make.left.equalTo(self)
            make.right.equalTo(self)
            make.height.equalTo(150)
        }
        
        movieTitle.snp.makeConstraints{(make) in
            make.top.equalTo(image.snp_bottomMargin).offset(20)
            make.left.equalToSuperview().offset(5)
            make.right.equalToSuperview().offset(-5)
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
    }
}
