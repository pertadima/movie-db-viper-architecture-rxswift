//
//  NetworkManager.swift
//  MovieDb
//
//  Created by Irfan Pertadima on 3/10/19.
//  Copyright © 2019 Irfan Pertadima. All rights reserved.
//

import RxSwift
import Moya
import RxCocoa

protocol FetchApiServices {
    func fetchGenreMovie() -> Single<MovieGenresResponse?>
    func fetchUpcomingMovie() -> Single<UpComingMoviesResponse?>
    func fetchPlayingNowMovie() -> Single<UpComingMoviesResponse?>
    func fetchPopularMovie() -> Single<UpComingMoviesResponse?>
    func fetchDetailMovie(id: Int) ->  Single<DetailMoviesResponse?>
    func fetchMoviesPaging(page: Int, enumData: HomeEnumSection) -> Single<UpComingMoviesResponse?>
}

final class NetworkManager: FetchApiServices {
    private let provider = MoyaProvider<NetworkService>(plugins: [NetworkLoggerPlugin(verbose: true)])
    
    func request<T: Codable>(networkService: NetworkService) -> Single<T?> {
        if !Reachability.isConnectedToNetwork() {
            return Single.error(APIError(with: .internetConnection, message: "No Internet Connection"))
        }
        
        return provider
            .rx.request(networkService)
            .observeOn(ConcurrentDispatchQueueScheduler(qos: DispatchQoS(qosClass: DispatchQoS.QoSClass.background, relativePriority: 1)))
            .catchError { error -> PrimitiveSequence<SingleTrait, Response> in
                return Single.error(APIError(with: .unknown, message: error.localizedDescription))
            }.flatMap {json -> Single<T?> in
                if json.statusCode >= 200 && json.statusCode <= 300 {
                    let decoder = JSONDecoder()
                    decoder.keyDecodingStrategy = .convertFromSnakeCase
                    if let response = try? decoder.decode(T.self, from: json.data) {
                        return Single.just(response)
                    }
                } else {
                    let error = APIError(with: .internalServerError, message: "Internal Server Error")
                    return Single.error(error)
                }
                let error = APIError(with: .internalServerError, message: "Internal Server Error")
                return Single.error(error)
            }
    }
    
    func fetchGenreMovie() -> Single<MovieGenresResponse?> {
        return request(networkService: .genreMovie)
    }
    
    func fetchUpcomingMovie() -> Single<UpComingMoviesResponse?> {
        return request(networkService: .upComingMovie)
    }
    
    func fetchPlayingNowMovie() -> Single<UpComingMoviesResponse?> {
        return request(networkService: .nowPlaying)
    }
    
    func fetchPopularMovie() -> Single<UpComingMoviesResponse?>{
         return request(networkService: .popularMovie)
    }
    
    func fetchMoviesPaging(page: Int, enumData: HomeEnumSection) -> Single<UpComingMoviesResponse?> {
        return request(networkService: enumData == .nowPlaying ? .nowPlayingMoviePaging(page: page) : enumData == .trendingMovie ? .trendingMoviePaging(page: page) : .upComingMoviePaging(page : page))
    }
    
    func fetchDetailMovie(id: Int) -> Single<DetailMoviesResponse?> {
        return request(networkService: .detailMovie(id: id))
    }
}

