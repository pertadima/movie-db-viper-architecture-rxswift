//
//  Movies.swift
//  MovieDb
//
//  Created by Irfan Pertadima on 3/11/19.
//  Copyright © 2019 Irfan Pertadima. All rights reserved.
//

import Foundation
import UIKit

class MovieRouter: MoviesPresenterToRouterProtocol {
    static func createModule() -> MoviesController {
        let controller = MoviesController()
        let presenter: MoviesViewToPresenterProtocol & MoviesInteratorToPresenterProtocol = MoviePresenter()
        let interactor: MoviesPresenterToInteratorProtocol = MovieInteractor()
        let router :MoviesPresenterToRouterProtocol = MovieRouter()
        
        controller.presentor = presenter
        controller.title = "Movie DB"
        presenter.view = controller
        presenter.router = router
        presenter.interactor = interactor
        interactor.presenter = presenter
        return controller
    }
}
