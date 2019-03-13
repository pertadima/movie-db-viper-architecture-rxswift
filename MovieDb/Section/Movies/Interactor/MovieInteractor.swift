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
                self.presenter?.onSuccess(data: tasks)
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
                self.presenter?.onSuccess(data: tasks)
                self.presenter?.isLoading(isLoading: false)
            }) { [weak self] error in
                guard let errorValue = error as? APIError else { return }
                self?.presenter?.fetchFailed(error: errorValue.message)
                self?.presenter?.isLoading(isLoading: false)
            }.disposed(by: disposeBag)
    }
    
    func startFetchingUpcomingMovie() {
        presenter?.isLoading(isLoading: true)
        service.fetchUpcomingMovie()
            .observeOn(MainScheduler.instance)
            .subscribe(onSuccess: { [weak self] tasks in
                guard let `self` = self, let tasks = tasks else { return }
                self.presenter?.onSuccess(data: tasks)
                self.presenter?.isLoading(isLoading: false)
            }) { [weak self] error in
                guard let errorValue = error as? APIError else { return }
                self?.presenter?.fetchFailed(error: errorValue.message)
                self?.presenter?.isLoading(isLoading: false)
            }.disposed(by: disposeBag)
    }
    
    func startFetchingMoviesPaging(page: Int, enumData: HomeEnumSection) {
        presenter?.isLoading(isLoading: true)
        service.fetchMoviesPaging(page: page, enumData: enumData)
            .observeOn(MainScheduler.instance)
            .subscribe(onSuccess: { [weak self] tasks in
                guard let `self` = self, let tasks = tasks else { return }
                self.presenter?.onSuccessPaging(data: tasks)
                self.presenter?.isLoading(isLoading: false)
            }) { [weak self] error in
                guard let errorValue = error as? APIError else { return }
                self?.presenter?.fetchFailed(error: errorValue.message)
                self?.presenter?.isLoading(isLoading: false)
            }.disposed(by: disposeBag)
    }
    
    func startFetchingMovieByGenre(genre: MovieGenresModel) {
        presenter?.isLoading(isLoading: true)
        service.fetchMoviesByGenre(genre: "\(genre.id ?? 0)")
            .observeOn(MainScheduler.instance)
            .subscribe(onSuccess: { [weak self] tasks in
                guard let `self` = self, let tasks = tasks else { return }
                self.presenter?.onSuccess(data: tasks)
                self.presenter?.isLoading(isLoading: false)
            }) { [weak self] error in
                guard let errorValue = error as? APIError else { return }
                self?.presenter?.fetchFailed(error: errorValue.message)
                self?.presenter?.isLoading(isLoading: false)
            }.disposed(by: disposeBag)
    }
}
