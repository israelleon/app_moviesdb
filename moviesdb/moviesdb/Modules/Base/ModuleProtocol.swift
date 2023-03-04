//
//  ModuleProtocol.swift
//  moviesdb
//
//  Created by Israel Alejandro Dzul León on 03/03/23.
//

import Foundation

protocol ModuleProtocol {
    associatedtype View where View: ViewProtocol
    associatedtype Presenter where Presenter: PresenterProtocol
    associatedtype Router where Router: RouterProtocol
    associatedtype Interactor where Interactor: InteractorProtocol
}

extension ModuleProtocol {
    func embed(view: View, presenter: Presenter, router: Router, interactor: Interactor) {
        view.presenter = (presenter as? Self.View.PresenterView)
        
        presenter.view = (view as! Self.Presenter.ViewPresenter)
        presenter.interactor = (interactor as! Self.Presenter.InteractorPresenter)
        presenter.router = (router as! Self.Presenter.RouterPresenter)
        
        interactor.presenter = (presenter as! Self.Interactor.PresenterInteractor)
        router.presenter = (presenter as! Self.Router.PresenterRouter)
    }
}
