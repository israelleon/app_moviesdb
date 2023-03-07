//
//  MovieProtocols.swift
//  moviesdb
//
//  Created by Israel Alejandro Dzul León on 03/03/23.
//

import Foundation


// MARK: Router -> Presenter
protocol MoviesRouterPresenterProtocol: RouterPresenterProtocol {
    func presentMenu()
    func presentLogin()
    func presentMovieDetails(movieId: Int)
    func presentProfile()
}

// MARK: Interactor -> Presenter
protocol MoviesInteractorPresenterProtocol: InteractorPresenterProtocol {
    func fetchTvShows(type: MovieCategory, page: Int)
}

// MARK: View -> Presenter
protocol MoviesViewPresenterProtocol: ViewPresenterProtocol {
    func render(category: MovieCategory)
}

// MARK: Presenter -> Router
protocol MoviesPresenterRouterProtocol: PresenterRouterProtocol {
    func menuSelectedProfile()
    func menuSelectedLogout()
}

// MARK: Presenter -> Interactor
protocol MoviesPresenterInteractorProtocol: PresenterInteractorProtocol {
    func responseTvShows(type: MovieCategory, elements: [MovieItemEntity], totalPages: Int)
}

// MARK: Presenter -> View
protocol MoviesPresenterViewProtocol: PresenterViewProtocol {
    var categories: [MovieCategory] { get }
    func start()
    func presentMenu()
    func getDatasource(from category: MovieCategory) -> MovieCategoryEntity?
    func presentDetails(category: MovieCategory, at indexPath: IndexPath)
}
