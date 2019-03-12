//
//  HomeInteractor.swift
//  MovieDb
//
//  Created by Irfan Pertadima on 3/10/19.
//  Copyright © 2019 Irfan Pertadima. All rights reserved.
//

import Foundation
import RxSwift

class HomeInteractor : PresenterToInteractorProtocol {
    var presenter: InteractorToPresenterProtocol?
    private let service: NetworkManager
    let disposeBag = DisposeBag()
    
    init(service: NetworkManager = NetworkManager()) {
        self.service = service
    }
    
    func startFetchingUpcomingMovie() {
        presenter?.isLoading(isLoading: true)
        service.fetchUpcomingMovie()
        .observeOn(MainScheduler.instance)
        .subscribe(onSuccess: { [weak self] tasks in
                guard let `self` = self, let tasks = tasks else { return }
                self.presenter?.fetchedUpcomingMoviesSuccess(data: tasks.results)
                self.presenter?.isLoading(isLoading: false)
            }) { [weak self] error in
                guard let errorValue = error as? APIError else { return }
                self?.presenter?.fetchFailed(error: errorValue.message)
                self?.presenter?.isLoading(isLoading: false)
        }.disposed(by: disposeBag)
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
                guard let errorValue = error as? APIError else { return }
                self?.presenter?.fetchFailed(error: errorValue.message)
                self?.presenter?.isLoading(isLoading: false)
            }.disposed(by: disposeBag)
    }
    
    func startFechingPopularMovie() {
        presenter?.isLoading(isLoading: true)
        service.fetchPopularMovie()
            .observeOn(MainScheduler.instance)
            .subscribe(onSuccess: { [weak self] tasks in
                guard let `self` = self, let tasks = tasks else { return }
                self.presenter?.showPopularMoviesData(data: tasks.results)
                self.presenter?.isLoading(isLoading: false)
            }) { [weak self] error in
                guard let errorValue = error as? APIError else { return }
                self?.presenter?.fetchFailed(error: errorValue.message)
                self?.presenter?.isLoading(isLoading: false)
            }.disposed(by: disposeBag)
    }
    
    func startFechingGenres() {
        presenter?.isLoading(isLoading: true)
        service.fetchGenreMovie()
            .observeOn(MainScheduler.instance)
            .subscribe(onSuccess: { [weak self] tasks in
                guard let `self` = self, let tasks = tasks else { return }
                self.presenter?.showGenreMovie(data: tasks.genres)
                self.presenter?.isLoading(isLoading: false)
            }) { [weak self] error in
                guard let errorValue = error as? APIError else { return }
                self?.presenter?.fetchFailed(error: errorValue.message)
                self?.presenter?.isLoading(isLoading: false)
            }.disposed(by: disposeBag)
    }
}
