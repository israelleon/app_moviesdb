//
//  MovieDetailEntity.swift
//  moviesdb
//
//  Created by Israel Alejandro Dzul León on 04/03/23.
//

import UIKit

// MARK: - Entity -

struct MovieDetailEntity: EntityProtocol {
    var isFailure: Bool
    var isLoading: Bool
    var sections: [MoviewDetailSection] = []
    
    init(isFailure: Bool = false, isLoading: Bool = false, sections: [MoviewDetailSection]) {
        self.isFailure = isFailure
        self.isLoading = isLoading
        self.sections = sections
    }
    
    init(response: TvShowDetails) {
        isFailure = false
        isLoading = false
        
        var finalUrl: URL?
        if let backdropPath = response.backdropPath {
            let path = GlobalConstants.imagePosterBase + backdropPath
            finalUrl = URL(string: path)
        }
        
        let bannerSection = MovieDetailBanner(
            posterURL: finalUrl,
            title: response.originalName,
            date: response.firstAirDate,
            rate: "\(response.voteAverage)",
            isFavorite: true)
        
        
        let generes = response.genres.reduce("", { $1.name + ","})
        
        let networks = (response.networks ?? []).map {
            var finalUrl: URL?
            if let path = $0.logoPath {
                finalUrl = URL(string: GlobalConstants.imagePosterSmall + path)
            }
            return MovieDetailItemNetwork(id:$0.id, title: $0.name, image: finalUrl)
        }
        
        self.sections = [
            MoviewDetailSection(section: .none, items: [bannerSection]),
            MoviewDetailSection(section: .none, items: [
                MovieDetailContent(color: .main, body: "movieDetail.overview".localized),
                MovieDetailContent(color: .white, body: "\(response.overview)"),
                MovieDetailContent(color: .main, body: "movieDetail.airDate".localized + "\n" + "\(response.firstAirDate ) - \(response.lastAirDate )"),
                MovieDetailContent(color: .white, body: "\("movieDetail.genres".localized) \n\(generes)")
            ])
        ]
        
        if networks.count > 0 {
            self.sections.append(MoviewDetailSection(section: .none, items: [MovieDetailNetwork(items: networks)]))
        }
    }
}

struct MoviewDetailSection {
    var section: MovieDetailsSectionType
    var items: [MovieDetailCellProtocol] = []
}

struct MovieDetailNetwork: MovieDetailNetworkProtocol {
    var type: MovieDetailCellType = .network
    var items: [MovieDetailItemNetwork]
    
}

struct MovieDetailItemNetwork: CardMovieModel {
   var id: Int
    var title: String
    var content: String = ""
    var isFavorite: Bool = false
    var date: String = ""
    var rate: String = ""
    var image: URL?
    init(id: Int, title: String, content: String = "", isFavorite: Bool = false, date: String = "", rate: String = "", image: URL?) {
        self.id = id
        self.title = title
        self.content = content
        self.isFavorite = isFavorite
        self.date = date
        self.rate = rate
        self.image = image
    }
}

fileprivate struct MovieDetailContent: MovieDetailsContentProtocol {
    var type: MovieDetailCellType = .content
    var color: UIColor
    var body: String
}

fileprivate struct MovieDetailBanner: MovieDetailsBannerProtocol {
    var type: MovieDetailCellType = .banner
    var posterURL: URL?
    var title: String
    var date: String
    var rate: String
    var isFavorite: Bool
}
