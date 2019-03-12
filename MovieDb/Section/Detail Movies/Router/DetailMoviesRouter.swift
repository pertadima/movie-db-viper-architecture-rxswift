//
//  DetailMoviesRouter.swift
//  MovieDb
//
//  Created by Irfan Pertadima on 3/12/19.
//  Copyright © 2019 Irfan Pertadima. All rights reserved.
//

import Foundation
import UIKit

class DetailMovieRouter: DetailMoviesPresenterToRouterProtocol {
    static func createModule() -> DetailMoviesViewController {
        let presenter: DetailMoviesVoiewToPresenterProcol & DetailMoviesInteractorToPresenterProtocol = DetailMoviesPresenter()
        let interactor: DetailMoviesPresenterToInteractorProtocol = DetailMovieInteractor()
        let router:DetailMoviesPresenterToRouterProtocol = DetailMovieRouter()
        
        let controller = DetailMoviesViewController()
        controller.presentor = presenter
        controller.title = "Movie Detail"
        presenter.view = controller
        presenter.router = router
        presenter.interactor = interactor
        interactor.presenter = presenter
        return controller
    }
}
