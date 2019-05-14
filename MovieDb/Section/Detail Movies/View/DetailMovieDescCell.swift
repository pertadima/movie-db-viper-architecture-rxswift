//
//  DetailMovieDescCell.swift
//  MovieDb
//
//  Created by Irfan Pertadima on 3/13/19.
//  Copyright © 2019 Irfan Pertadima. All rights reserved.
//

import UIKit
import SnapKit

class DetailMovieDescCell: BaseTableViewCell {
    private let descLabel = addComponent.label(id: "", type: .roboto_regular, text: "", size: 14, addColor: .textGray, align: .left)
    
    private let line = addComponent.view(addColor: .lineGray)
    
    private let website = addComponent.label(id: "", type: .roboto_regular, text: "", size: 14, addColor: .textGray, align: .left)
   
    private let genre = addComponent.label(id: "", type: .roboto_regular, text: "", size: 14, addColor: .textGray, align: .left)
    
    override func prepareView() {
        addSubview(descLabel)
        addSubview(line)
        addSubview(website)
        addSubview(genre)
    }
    
    override func setConstraintsView() {
        descLabel.snp.makeConstraints{(make) in
            make.top.equalToSuperview().offset(20)
            make.left.equalToSuperview().offset(20)
            make.right.equalToSuperview().offset(-20)
        }
        
        line.snp.makeConstraints{(make) in
            make.top.equalTo(descLabel.snp_bottomMargin).offset(40)
            make.left.equalToSuperview().offset(20)
            make.right.equalToSuperview().offset(-20)
            make.height.equalTo(1)
        }
        
        website.snp.makeConstraints{(make) in
            make.top.equalTo(line.snp_bottomMargin).offset(40)
            make.left.equalToSuperview().offset(20)
            make.right.equalToSuperview().offset(-20)
        }
        
        genre.snp.makeConstraints{(make) in
            make.top.equalTo(website.snp_bottomMargin).offset(40)
            make.left.equalToSuperview().offset(20)
            make.right.equalToSuperview().offset(-20)
            make.bottom.equalToSuperview().offset(0)
        }
    }
    
    func configureData(data: DetailMoviesResponse?) {
        descLabel.attributedText = attributeText(boldText: "Overview :", lightText: "\n\n\(data?.overview ?? "")", boldTextSize: 16, lightTextSize: 14, color: .black, lightColor: .textGray, boldTextFont: .roboto_medium, lightTextFont: .roboto_regular)
        
        website.attributedText = attributeText(boldText: "Website :", lightText: "\n\n\(data?.homepage ?? "-")", boldTextSize: 16, lightTextSize: 14, color: .black, lightColor: .textGray, boldTextFont: .roboto_medium, lightTextFont: .roboto_regular)
        
        genre.attributedText = attributeText(boldText: "Genre :", lightText: "\n", boldTextSize: 16, lightTextSize: 14, color: .black, lightColor: .textGray, boldTextFont: .roboto_medium, lightTextFont: .roboto_regular)
    }
}
