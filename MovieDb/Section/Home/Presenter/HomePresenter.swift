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
    
    func startFetchingUpcomingMovie() {
        interactor?.startFetchingUpcomingMovie()
    }
    
    func startFechingPlayingNowMovie() {
        interactor?.startFechingPlayingNowMovie()
    }
    
    func startFechingPopularMovie() {
        interactor?.startFechingPopularMovie()
    }
    
    func showMovieController(navigationController: UINavigationController) {
        
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
}
