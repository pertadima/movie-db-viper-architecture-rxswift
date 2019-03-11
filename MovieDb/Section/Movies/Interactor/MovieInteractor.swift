//
//  MovieInteractor.swift
//  MovieDb
//
//  Created by Irfan Pertadima on 3/11/19.
//  Copyright © 2019 Irfan Pertadima. All rights reserved.
//

import Foundation
import RxSwift

class MovieInteractor: MoviesPresenterToInteratorProtocol {
    var presenter: MoviesInteratorToPresenterProtocol?
    private let service: NetworkManager
    let disposeBag = DisposeBag()
    
    init(service: NetworkManager = NetworkManager()) {
        self.service = service
    }
    
    func startFechingPlayingNowMovie() {
        presenter?.isLoading(isLoading: true)
        service.fetchPlayingNowMovie()
            .observeOn(MainScheduler.instance)
            .subscribe(onSuccess: { [weak self] tasks in
                guard let `self` = self, let tasks = tasks else { return }
                self.presenter?.showNowPlayingMovie(data: tasks.results)
                self.presenter?.isLoading(isLoading: false)
            }) { [weak self] error in
                self?.presenter?.fetchFailed(error: error.localizedDescription)
                self?.presenter?.isLoading(isLoading: false)
            }.disposed(by: disposeBag)
    }
}
