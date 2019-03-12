//
//  HomeTableViewCell.swift
//  MovieDb
//
//  Created by Irfan Pertadima on 3/10/19.
//  Copyright © 2019 Irfan Pertadima. All rights reserved.
//

import UIKit
import SnapKit

class HomeUpcomingMovieTableViewCell : BaseTableViewCell {
    var data: [UpcomingMoviesModel] = []
    var presentor:ViewToPresenterProtocol?
    var navigationController: UINavigationController?
    
    private lazy var collectionView : UICollectionView = {
        let collectionView = addComponent.collectionView(id: "collecitonViewCell", delegate: self, datasource: self, scrollDirection: .horizontal, isEstimatedItemSize: false)
        collectionView.contentInset = UIEdgeInsets(top: 10, left: 20, bottom: 10, right: 20)
        collectionView.scrollIndicatorInsets = UIEdgeInsets(top: 00, left: 30, bottom: 0, right: 30)
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.registerCellClass(HomeUpcomingMoviesCollectionViewCell.self)
        return collectionView
    }()
    
    override func prepareView() {
        addBackgroundColor(addColor: .clear)
        addSubview(collectionView)
    }
    
    
    override func setConstraintsView() {
        collectionView.snp.makeConstraints{(make) in
            make.top.equalToSuperview()
            make.left.equalToSuperview()
            make.right.equalToSuperview()
            make.bottom.equalToSuperview()
            make.height.equalTo(200)
        }
    }
    
    func configureData(data: [UpcomingMoviesModel]?) {
        self.data = data ?? []
        collectionView.reloadData()
    }
}

extension HomeUpcomingMovieTableViewCell: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return data.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: String.className(HomeUpcomingMoviesCollectionViewCell.self), for: indexPath) as? HomeUpcomingMoviesCollectionViewCell {
            cell.configureCell(data: data[indexPath.row])
            cell.animateCell()
            return cell
        }
        return UICollectionViewCell()
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        presentor?.showDetailMovieController(navigationController: self.navigationController ?? UINavigationController(), movie: data[indexPath.row])
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
       return CGSize(width: 120, height: 190)
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
