//
//  HomeProtocol.swift
//  MovieDb
//
//  Created by Irfan Pertadima on 3/10/19.
//  Copyright © 2019 Irfan Pertadima. All rights reserved.
//

import Foundation
import UIKit

protocol ViewToPresenterProtocol: class{
    
    var view: PresenterToViewProtocol? {get set}
    var interactor: PresenterToInteractorProtocol? {get set}
    var router: PresenterToRouterProtocol? {get set}
    func fetchingHome()
    func showMovieController(navigationController:UINavigationController, menuEnum: HomeEnumSection)
    func showMovieController(navigationController:UINavigationController, genres: MovieGenresModel?)
    func showDetailMovieController(navigationController: UINavigationController, movie: UpcomingMoviesModel?)
}

protocol PresenterToViewProtocol: class{
    func showUpcomingMovies(data: [UpcomingMoviesModel]?)
    func showNowPlayingMovie(data: [UpcomingMoviesModel]?)
    func showPopularMoviesData(data: [UpcomingMoviesModel]?)
    func showGenreMovie(data: [MovieGenresModel]?)
    func showError(error: String)
    func isLoading(isLoading: Bool)
}

protocol PresenterToRouterProtocol: class {
    static func createModule()-> HomeViewController
    func showMovieController(navigationController:UINavigationController, menuEnum: HomeEnumSection)
    func showMovieController(navigationController:UINavigationController, genres: MovieGenresModel?)
    func showDetailMovieController(navigationController: UINavigationController, movie: UpcomingMoviesModel?)
}

protocol PresenterToInteractorProtocol: class {
    var presenter:InteractorToPresenterProtocol? {get set}
    func fetchingHome()
}

protocol InteractorToPresenterProtocol: class {
    func fetchedUpcomingMoviesSuccess(data: [UpcomingMoviesModel]?)
    func showNowPlayingMovie(data: [UpcomingMoviesModel]?)
    func showPopularMoviesData(data: [UpcomingMoviesModel]?)
    func showGenreMovie(data: [MovieGenresModel]?)
    func fetchFailed(error: String)
    func isLoading(isLoading: Bool)
}
