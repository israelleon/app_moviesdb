//
//  LoginProtocols.swift
//  moviesdb
//
//  Created by Israel Alejandro Dzul León on 03/03/23.
//

import Foundation

// MARK: Router -> Presenter
protocol LoginRouterPresenterProtocol: RouterPresenterProtocol {
    
}

// MARK: Interactor -> Presenter
protocol LoginInteractorPresenterProtocol: InteractorPresenterProtocol {
    
}

// MARK: View -> Presenter
protocol LoginViewPresenterProtocol: ViewPresenterProtocol {
    
}

// MARK: Presenter -> Router
protocol LoginPresenterRouterProtocol: PresenterRouterProtocol {
    
}

// MARK: Presenter -> Interactor
protocol LoginPresenterInteractorProtocol: PresenterInteractorProtocol {
    
}

// MARK: Presenter -> View
protocol LoginPresenterViewProtocol: PresenterViewProtocol {
    func start()
}
