//
//  HomeNowPlayingCollectionViewCell.swift
//  MovieDb
//
//  Created by Irfan Pertadima on 3/10/19.
//  Copyright © 2019 Irfan Pertadima. All rights reserved.
//

import UIKit
import SnapKit

class HomeNowPlayingTableViewCell : BaseTableViewCell {
    var data: [UpcomingMoviesModel] = []
    var timer : Timer?
    var index = 0
    
    private lazy var collectionView : UICollectionView = {
        let collectionView = addComponent.collectionView(id: "collecitonViewCell", delegate: self, datasource: self, scrollDirection: .horizontal, isEstimatedItemSize: false)
        collectionView.contentInset = UIEdgeInsets(top: 10, left: 20, bottom: 10, right: 20)
        collectionView.scrollIndicatorInsets = UIEdgeInsets(top: 00, left: 30, bottom: 0, right: 30)
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.registerCellClass(HomeNowPlayingMoviesCollectionViewCell.self)
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
            make.height.equalTo(320)
        }
        
        line.snp.makeConstraints{(make) in
            make.top.equalTo(collectionView.snp_bottomMargin).offset(40)
            make.left.equalToSuperview().offset(20)
            make.right.equalToSuperview().offset(-20)
            make.height.equalTo(1)
            make.bottom.equalToSuperview().offset(0)
        }
    }
    
    func configureData(data: [UpcomingMoviesModel]?) {
        index = 0
        self.data = data ?? []
        collectionView.reloadData()
        addTimer()
    }
    
    private func addTimer() {
        let timer1 = Timer(timeInterval: 2, target: self, selector: #selector(handleTimer), userInfo: nil, repeats: true)
        RunLoop.main.add(timer1, forMode: RunLoop.Mode.common)
        self.timer = timer1
    }
    
    @objc private func handleTimer(){
        if data.count != 0 {
            index += 1
            index = index < self.data.count ? index : 0
            let indexPath = IndexPath(row: index, section: 0)
            collectionView.scrollToItem(at: indexPath, at: .left, animated: true)
        }
    }
}

extension HomeNowPlayingTableViewCell: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return data.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: String.className(HomeNowPlayingMoviesCollectionViewCell.self), for: indexPath) as? HomeNowPlayingMoviesCollectionViewCell {
            cell.configureCell(data: data[indexPath.row])
            cell.animateCell()
            return cell
        }
        return UICollectionViewCell()
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 200, height: 290)
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
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        index = Int(self.collectionView.contentOffset.x / 200)
    }
}


