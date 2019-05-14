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
        Observable.zip(service.fetchDetailMovie(id: id).asObservable(),
                       service.fetchMoviesCast(id: id).asObservable())
            .observeOn(MainScheduler.instance)
            .subscribe(onNext: ({ (response) in
                let (detailMoviesResponse, detailMoviesCastResponse) = response
                self.presenter?.successLoadDetail(data: detailMoviesResponse, dataCast: detailMoviesCastResponse)
                self.presenter?.isLoading(isLoading: false)
            }), onError: ({(error) in
                guard let errorValue = error as? APIError else { return }
                self.presenter?.fetchFailed(error: errorValue.message)
                self.presenter?.isLoading(isLoading: false)
            })).disposed(by: disposeBag)
    }
}
