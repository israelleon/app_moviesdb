//
//  LoginRouter.swift
//  moviesdb
//
//  Created by Israel Alejandro Dzul León on 03/03/23.
//

import UIKit

final class LoginRouter: RouterProtocol {
    weak var presenter: LoginPresenterRouterProtocol!
    weak var viewController: UIViewController?
}

extension LoginRouter: LoginRouterPresenterProtocol {
    func showLoading() {
        viewController?.presentLoader()
    }
    
    func hideLoading() {
        viewController?.dismiss(animated: true)
    }
    
    func presentMovies() {
        guard let window = viewController?.view.window else { return }
        window.rootViewController = MoviesModule().build()
        window.makeKeyAndVisible()
    }
}
