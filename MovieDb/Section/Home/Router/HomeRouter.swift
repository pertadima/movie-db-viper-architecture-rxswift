//
//  HomeRouter.swift
//  MovieDb
//
//  Created by Irfan Pertadima on 3/10/19.
//  Copyright © 2019 Irfan Pertadima. All rights reserved.
//

import Foundation
import UIKit

class HomeRouter: PresenterToRouterProtocol {
    static func createModule() -> HomeViewController {
        let controller = HomeViewController()
        let presenter: ViewToPresenterProtocol & InteractorToPresenterProtocol = HomePresenter()
        let interactor: PresenterToInteractorProtocol = HomeInteractor()
        let router:PresenterToRouterProtocol = HomeRouter()
        
        controller.presentor = presenter
        controller.title = "Movie DB"
        presenter.view = controller
        presenter.router = router
        presenter.interactor = interactor
        interactor.presenter = presenter
        return controller
    }
    
    func showMovieController(navigationController: UINavigationController,  menuEnum: HomeEnumSection) {
        let movieModule = MovieRouter.createModule()
        movieModule.title = menuEnum.title
        movieModule.menuEnum = menuEnum
        navigationController.pushViewController(movieModule, animated: true)
    }
    
    func showMovieController(navigationController: UINavigationController, genres: MovieGenresModel?) {
        let movieModule = MovieRouter.createModule()
        movieModule.title = genres?.name ?? ""
        movieModule.genre = genres
        navigationController.pushViewController(movieModule, animated: true)
    }
    
    func showDetailMovieController(navigationController: UINavigationController, movie: UpcomingMoviesModel?) {
        let detailModule = DetailMovieRouter.createModule()
        detailModule.movie = movie
        navigationController.pushViewController(detailModule, animated: true)
    }
}
