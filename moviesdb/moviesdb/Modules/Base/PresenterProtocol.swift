//
//  PresenterProtocol.swift
//  moviesdb
//
//  Created by Israel Alejandro Dzul León on 03/03/23.
//

import Foundation

protocol PresenterProtocol: PresenterRouterProtocol & PresenterInteractorProtocol & PresenterViewProtocol {
    
    associatedtype RouterPresenter
    associatedtype InteractorPresenter
    associatedtype ViewPresenter
    
    var router: RouterPresenter! { get set }
    var interactor: InteractorPresenter! { get set }
    var view: ViewPresenter! {get set}
}
