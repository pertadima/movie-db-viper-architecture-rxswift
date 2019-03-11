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
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addBackgroundColor(addColor: .white)
    }
}

extension MoviesController: MoviesPresenterToViewProtocol {
    func showNowPlayingMovie(data: [UpcomingMoviesModel]?) {
        
    }
    
    func fetchFailed(error: String) {
        
    }
    
    func isLoading(isLoading: Bool) {
        
    }
}
