//
//  HomePresenter.swift
//  MovieDb
//
//  Created by Irfan Pertadima on 3/10/19.
//  Copyright © 2019 Irfan Pertadima. All rights reserved.
//

import Foundation
import UIKit

class HomePresenter: ViewToPresenterProtocol {
    var view: PresenterToViewProtocol?
    
    var interactor: PresenterToInteractorProtocol?
    
    var router: PresenterToRouterProtocol?
    
    func fetchingHome() {
        interactor?.fetchingHome()
    }
    
    func showMovieController(navigationController: UINavigationController, menuEnum: HomeEnumSection) {
        router?.showMovieController(navigationController: navigationController, menuEnum: menuEnum)
    }
    
    func showDetailMovieController(navigationController: UINavigationController, movie: UpcomingMoviesModel?) {
        router?.showDetailMovieController(navigationController: navigationController, movie: movie)
    }
    
    func showMovieController(navigationController: UINavigationController, genres: MovieGenresModel?) {
        router?.showMovieController(navigationController: navigationController, genres: genres)
    }
}

extension HomePresenter: InteractorToPresenterProtocol {
    func fetchFailed(error: String) {
        view?.showError(error: error)
    }
    
    func isLoading(isLoading: Bool) {
        view?.isLoading(isLoading: isLoading)
    }
    
    func fetchedUpcomingMoviesSuccess(data: [UpcomingMoviesModel]?) {
        view?.showUpcomingMovies(data: data)
    }
    
    func showNowPlayingMovie(data: [UpcomingMoviesModel]?) {
        view?.showNowPlayingMovie(data: data)
    }
    
    func showPopularMoviesData(data: [UpcomingMoviesModel]?) {
        view?.showPopularMoviesData(data: data)
    }
    
    func showGenreMovie(data: [MovieGenresModel]?) {
        view?.showGenreMovie(data: data)
    }
}
