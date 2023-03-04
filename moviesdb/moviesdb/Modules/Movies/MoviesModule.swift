//
//  MovieModule.swift
//  moviesdb
//
//  Created by Israel Alejandro Dzul León on 03/03/23.
//

import UIKit

final class MoviesModule: ModuleProtocol, ModuleBuilderProtocol {
    
    typealias View = MoviesView
    typealias Presenter = MoviesPresenter
    typealias Router = MoviesRouter
    typealias Interactor = MoviesInteractor
    
    func build() -> UIViewController {
        let view = View()
        let interactor = Interactor()
        let presenter = Presenter()
        let router = Router()
        self.embed(view: view, presenter: presenter, router: router, interactor: interactor)
        router.viewController = view
        return UINavigationController(rootViewController: view)
    }
}
