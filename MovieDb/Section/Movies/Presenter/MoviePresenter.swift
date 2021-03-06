//
//  MoviePresenter.swift
//  MovieDb
//
//  Created by Irfan Pertadima on 3/11/19.
//  Copyright © 2019 Irfan Pertadima. All rights reserved.
//
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
    
    func startFetchingMovieByGenre(genre: MovieGenresModel) {
        interactor?.startFetchingMovieByGenre(genre: genre)
    }
    
    func showDetailMovieController(navigationController: UINavigationController, movie: UpcomingMoviesModel?) {
        router?.showDetailMovieController(navigationController: navigationController, movie: movie)
    }
    
    func startFetchingMovieByGenrePaging(genre: MovieGenresModel, page: Int) {
        interactor?.startFetchingMovieByGenrePaging(genre: genre, page: page)
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
