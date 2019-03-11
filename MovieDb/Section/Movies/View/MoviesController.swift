//
//  MoviesController.swift
//  MovieDb
//
//  Created by Irfan Pertadima on 3/11/19.
//  Copyright © 2019 Irfan Pertadima. All rights reserved.
//

import UIKit
import SnapKit

class MoviesController: UIViewController {
    var presentor: MoviesViewToPresenterProtocol?
    var dotIndicator: DotIndicatorView?
    var data: [UpcomingMoviesModel] = []
    
    let snackbar = Snackbar(message: "",
                            duration: .middle,
                            actionText: "Close",
                            actionBlock: { (snackbar) in
                                snackbar.dismiss()
    })
    
    lazy var refreshControl: UIRefreshControl = {
        let refreshControl = UIRefreshControl()
        refreshControl.addTarget(self, action:
            #selector(handleRefresh(_:)),
                                 for: .valueChanged)
        refreshControl.tintColor = AppColor.appPrimary.color
        return refreshControl
    }()
    
    private lazy var collectionView : UICollectionView = {
        let collectionView = addComponent.collectionView(id: "collecitonViewCell", delegate: self, datasource: self, scrollDirection: .vertical, isEstimatedItemSize: false)
        collectionView.contentInset = UIEdgeInsets(top: 20, left: 0, bottom: 20, right: 0)
        collectionView.scrollIndicatorInsets = UIEdgeInsets(top: 30, left: 0, bottom: 30, right: 0)
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.registerCellClass(MoviesCollectionViewCell.self)
        return collectionView
    }()
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        dotIndicator = DotIndicatorView()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addBackgroundColor(addColor: .white)
        view.addSubview(collectionView)
        collectionView.addSubview(refreshControl)
        setConstraintView()
    }
    
    private func setConstraintView() {
        collectionView.snp.makeConstraints{(make) in
            make.top.equalToSuperview()
            make.left.equalToSuperview()
            make.right.equalToSuperview()
            make.bottom.equalToSuperview()
        }
    }
    
    @objc func handleRefresh(_ refreshControl: UIRefreshControl) {
        
    }
}

extension MoviesController: MoviesPresenterToViewProtocol {
    func showPopularMoviesData(data: [UpcomingMoviesModel]?) {
        self.data = data ?? []
        collectionView.reloadData()
    }
    
    func showNowPlayingMovie(data: [UpcomingMoviesModel]?) {
        self.data = data ?? []
        collectionView.reloadData()
    }
    
    func fetchFailed(error: String) {
        snackbar.message = error
        snackbar.messageTextColor = AppColor.red.color
        snackbar.backgroundColor = AppColor.white.color
        snackbar.show()
    }
    
    func isLoading(isLoading: Bool) {
        isLoading ? dotIndicator?.startAnimating() : dotIndicator?.stopAnimating()
        if isLoading {
            self.refreshControl.endRefreshing()
        }
    }
}
