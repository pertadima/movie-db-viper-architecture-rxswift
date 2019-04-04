//
//  HowGenreMovieTableViewCell.swift
//  MovieDb
//
//  Created by Irfan Pertadima on 3/11/19.
//  Copyright © 2019 Irfan Pertadima. All rights reserved.
//

import UIKit
import SnapKit

class HomeGenreMovieTableViewCell: BaseTableViewCell {
    var data: [MovieGenresModel] = []
    var presentor:ViewToPresenterProtocol?
    var detailMoviePresenter: DetailMoviesVoiewToPresenterProcol?
    var navigationController: UINavigationController?
    
    private lazy var collectionView : UICollectionView = {
        let collectionView = addComponent.collectionView(id: "collecitonViewCell", delegate: self, datasource: self, scrollDirection: .vertical, isEstimatedItemSize: false)
        collectionView.contentInset = UIEdgeInsets(top: 10, left: 20, bottom: 10, right: 20)
        collectionView.scrollIndicatorInsets = UIEdgeInsets(top: 00, left: 30, bottom: 0, right: 30)
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.registerCellClass(HomeGenreMovieCollectionViewCell.self)
        return collectionView
    }()
    
    private let line = addComponent.view(addColor: .lineGray)
    
    override func prepareView() {
        addBackgroundColor(addColor: .clear)
        addSubview(collectionView)
        addSubview(line)
    }
    
    override func setConstraintsView() {
        collectionView.snp.makeConstraints{(make) in
            make.top.equalToSuperview()
            make.left.equalToSuperview()
            make.right.equalToSuperview()
            make.height.equalTo(60)
        }
        
        line.snp.makeConstraints{(make) in
            make.top.equalTo(collectionView.snp_bottomMargin).offset(40)
            make.left.equalToSuperview().offset(20)
            make.right.equalToSuperview().offset(-20)
            make.height.equalTo(1)
            make.bottom.equalToSuperview().offset(0)
        }
    }
    
    func configureData(data: [MovieGenresModel]?) {
        self.data = data ?? []
        let plusValue = self.data.count % 2 == 0 ? 0 : 1
        collectionView.snp.updateConstraints{(make) in
            make.height.equalTo(60 * ((data?.count ?? 0) / 2 + plusValue))
        }
        collectionView.reloadData()
    }
}

extension HomeGenreMovieTableViewCell: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return data.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: String.className(HomeGenreMovieCollectionViewCell.self), for: indexPath) as? HomeGenreMovieCollectionViewCell {
            cell.configureData(data: data[indexPath.row])
            cell.animateCell()
            return cell
        }
        return UICollectionViewCell()
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if presentor != nil {
            presentor?.showMovieController(navigationController: navigationController ?? UINavigationController(), genres: data[indexPath.row])
        }
        
        if detailMoviePresenter != nil {
            detailMoviePresenter?.showMovieController(navigationController: navigationController ?? UINavigationController(), genres: data[indexPath.row])
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: (frame.width - 60) / 2, height: 50)
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
