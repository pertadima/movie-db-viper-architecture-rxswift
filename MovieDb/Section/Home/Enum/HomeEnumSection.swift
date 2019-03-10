//
//  HomeEnumSection.swift
//  MovieDb
//
//  Created by Irfan Pertadima on 3/10/19.
//  Copyright © 2019 Irfan Pertadima. All rights reserved.
//

enum HomeEnumSection {
    case upComingMovie, trendingMovie, genreMovie, nowPlaying, popularMovie
    
    var title : String {
        switch self {
        case .upComingMovie:
            return "Upcoming Movies"
        case .trendingMovie:
            return "Trending Movies"
        case .genreMovie:
            return "Genres"
        case .nowPlaying:
            return "Now Playing"
        case .popularMovie:
            return "Popular Movies"
        }
    }
}
