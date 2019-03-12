//
//  DetailMoviesInteractor.swift
//  MovieDb
//
//  Created by Irfan Pertadima on 3/12/19.
//  Copyright © 2019 Irfan Pertadima. All rights reserved.
//

import RxSwift

class DetailMoviesPresenter: DetailMoviesVoiewToPresenterProcol {
    var view: DetailMoviesPresenterToViewProtocol?

    var interactor: DetailMoviesPresenterToInteractorProtocol?
    
    var router: DetailMoviesPresenterToRouterProtocol?
    
    func startFechingDetailMovie(id: Int) {
        interactor?.startFechingDetailMovie(id: id)
    }
}

extension DetailMoviesPresenter: DetailMoviesInteractorToPresenterProtocol {
    func successLoadDetail(data: DetailMoviesResponse?) {
        view?.successLoadDetail(data: data)
    }
    
    func fetchFailed(error: String) {
        view?.fetchFailed(error: error)
    }
    
    func isLoading(isLoading: Bool) {
        view?.isLoading(isLoading: isLoading)
    }
}
