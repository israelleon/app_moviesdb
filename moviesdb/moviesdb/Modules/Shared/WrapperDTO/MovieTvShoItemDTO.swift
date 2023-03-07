//
//  MovieTvShoItemDTO.swift
//  moviesdb
//
//  Created by Israel Alejandro Dzul León on 06/03/23.
//

import Foundation
// map model require for card movie

struct MovieTvShowItemDTO: CardMovieModel {
    var id: Int
    var title: String
    var content: String
    var isFavorite: Bool
    var date: String
    var rate: String
    var image: URL?
    
    init(movieItem: MovieItemEntity) {
        self.title = movieItem.originalName
        self.content = movieItem.overview
        self.date = movieItem.firstAirDate
        self.rate = "\(movieItem.voteAverage)"
        self.isFavorite = true
        self.id = movieItem.id
        
        var urlPath: URL?
        if let path = movieItem.posterPath {
            let finalPath = GlobalConstants.imagePosterSmall + path
          urlPath = URL(string: finalPath)
        }
        self.image = urlPath
    }
}
