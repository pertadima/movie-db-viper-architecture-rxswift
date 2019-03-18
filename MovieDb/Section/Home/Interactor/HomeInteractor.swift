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
    
    func fetchingHome() {
        presenter?.isLoading(isLoading: true)
        Observable.zip(service.fetchUpcomingMovie().asObservable(),
                       service.fetchPlayingNowMovie().asObservable(),
                       service.fetchPopularMovie().asObservable(),
                       service.fetchGenreMovie().asObservable())
            .observeOn(MainScheduler.instance)
            .subscribe(onNext: ({ (response) in
                let (upcomingResponse, playingNowResponse, popularResponse, genreResponse) = response
                self.upcomingMovieResponse(response: upcomingResponse)
                self.playingNowResponse(response: playingNowResponse)
                self.popularMovieResponse(response: popularResponse)
                self.genreMovieResponse(response: genreResponse)
                self.presenter?.isLoading(isLoading: false)
            }), onError: ({(error) in
                guard let errorValue = error as? APIError else { return }
                self.presenter?.fetchFailed(error: errorValue.message)
                self.presenter?.isLoading(isLoading: false)
            })).disposed(by: disposeBag)
    }
    
    private func upcomingMovieResponse(response: UpComingMoviesResponse?) {
        self.presenter?.fetchedUpcomingMoviesSuccess(data: response?.results)
    }
    
    private func playingNowResponse(response: UpComingMoviesResponse?) {
        self.presenter?.showNowPlayingMovie(data: response?.results)
    }
    
    private func popularMovieResponse(response: UpComingMoviesResponse?) {
        self.presenter?.showPopularMoviesData(data: response?.results)
    }
    
    private func genreMovieResponse(response: MovieGenresResponse?) {
         self.presenter?.showGenreMovie(data: response?.genres)
    }
}
