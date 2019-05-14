//
//  DetailMoviesCastCollectionViewCell.swift
//  MovieDb
//
//  Created by Irfan Pertadima on 5/9/19.
//  Copyright © 2019 Irfan Pertadima. All rights reserved.
//

import UIKit
import SnapKit

class DetailMoviesCollectionViewCell: BaseCollectionViewCell {
    private let imageProfile : CustomImageView = {
        let image = addComponent.customImage(rounded: 0)
        image.backgroundColor = AppColor.lineGray.color
        return image
    }()

    private let castName = addComponent.label(id: "", type: .roboto_medium, text: "", size: 16, addColor: .black, align: .center)

    override func setupViews() {
        addSubview(imageProfile)
        addSubview(castName)
    }
    
    override func setConstraintsView() {
        imageProfile.snp.makeConstraints{(make) in
            make.top.equalToSuperview()
            make.width.equalTo(90)
            make.height.equalTo(90)
        }
        
        castName.snp.makeConstraints{(make) in
            make.top.equalTo(imageProfile.snp_bottomMargin).offset(10)
            make.left.equalToSuperview()
            make.right.equalToSuperview()
            make.bottom.equalToSuperview().offset(-20)
        }
    }
    
    func configureCell(data: CastModel?) {
        if let imageData = data?.profilePath {
            let placeHolder = #imageLiteral(resourceName: "ic_image")
            let urlFullImage = urlImage + imageData
            
            imageProfile.loadImageUsingUrlString(urlFullImage, defaultImg: placeHolder, completion: {(data) in }, contentMode: .scaleAspectFill)
        }
        castName.text = data?.name
    }
}
