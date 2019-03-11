//
//  MoviePresenter.swift
//  MovieDb
//
//  Created by Irfan Pertadima on 3/11/19.
//  Copyright © 2019 Irfan Pertadima. All rights reserved.
//

import Foundation
import RxSwift

class MoviePresenter: MoviesViewToPresenterProtocol {
    var view: MoviesPresenterToViewProtocol?
    
    var interactor: MoviesPresenterToInteratorProtocol?
    
    var router: MoviesPresenterToRouterProtocol?
    
    func startFechingPlayingNowMovie() {
        interactor?.startFechingPlayingNowMovie()
    }
    
    func startFechingPopularMovie() {
        interactor?.startFechingPlayingNowMovie()
    }
}

extension MoviePresenter: MoviesInteratorToPresenterProtocol {
    func showPopularMoviesData(data: [UpcomingMoviesModel]?) {
        view?.showPopularMoviesData(data: data)
    }
    
    func showNowPlayingMovie(data: [UpcomingMoviesModel]?) {
        view?.showNowPlayingMovie(data: data)
    }
    
    func fetchFailed(error: String) {
        view?.fetchFailed(error: error)
    }
    
    func isLoading(isLoading: Bool) {
        view?.isLoading(isLoading: isLoading)
    }
}
