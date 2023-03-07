//
//  MoviesEntity.swift
//  moviesdb
//
//  Created by Israel Alejandro Dzul León on 03/03/23.
//

import Foundation

enum MovieCategory: Int, CaseIterable {
    case popular = 0
    case topRated
    case onTV
    case airingToday
    
    var title: String {
        switch self {
        case.airingToday: return "movies.category.four".localized
        case .topRated: return "movies.category.two".localized
        case .popular: return "movies.category.one".localized
        case .onTV: return "movies.category.three".localized
        }
    }
}

struct MoviesEntity: EntityProtocol {
    private var categories: [MovieCategory: MovieCategoryEntity] = [
        .popular: MovieCategoryEntity(),
        .onTV: MovieCategoryEntity(),
        .topRated: MovieCategoryEntity(),
        .airingToday: MovieCategoryEntity()
    ]
    
    func isLoading(category: MovieCategory) -> Bool {
        return categories[category]?.isLoading ?? false
    }
    
    func currentPage(category: MovieCategory) -> Int {
        return categories[category]?.page ?? 0
    }
    
    func item(category: MovieCategory) -> MovieCategoryEntity? {
        return categories[category]
    }
    
    mutating func loading(status: Bool, category: MovieCategory) {
        categories[category]?.isLoading = false
    }
    
    mutating func append(category: MovieCategory, items: [MovieItemEntity], currentPage: Int) {
        categories[category]?.tvShows.append(contentsOf: items)
        categories[category]?.page = currentPage
    }
}

