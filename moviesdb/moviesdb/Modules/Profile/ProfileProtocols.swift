//
//  ProfileProtocols.swift
//  moviesdb
//
//  Created by Israel Alejandro Dzul León on 04/03/23.
//

import Foundation
// MARK: Router -> Presenter
protocol ProfileRouterPresenterProtocol: RouterPresenterProtocol {
    
}

// MARK: Interactor -> Presenter
protocol ProfileInteractorPresenterProtocol: InteractorPresenterProtocol {
    
}

// MARK: View -> Presenter
protocol ProfileViewPresenterProtocol: ViewPresenterProtocol {
    
}

// MARK: Presenter -> Router
protocol ProfilePresenterRouterProtocol: PresenterRouterProtocol {
    
}

// MARK: Presenter -> Interactor
protocol ProfilePresenterInteractorProtocol: PresenterInteractorProtocol {
    
}

// MARK: Presenter -> View
protocol ProfilePresenterViewProtocol: PresenterViewProtocol {
    func start()
}
