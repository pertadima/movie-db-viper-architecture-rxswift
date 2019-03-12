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
        interactor?.startFechingPopularMovie()
    }
    
    func startFetchingUpcomingMovie() {
        interactor?.startFetchingUpcomingMovie()
    }
    
    func startFetchingMoviesPaging(page: Int, enumData: HomeEnumSection) {
        interactor?.startFetchingMoviesPaging(page: page, enumData: enumData)
    }
}

extension MoviePresenter: MoviesInteratorToPresenterProtocol {
    func onSuccess(data: UpComingMoviesResponse?) {
        view?.onSuccess(data: data)
    }
    
    func onSuccessPaging(data: UpComingMoviesResponse?) {
        view?.onSuccessPaging(data: data)
    }
    
    func fetchFailed(error: String) {
        view?.fetchFailed(error: error)
    }
    
    func isLoading(isLoading: Bool) {
        view?.isLoading(isLoading: isLoading)
    }
}
