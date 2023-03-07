//
//  MoviePresenter.swift
//  moviesdb
//
//  Created by Israel Alejandro Dzul León on 03/03/23.
//

import Foundation

class MoviesPresenter: PresenterProtocol {
    internal weak var view: MoviesViewPresenterProtocol!
    internal var interactor: MoviesInteractorPresenterProtocol!
    internal var router: MoviesRouterPresenterProtocol!
    
    private var movieEntity = MoviesEntity()
  
    private func loadCategory(category: MovieCategory) {
        // TODO: validate max page limit.
        if !movieEntity.isLoading(category: category) {
            movieEntity.loading(status: true, category: category)
            let currentPage = movieEntity.currentPage(category: category) + 1
            interactor.fetchTvShows(type: category, page: currentPage)
        }
    }
}

extension MoviesPresenter: MoviesPresenterRouterProtocol {
    func menuSelectedProfile() {
        router.presentProfile()
    }
    
    func menuSelectedLogout() {
       // interactor.logout()
        router.presentLogin()
    }
}

extension MoviesPresenter: MoviesPresenterViewProtocol {
    func presentDetails(category: MovieCategory, at indexPath: IndexPath) {
        let dataSource = movieEntity.item(category: category)?.tvShows ?? []
        guard indexPath.row < dataSource.count  else { return }
        let movieId = dataSource[indexPath.row].id
        router.presentMovieDetails(movieId: movieId)
    }
    
    func presentMenu() {
        router.presentMenu()
    }
    
    var categories: [MovieCategory] {
        return MovieCategory.allCases
    }
    
    func getDatasource(from category: MovieCategory) -> MovieCategoryEntity? {
        return movieEntity.item(category: category)
    }
    
    func start() {
        loadCategory(category: .popular)
        loadCategory(category: .onTV)
        loadCategory(category: .airingToday)
        loadCategory(category: .topRated)
    }
}

extension MoviesPresenter: MoviesPresenterInteractorProtocol {
    func responseTvShows(type: MovieCategory, elements: [MovieItemEntity], totalPages: Int) {
        // TODO: valid total pages limit.
        let currentPage = movieEntity.currentPage(category: type) + 1
        movieEntity.append(category: type, items: elements, currentPage: currentPage)
        movieEntity.loading(status: false, category: type)
        view.render(category: type)
    }
}
