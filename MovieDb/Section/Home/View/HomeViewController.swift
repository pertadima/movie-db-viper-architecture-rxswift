//
//  ViewController.swift
//  MovieDb
//
//  Created by Irfan Pertadima on 3/9/19.
//  Copyright © 2019 Irfan Pertadima. All rights reserved.
//

import UIKit
import SnapKit
import RxSwift

class HomeViewController: UIViewController {
    var presentor:ViewToPresenterProtocol?
    var data: [UpcomingMoviesModel] = []
    var dataPlayingNow: [UpcomingMoviesModel] = []
    var dataPopularMovie: [UpcomingMoviesModel] = []
    var dataGenre: [MovieGenresModel] = []
    var dotIndicator: DotIndicatorView?
    
    internal let menuSection : [HomeEnumSection] = [.nowPlaying, .popularMovie, .genreMovie, .upComingMovie]
    
    let snackbar = Snackbar(message: "",
                               duration: .middle,
                               actionText: "Close",
                               actionBlock: { (snackbar) in
                                snackbar.dismiss()
    })
    
    let searchController: UISearchController? = UISearchController(searchResultsController: nil)
    
    private lazy var tableView : UITableView = {
        let tableView = addComponent.tableView(dataSource: self, delegate: self)
        tableView.sectionHeaderHeight = UITableView.automaticDimension
        tableView.registerCellClass(HomeUpcomingMovieTableViewCell.self)
        tableView.registerCellClass(HomeNowPlayingTableViewCell.self)
        tableView.registerCellClass(HomePopularMovieTableViewCell.self)
        tableView.registerCellClass(HomeGenreMovieTableViewCell.self)
        tableView.estimatedRowHeight = view.frame.height
        return tableView
    }()
    
    lazy var refreshControl: UIRefreshControl = {
        let refreshControl = UIRefreshControl()
        refreshControl.addTarget(self, action:
            #selector(handleRefresh(_:)),
                                 for: .valueChanged)
        refreshControl.tintColor = AppColor.appPrimary.color
        return refreshControl
    }()
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.setNavigationBarHidden(false, animated: true)
        self.navigationController?.navigationBar.isTranslucent = false
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dotIndicator = DotIndicatorView()
        view.addBackgroundColor(addColor: .white)
        view.addSubview(tableView)
        tableView.addSubview(refreshControl)
        setConstraint()
        fetchPresenter()
    }
    
    private func fetchPresenter() {
       presentor?.fetchingHome()
    }
    
    
    private func setConstraint() {
        tableView.snp.makeConstraints { (make) in
            make.top.equalToSuperview()
            make.left.equalToSuperview()
            make.right.equalToSuperview()
            make.bottom.equalToSuperview()
        }
    }
    
    @objc func handleRefresh(_ refreshControl: UIRefreshControl) {
        fetchPresenter()
    }
}

extension HomeViewController: PresenterToViewProtocol {
    func showGenreMovie(data: [MovieGenresModel]?) {
        self.dataGenre = data ?? []
        self.tableView.reloadData()
    }
    
    func showUpcomingMovies(data: [UpcomingMoviesModel]?) {
        self.data = data ?? []
        self.tableView.reloadData()
    }
    
    func showNowPlayingMovie(data: [UpcomingMoviesModel]?) {
        self.dataPlayingNow = data ?? []
        self.tableView.reloadData()
    }
    
    func showPopularMoviesData(data: [UpcomingMoviesModel]?) {
        self.dataPopularMovie = Array(data?.prefix(upTo: 5) ?? [])
        self.tableView.reloadData()
    }
    
    
    func showError(error: String) {
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


