//
//  MoviesProtocol.swift
//  MovieDb
//
//  Created by Irfan Pertadima on 3/11/19.
//  Copyright © 2019 Irfan Pertadima. All rights reserved.
//

import Foundation
import UIKit

protocol MoviesViewToPresenterProtocol: class {
    var view: MoviesPresenterToViewProtocol? {get set}
    var interactor: MoviesPresenterToInteratorProtocol? {get set}
    var router: MoviesPresenterToRouterProtocol? {get set}
    func startFechingPlayingNowMovie()
    func startFechingPopularMovie()
    func startFetchingUpcomingMovie()
    func startFetchingMovieByGenre(genre: MovieGenresModel)
    func startFetchingMovieByGenrePaging(genre: MovieGenresModel,page: Int)
    func startFetchingMoviesPaging(page: Int, enumData: HomeEnumSection)
    func showDetailMovieController(navigationController: UINavigationController, movie: UpcomingMoviesModel?)
}

protocol MoviesPresenterToViewProtocol: class {
    func onSuccess(data: UpComingMoviesResponse?)
    func onSuccessPaging(data: UpComingMoviesResponse?)
    func fetchFailed(error: String)
    func isLoading(isLoading: Bool)
}

protocol MoviesPresenterToRouterProtocol: class {
    static func createModule()-> MoviesController
    func showDetailMovieController(navigationController: UINavigationController, movie: UpcomingMoviesModel?)
}

protocol MoviesPresenterToInteratorProtocol: class {
    var presenter:MoviesInteratorToPresenterProtocol? {get set}
    func startFechingPlayingNowMovie()
    func startFechingPopularMovie()
    func startFetchingUpcomingMovie()
    func startFetchingMovieByGenre(genre: MovieGenresModel)
    func startFetchingMovieByGenrePaging(genre: MovieGenresModel,page: Int)
    func startFetchingMoviesPaging(page: Int, enumData: HomeEnumSection)
}

protocol MoviesInteratorToPresenterProtocol: class {
    func onSuccess(data: UpComingMoviesResponse?)
    func onSuccessPaging(data: UpComingMoviesResponse?)
    func fetchFailed(error: String)
    func isLoading(isLoading: Bool)
}

