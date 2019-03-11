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
}

protocol MoviesPresenterToViewProtocol: class {
    func showNowPlayingMovie(data: [UpcomingMoviesModel]?)
    func showPopularMoviesData(data: [UpcomingMoviesModel]?)
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
}

protocol MoviesInteratorToPresenterProtocol: class {
    func showNowPlayingMovie(data: [UpcomingMoviesModel]?)
    func showPopularMoviesData(data: [UpcomingMoviesModel]?)
    func fetchFailed(error: String)
    func isLoading(isLoading: Bool)
}

