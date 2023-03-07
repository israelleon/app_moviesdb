//
//  LoginProtocols.swift
//  moviesdb
//
//  Created by Israel Alejandro Dzul León on 03/03/23.
//

import Foundation

// MARK: Router -> Presenter
protocol LoginRouterPresenterProtocol: RouterPresenterProtocol {
    func presentMovies()
    func showLoading()
    func hideLoading()
}

// MARK: Interactor -> Presenter
protocol LoginInteractorPresenterProtocol: InteractorPresenterProtocol {
    func performLogin(username: String, password: String)
}

// MARK: View -> Presenter
protocol LoginViewPresenterProtocol: ViewPresenterProtocol {
    func render(with entity: LoginEntity)
}

// MARK: Presenter -> Router
protocol LoginPresenterRouterProtocol: PresenterRouterProtocol {
    
}

// MARK: Presenter -> Interactor
protocol LoginPresenterInteractorProtocol: PresenterInteractorProtocol {
    func loginSuccess()
    func loginFailure(username: String, error: String)
}

// MARK: Presenter -> View
protocol LoginPresenterViewProtocol: PresenterViewProtocol {
    func performLogin(username: String, password: String)
}
