//
//  LoginModule.swift
//  moviesdb
//
//  Created by Israel Alejandro Dzul León on 03/03/23.
//

import UIKit

final class LoginModule: ModuleProtocol, ModuleBuilderProtocol {
    
    typealias View = LoginView
    typealias Presenter = LoginPresenter
    typealias Router = LoginRouter
    typealias Interactor = LoginInteractor
    
    func build() -> UIViewController {
        let view = View()
        let interactor = Interactor()
        let presenter = Presenter()
        let router = Router()
        self.embed(view: view, presenter: presenter, router: router, interactor: interactor)
        router.viewController = view
        return view
    }
}
