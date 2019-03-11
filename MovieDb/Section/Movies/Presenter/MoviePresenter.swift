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
    
    func startFetchingUpcomingMovie() {
        interactor?.startFetchingUpcomingMovie()
    }
}

extension MoviePresenter: MoviesInteratorToPresenterProtocol {
    func showUpcomingMovies(data: UpComingMoviesResponse?) {
        view?.showUpcomingMovies(data: data)
    }
    
    func showPopularMoviesData(data: UpComingMoviesResponse?) {
        view?.showPopularMoviesData(data: data)
    }
    
    func showNowPlayingMovie(data: UpComingMoviesResponse?) {
        view?.showNowPlayingMovie(data: data)
    }
    
    func fetchFailed(error: String) {
        view?.fetchFailed(error: error)
    }
    
    func isLoading(isLoading: Bool) {
        view?.isLoading(isLoading: isLoading)
    }
}
