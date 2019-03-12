//
//  DetailMoviesInteractor.swift
//  MovieDb
//
//  Created by Irfan Pertadima on 3/12/19.
//  Copyright © 2019 Irfan Pertadima. All rights reserved.
//

import Foundation
import RxSwift

class DetailMovieInteractor: DetailMoviesPresenterToInteractorProtocol {
    var presenter: DetailMoviesInteractorToPresenterProtocol?
    private let service: NetworkManager
    let disposeBag = DisposeBag()
    
    init(service: NetworkManager = NetworkManager()) {
        self.service = service
    }
    
    func startFechingDetailMovie(id: Int) {
        presenter?.isLoading(isLoading: true)
        service.fetchDetailMovie(id: id)
            .observeOn(MainScheduler.instance)
            .subscribe(onSuccess: { [weak self] tasks in
                guard let `self` = self, let tasks = tasks else { return }
                self.presenter?.successLoadDetail(data: tasks)
                self.presenter?.isLoading(isLoading: false)
            }) { [weak self] error in
                guard let errorValue = error as? APIError else { return }
                self?.presenter?.fetchFailed(error: errorValue.message)
                self?.presenter?.isLoading(isLoading: false)
            }.disposed(by: disposeBag)
    }
}
