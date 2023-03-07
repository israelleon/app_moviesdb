//
//  MovieDetailProtocols.swift
//  moviesdb
//
//  Created by Israel Alejandro Dzul León on 04/03/23.
//

import Foundation
// MARK: Router -> Presenter
protocol MovieDetailRouterPresenterProtocol: RouterPresenterProtocol {
    
}

// MARK: Interactor -> Presenter
protocol MovieDetailInteractorPresenterProtocol: InteractorPresenterProtocol {
    func fetchMoviewDetail()
    func markAsFavorite(isFavorite: Bool)
}

// MARK: View -> Presenter
protocol MovieDetailViewPresenterProtocol: ViewPresenterProtocol {
    func renderMovieDetail(entity: MovieDetailEntity)
}

// MARK: Presenter -> Router
protocol MovieDetailPresenterRouterProtocol: PresenterRouterProtocol {
    
}

// MARK: Presenter -> Interactor
protocol MovieDetailPresenterInteractorProtocol: PresenterInteractorProtocol {
    func successFetchMovieDetail(entity: MovieDetailEntity)
    func failureFetchMovieDetail()
}

// MARK: Presenter -> View
protocol MovieDetailPresenterViewProtocol: PresenterViewProtocol {
    func start()
}
