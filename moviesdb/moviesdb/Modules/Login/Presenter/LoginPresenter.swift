//
//  LoginPresenter.swift
//  moviesdb
//
//  Created by Israel Alejandro Dzul León on 03/03/23.
//

import Foundation

class LoginPresenter: PresenterProtocol {
    internal weak var view: LoginViewPresenterProtocol!
    internal var interactor: LoginInteractorPresenterProtocol!
    internal var router: LoginRouterPresenterProtocol!
}

extension LoginPresenter: LoginPresenterRouterProtocol {
    
}

extension LoginPresenter: LoginPresenterViewProtocol {
    func start() {
        // TODO: complete logic here.
    }
}

extension LoginPresenter: LoginPresenterInteractorProtocol {
    
}
