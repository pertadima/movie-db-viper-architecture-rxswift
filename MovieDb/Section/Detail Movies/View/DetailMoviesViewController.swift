//
//  DetailMoviesViewController.swift
//  MovieDb
//
//  Created by Irfan Pertadima on 3/12/19.
//  Copyright © 2019 Irfan Pertadima. All rights reserved.
//

import UIKit
import SnapKit

class DetailMoviesViewController: UIViewController {
    var presentor: DetailMoviesVoiewToPresenterProcol?
    var dotIndicator: DotIndicatorView?
    var detailSection : [DetailMoviesEnum] = [.header, .desc, .genre]
    var data : DetailMoviesResponse?
    
    let snackbar = Snackbar(message: "",
                            duration: .middle,
                            actionText: "Close",
                            actionBlock: { (snackbar) in
                                snackbar.dismiss()
    })
    var movie: UpcomingMoviesModel?
    
    private lazy var tableView : UITableView = {
        let tableView = addComponent.tableView(dataSource: self, delegate: self)
        tableView.sectionHeaderHeight = UITableView.automaticDimension
        tableView.registerCellClass(DetailMoviesHeaderCell.self)
        tableView.registerCellClass(DetailMovieDescCell.self)
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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addBackgroundColor(addColor: .white)
        view.addSubview(tableView)
        tableView.addSubview(refreshControl)
        setConstraint()
        dotIndicator = DotIndicatorView()
        presentor?.startFechingDetailMovie(id: movie?.id ?? 0)
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
        presentor?.startFechingDetailMovie(id: movie?.id ?? 0)
    }
}

extension DetailMoviesViewController: DetailMoviesPresenterToViewProtocol {
    func successLoadDetail(data: DetailMoviesResponse?) {
        self.data = data
        tableView.reloadData()
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
            refreshControl.endRefreshing()
        }
    }
}
