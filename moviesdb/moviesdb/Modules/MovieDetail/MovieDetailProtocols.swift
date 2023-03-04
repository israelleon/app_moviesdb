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
    
}

// MARK: View -> Presenter
protocol MovieDetailViewPresenterProtocol: ViewPresenterProtocol {
    
}

// MARK: Presenter -> Router
protocol MovieDetailPresenterRouterProtocol: PresenterRouterProtocol {
    
}

// MARK: Presenter -> Interactor
protocol MovieDetailPresenterInteractorProtocol: PresenterInteractorProtocol {
    
}

// MARK: Presenter -> View
protocol MovieDetailPresenterViewProtocol: PresenterViewProtocol {
    func start()
}
