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
}

extension MoviesPresenter: MoviesPresenterRouterProtocol {
    
}

extension MoviesPresenter: MoviesPresenterViewProtocol {
    func start() {
        // TODO: complete logic here.
    }
}

extension MoviesPresenter: MoviesPresenterInteractorProtocol {
    
}
