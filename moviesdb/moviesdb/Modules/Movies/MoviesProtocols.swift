//
//  MovieProtocols.swift
//  moviesdb
//
//  Created by Israel Alejandro Dzul León on 03/03/23.
//

import Foundation

// MARK: Router -> Presenter
protocol MoviesRouterPresenterProtocol: RouterPresenterProtocol {
    
}

// MARK: Interactor -> Presenter
protocol MoviesInteractorPresenterProtocol: InteractorPresenterProtocol {
    
}

// MARK: View -> Presenter
protocol MoviesViewPresenterProtocol: ViewPresenterProtocol {
    
}

// MARK: Presenter -> Router
protocol MoviesPresenterRouterProtocol: PresenterRouterProtocol {
    
}

// MARK: Presenter -> Interactor
protocol MoviesPresenterInteractorProtocol: PresenterInteractorProtocol {
    
}

// MARK: Presenter -> View
protocol MoviesPresenterViewProtocol: PresenterViewProtocol {
    func start()
}
