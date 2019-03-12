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
        if menuEnum == .nowPlaying {
             movieModule.presentor?.startFechingPlayingNowMovie()
        }
        
        if menuEnum == .popularMovie {
            movieModule.presentor?.startFechingPopularMovie()
        }
        
        if menuEnum == .upComingMovie {
            movieModule.presentor?.startFetchingUpcomingMovie()
        }
        
        navigationController.pushViewController(movieModule, animated: true)
    }
    
    func showDetailMovieController(navigationController: UINavigationController, movie: UpcomingMoviesModel?) {
        let detailModule = DetailMovieRouter.createModule()
        detailModule.presentor?.startFechingDetailMovie(id: movie?.id ?? 0)
        navigationController.pushViewController(detailModule, animated: true)
    }
}
