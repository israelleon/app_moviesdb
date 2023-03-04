//
//  ProfilePresenter.swift
//  moviesdb
//
//  Created by Israel Alejandro Dzul León on 04/03/23.
//

import Foundation
class ProfilePresenter: PresenterProtocol {
    internal weak var view: ProfileViewPresenterProtocol!
    internal var interactor: ProfileInteractorPresenterProtocol!
    internal var router: ProfileRouterPresenterProtocol!
}

extension ProfilePresenter: ProfilePresenterRouterProtocol {
    
}

extension ProfilePresenter: ProfilePresenterViewProtocol {
    func start() {
        // TODO: complete logic here.
    }
}

extension ProfilePresenter: ProfilePresenterInteractorProtocol {
    
}
