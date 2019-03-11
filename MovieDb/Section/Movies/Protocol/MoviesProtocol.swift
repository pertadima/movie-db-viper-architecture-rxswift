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
    func startFechingPlayingNowMoviePaging(page: Int)
}

protocol MoviesPresenterToViewProtocol: class {
    func showNowPlayingMovie(data: UpComingMoviesResponse?)
    func showPopularMoviesData(data: UpComingMoviesResponse?)
    func showUpcomingMovies(data: UpComingMoviesResponse?)
    func showNowPlayingMoviePaging(data: UpComingMoviesResponse?)
    func fetchFailed(error: String)
    func isLoading(isLoading: Bool)
}

protocol MoviesPresenterToRouterProtocol: class {
    static func createModule()-> MoviesController
}

protocol MoviesPresenterToInteratorProtocol: class {
    var presenter:MoviesInteratorToPresenterProtocol? {get set}
    func startFechingPlayingNowMovie()
    func startFechingPopularMovie()
    func startFetchingUpcomingMovie()
    func startFechingPlayingNowMoviePaging(page: Int)
}

protocol MoviesInteratorToPresenterProtocol: class {
    func showNowPlayingMovie(data: UpComingMoviesResponse?)
    func showPopularMoviesData(data: UpComingMoviesResponse?)
    func showNowPlayingMoviePaging(data: UpComingMoviesResponse?)
    func fetchFailed(error: String)
    func isLoading(isLoading: Bool)
    func showUpcomingMovies(data: UpComingMoviesResponse?)
}

