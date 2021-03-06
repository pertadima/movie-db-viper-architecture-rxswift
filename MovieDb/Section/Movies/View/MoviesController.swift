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
    var data: UpComingMoviesResponse?
    var dataList: [UpcomingMoviesModel] = []
    var menuEnum: HomeEnumSection?
    let snackbar = Snackbar(message: "",
                            duration: .middle,
                            actionText: "Close",
                            actionBlock: { (snackbar) in
                                snackbar.dismiss()
    })
    var genre: MovieGenresModel?
    var currentPage: Int = 1
    var totalPage: Int = 1
    var beginIndex: Int = 0
    var endIndex: Int = 0
    
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
        collectionView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: 20, right: 0)
        collectionView.scrollIndicatorInsets = UIEdgeInsets(top: 0, left: 0, bottom: 30, right: 0)
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.registerCellClass(MoviesCollectionViewCell.self)
        collectionView.prefetchDataSource = self
        collectionView.register(MoviesHeaderCollectionView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "header")
        return collectionView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dotIndicator = DotIndicatorView()
        view.addBackgroundColor(addColor: .white)
        view.addSubview(collectionView)
        collectionView.addSubview(refreshControl)
        setConstraintView()
        fetchPresenter()
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
        fetchPresenter()
    }
    
    private func fetchPresenter() {
        switch menuEnum {
        case .nowPlaying?:
            presentor?.startFechingPlayingNowMovie()
        case .popularMovie?:
            presentor?.startFechingPopularMovie()
        case .upComingMovie?:
            presentor?.startFetchingUpcomingMovie()
        default:
            presentor?.startFetchingMovieByGenre(genre: genre ?? MovieGenresModel())
        }
    }
}

extension MoviesController: MoviesPresenterToViewProtocol {
    func onSuccess(data: UpComingMoviesResponse?) {
        updateData(data: data)
    }
    
    func onSuccessPaging(data: UpComingMoviesResponse?) {
       updateDataPaging(data: data)
    }
    
    private func updateDataPaging(data: UpComingMoviesResponse?) {
        self.data = data
        self.beginIndex = dataList.count
        self.totalPage = data?.totalPages ?? 1
        self.dataList += data?.results ?? []
        
        self.collectionView.performBatchUpdates({
            var indexPathsCollection: [IndexPath] = []
            if self.beginIndex < self.dataList.count - 1 {
                for i in beginIndex...self.dataList.count - 1 {
                    indexPathsCollection.append(IndexPath(item: i, section: 0))
                }
                self.collectionView.insertItems(at: indexPathsCollection)
            }
        }, completion: nil)
    }
    
    private func updateData(data: UpComingMoviesResponse?) {
        self.dataList.removeAll()
        self.beginIndex = 0
        self.data = data
        self.dataList = data?.results ?? []
        self.totalPage = data?.totalPages ?? 1
        self.currentPage = data?.pages ?? 1
        self.collectionView.reloadData()
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
