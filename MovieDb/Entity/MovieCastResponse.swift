//
//  MovieCastResponse.swift
//  MovieDb
//
//  Created by Irfan Pertadima on 4/30/19.
//  Copyright © 2019 Irfan Pertadima. All rights reserved.
//

struct MovieCastResponse: Codable {
    let id: Int?
    let cast: [CastModel]?
}

struct CastModel: Codable {
    let castId: Int?
    let character, creditId: String?
    let gender, id: Int?
    let name: String?
    let order: Int?
    let profilePath: String?
}
