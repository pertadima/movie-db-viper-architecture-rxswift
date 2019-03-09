//
//  NetworkService.swift
//  MovieDb
//
//  Created by Irfan Pertadima on 3/10/19.
//  Copyright © 2019 Irfan Pertadima. All rights reserved.
//

import Moya

enum NetworkService {
    case genreMovie
    case trendingMovie
    case upComingMovie
    case nowPlaying
}

extension NetworkService : TargetType {
    public var baseURL: URL {
        return URL(string: "https://api.themoviedb.org/3/")!
    }
    
    public var path: String {
        switch self {
        case .genreMovie:
            return ""
        case .trendingMovie:
            return ""
        case .upComingMovie:
            return ""
        case .nowPlaying:
            return ""
        }
    }
    
    public var method: Method {
        return .get
    }
    
    public var sampleData: Data {
        return Data()
    }
    
    public var task: Task {
        switch self {
        case .genreMovie:
            return .requestParameters(parameters: ["api_key": "c8ff8c510e74a75a3643870242745d71"], encoding: URLEncoding.default)
        default:
            return .requestPlain
        }
    }
    
    public var headers: [String : String]? {
        let parameters = ["X-Mobile-App": "ios", "Content-Type": "application/json", "Accept": "application/json"]
        return parameters
    }
    
    
}
