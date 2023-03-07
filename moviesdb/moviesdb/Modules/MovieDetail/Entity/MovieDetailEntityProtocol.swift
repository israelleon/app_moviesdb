//
//  MovieDetailEntityProtocol.swift
//  moviesdb
//
//  Created by Israel Alejandro Dzul León on 05/03/23.
//

import UIKit

// MARK: - Enums -

enum MovieDetailCellType {
    case banner
    case content
    case cast
    case network
}

enum MovieDetailsSectionType {
    case none
    case cast(_ title: String)
}

// MARK: - Protocols -

protocol MovieDetailCellProtocol {
    var type: MovieDetailCellType { get }
}

protocol MoviesDetailsCastProtocol: MovieDetailCellProtocol{
    var title: String {get}
    var url: String {get}
}

protocol MovieDetailNetworkProtocol: MovieDetailCellProtocol {
    var items: [MovieDetailItemNetwork] {get}
}

protocol MovieDetailsContentProtocol: MovieDetailCellProtocol {
    var body: String {get}
    var color: UIColor {get }
}

protocol MovieDetailsBannerProtocol: MovieDetailCellProtocol {
    var posterURL: URL? {get}
    var title: String {get}
    var date: String {get}
    var rate: String {get}
    var isFavorite: Bool {get}
}
