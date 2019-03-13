//
//  DetailMoviesProtocol.swift
//  MovieDb
//
//  Created by Irfan Pertadima on 3/12/19.
//  Copyright © 2019 Irfan Pertadima. All rights reserved.
//

import Foundation
import UIKit

protocol DetailMoviesVoiewToPresenterProcol: class {
    var view: DetailMoviesPresenterToViewProtocol? {get set}
    var interactor: DetailMoviesPresenterToInteractorProtocol? {get set}
    var router: DetailMoviesPresenterToRouterProtocol? {get set}
    func startFechingDetailMovie(id: Int)
    func showMovieController(navigationController:UINavigationController, genres: MovieGenresModel?)
}

protocol DetailMoviesPresenterToViewProtocol: class {
    func successLoadDetail(data: DetailMoviesResponse?)
    func fetchFailed(error: String)
    func isLoading(isLoading: Bool)
}

protocol DetailMoviesPresenterToRouterProtocol: class {
    static func createModule()-> DetailMoviesViewController
    func showMovieController(navigationController:UINavigationController, genres: MovieGenresModel?)
}

protocol DetailMoviesPresenterToInteractorProtocol: class {
    var presenter: DetailMoviesInteractorToPresenterProtocol? {get set}
    func startFechingDetailMovie(id: Int)
}

protocol DetailMoviesInteractorToPresenterProtocol: class {
    func successLoadDetail(data: DetailMoviesResponse?)
    func fetchFailed(error: String)
    func isLoading(isLoading: Bool)
}
