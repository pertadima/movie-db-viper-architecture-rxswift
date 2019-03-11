//
//  UpcomingMoviesResponse.swift
//  MovieDb
//
//  Created by Irfan Pertadima on 3/10/19.
//  Copyright © 2019 Irfan Pertadima. All rights reserved.
//

struct UpComingMoviesResponse : Codable{
    var results: [UpcomingMoviesModel]?
    var pages: Int?
    var totalResults: Int?
    var totalPages: Int?
}

struct UpcomingMoviesModel : Codable{
    var voteCount: Int?
    var id: Int?
    var video: Bool?
    var voteAverage: Float?
    var title: String?
    var popularity: Double?
    var posterPath: String?
    var originalLanguage: String?
    var originalTitle: String?
    var genreIds: [Int]?
    var backdropPath: String?
    var adule: Bool?
    var overview: String?
    var releaseDate: String?
}
