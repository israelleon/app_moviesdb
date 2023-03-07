//
//  LoginPresenter.swift
//  moviesdb
//
//  Created by Israel Alejandro Dzul León on 03/03/23.
//

import Foundation

fileprivate struct Constants {
    static let errorPassword = "login.error.password".localized
    static let errorUsername = "login.error.username".localized
}

class LoginPresenter: PresenterProtocol {
    internal weak var view: LoginViewPresenterProtocol!
    internal var interactor: LoginInteractorPresenterProtocol!
    internal var router: LoginRouterPresenterProtocol!
}

extension LoginPresenter: LoginPresenterRouterProtocol {
    // TODO: loading view.
}

extension LoginPresenter: LoginPresenterViewProtocol {
    func start() {
        view.render(with: LoginEntity())
    }
    
    func performLogin(username: String, password: String) {
        if username.isEmpty || username.count < LoginEntity.usernameLength {
            loginFailure(username: username, error: Constants.errorUsername)
           return
        }
        if password.isEmpty || username.count < LoginEntity.passwordLength {
            loginFailure(username: username, error: Constants.errorPassword)
            return
        }
        router.showLoading()
        interactor.performLogin(username: username, password: password)
    }
}

extension LoginPresenter: LoginPresenterInteractorProtocol {
    func loginSuccess() {
        router.hideLoading()
        router.presentMovies()
        view.render(with: LoginEntity(loading: false))
    }
    
    func loginFailure(username: String, error: String) {
        router.hideLoading()
        view.render(with: LoginEntity(username: username, error: error, loading: false))
    }
}
