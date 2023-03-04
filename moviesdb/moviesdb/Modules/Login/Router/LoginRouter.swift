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
    
}
