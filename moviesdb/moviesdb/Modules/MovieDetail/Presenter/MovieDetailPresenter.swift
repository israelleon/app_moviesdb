//
//  MovieDetailPresenter.swift
//  moviesdb
//
//  Created by Israel Alejandro Dzul León on 04/03/23.
//

import Foundation
class MovieDetailPresenter: PresenterProtocol {
    internal weak var view: MovieDetailViewPresenterProtocol!
    internal var interactor: MovieDetailInteractorPresenterProtocol!
    internal var router: MovieDetailRouterPresenterProtocol!
}

extension MovieDetailPresenter: MovieDetailPresenterRouterProtocol {
    
}

extension MovieDetailPresenter: MovieDetailPresenterViewProtocol {
    func start() {
        view.renderMovieDetail(entity: MovieDetailEntity(isLoading: true, sections: []))
        interactor.fetchMoviewDetail()
    }
}

extension MovieDetailPresenter: MovieDetailPresenterInteractorProtocol {
    func successFetchMovieDetail(entity: MovieDetailEntity) {
        view.renderMovieDetail(entity: entity)
    }
    
    func failureFetchMovieDetail() {
        view.renderMovieDetail(entity: MovieDetailEntity(isFailure: true, isLoading: false ,sections: []))
    }
}
