//
//  DetailMoviesCastCell.swift
//  MovieDb
//
//  Created by Irfan Pertadima on 4/30/19.
//  Copyright © 2019 Irfan Pertadima. All rights reserved.
//

import UIKit
import SnapKit

class DetailMoviesCastCell: BaseTableViewCell {
    var data: [CastModel?] = []
    
    private lazy var title: UILabel = {
        return addComponent.label(id: "", type: .roboto_medium, text: "Movie Casts :", size: 16, addColor: .black, align: .left)
    }()
    
    private lazy var collectionView : UICollectionView = {
        let collectionView = addComponent.collectionView(id: "collecitonViewCell", delegate: self, datasource: self, scrollDirection: .vertical, isEstimatedItemSize: false)
        collectionView.contentInset = UIEdgeInsets(top: 10, left: 20, bottom: 10, right: 20)
        collectionView.scrollIndicatorInsets = UIEdgeInsets(top: 00, left: 0, bottom: 0, right: 0)
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.showsVerticalScrollIndicator = false
        collectionView.registerCellClass(DetailMoviesCollectionViewCell.self)
        collectionView.alwaysBounceVertical = false
        return collectionView
    }()
    
    private let line = addComponent.view(addColor: .lineGray)
    
    override func prepareView() {
        addBackgroundColor(addColor: .clear)
        addSubview(title)
        addSubview(collectionView)
        addSubview(line)
    }
    
    override func setConstraintsView() {
        title.snp.makeConstraints{(make) in
            make.top.equalToSuperview().offset(20)
            make.left.equalToSuperview().offset(20)
            make.right.equalToSuperview().offset(-20)
        }
        
        collectionView.snp.makeConstraints{(make) in
            make.top.equalTo(title.snp_bottomMargin).offset(30)
            make.left.equalToSuperview()
            make.right.equalToSuperview()
            make.height.equalTo(80)
        }
        
        line.snp.makeConstraints{(make) in
            make.top.equalTo(collectionView.snp_bottomMargin).offset(40)
            make.left.equalToSuperview().offset(20)
            make.right.equalToSuperview().offset(-20)
            make.height.equalTo(1)
            make.bottom.equalToSuperview().offset(0)
        }
    }
    
    func configureCell(data: [CastModel?]) {
        self.data = data
        collectionView.snp.updateConstraints{(make) in
            make.height.equalTo(145 * (data.count / 3))
        }
        collectionView.reloadData()
    }
}

extension DetailMoviesCastCell: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return data.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: String.className(DetailMoviesCollectionViewCell.self), for: indexPath) as? DetailMoviesCollectionViewCell {
            cell.configureCell(data: data[indexPath.row])
            cell.animateCell()
            return cell
        }
        return UICollectionViewCell()
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: (frame.width - 90) / 3, height: 145)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
}

