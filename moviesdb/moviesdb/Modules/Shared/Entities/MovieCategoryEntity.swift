//
//  MovieCategoryEntity.swift
//  moviesdb
//
//  Created by Israel Alejandro Dzul León on 06/03/23.
//

import Foundation

struct MovieCategoryEntity {
    var isLoading: Bool = false
    var page: Int = 0
    var totalPages: Int = 0
    var tvShows: [MovieItemEntity] = []
}

struct MovieItemEntity {
    let backdropPath: String?
    let firstAirDate: String
    let genreIDS: [Int]
    let id: Int
    let name: String
    let originCountry: [String]
    let originalLanguage, originalName, overview: String
    let popularity: Double
    let posterPath: String?
    let voteAverage: Double
    let voteCount: Int
    
    init(with response: TVShow) {
        self.backdropPath = response.backdropPath
        self.firstAirDate = response.firstAirDate
        self.genreIDS = response.genreIDS
        self.id = response.id
        self.name = response.name
        self.originCountry = response.originCountry
        self.originalLanguage = response.originalLanguage
        self.originalName = response.originalName
        self.overview = response.overview
        self.popularity = response.popularity
        self.posterPath = response.posterPath
        self.voteAverage = response.voteAverage
        self.voteCount = response.voteCount
    }
}
