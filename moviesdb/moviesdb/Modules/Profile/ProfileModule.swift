//
//  ProfileModule.swift
//  moviesdb
//
//  Created by Israel Alejandro Dzul León on 04/03/23.
//

import UIKit

final class ProfileModule: ModuleProtocol, ModuleBuilderProtocol {
    
    typealias View = ProfileView
    typealias Presenter = ProfilePresenter
    typealias Router = ProfileRouter
    typealias Interactor = ProfileInteractor
    
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
