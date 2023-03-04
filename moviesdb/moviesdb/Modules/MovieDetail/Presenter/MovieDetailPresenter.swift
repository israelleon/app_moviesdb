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
        // TODO: complete logic here.
    }
}

extension MovieDetailPresenter: MovieDetailPresenterInteractorProtocol {
    
}
