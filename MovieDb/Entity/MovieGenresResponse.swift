//
//  MovieGenresResponse.swift
//  MovieDb
//
//  Created by Irfan Pertadima on 3/10/19.
//  Copyright © 2019 Irfan Pertadima. All rights reserved.
//

struct MovieGenresResponse : Codable {
    var genres: [MovieGenresModel]?
}

struct MovieGenresModel : Codable {
    var id: Int?
    var name: String?
}
