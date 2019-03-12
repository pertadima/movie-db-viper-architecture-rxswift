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
    
    lazy var refreshControl: UIRefreshControl = {
        let refreshControl = UIRefreshControl()
        refreshControl.addTarget(self, action:
            #selector(handleRefresh(_:)),
                                 for: .valueChanged)
        refreshControl.tintColor = AppColor.appPrimary.color
        return refreshControl
    }()
    
    let snackbar = Snackbar(message: "",
                            duration: .middle,
                            actionText: "Close",
                            actionBlock: { (snackbar) in
                                snackbar.dismiss()
    })
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        dotIndicator = DotIndicatorView()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addBackgroundColor(addColor: .white)
    }
    
    @objc func handleRefresh(_ refreshControl: UIRefreshControl) {
        
    }
}

extension DetailMoviesViewController: DetailMoviesPresenterToViewProtocol {
    func successLoadDetail(data: DetailMoviesResponse?) {
        
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
