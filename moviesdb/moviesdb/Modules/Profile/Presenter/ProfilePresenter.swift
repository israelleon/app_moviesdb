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
    func presentMovieDetail(id: Int) {
        
        router.presentMovieDetails(movieId: id)
    }
    
    func start() {
        interactor.fetchUserInfo()
        interactor.fetchFavoriteTvShow()
    }
}

extension ProfilePresenter: ProfilePresenterInteractorProtocol {
    func fetchTvShowFavorites(entity: ProfileEntity) {
        view.renderBy(entity: entity)
    }
    
    func fetchUserInfo(entity: ProfileEntity) {
        view.renderBy(entity: entity)
    }
}
