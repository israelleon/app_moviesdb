//
//  ProfileProtocols.swift
//  moviesdb
//
//  Created by Israel Alejandro Dzul León on 04/03/23.
//

import Foundation
// MARK: Router -> Presenter
protocol ProfileRouterPresenterProtocol: RouterPresenterProtocol {
    func presentMovieDetails(movieId: Int)
}

// MARK: Interactor -> Presenter
protocol ProfileInteractorPresenterProtocol: InteractorPresenterProtocol {
    func fetchUserInfo()
    func fetchFavoriteTvShow()
}

// MARK: View -> Presenter
protocol ProfileViewPresenterProtocol: ViewPresenterProtocol {
    func renderBy(entity: ProfileEntity)
}

// MARK: Presenter -> Router
protocol ProfilePresenterRouterProtocol: PresenterRouterProtocol {
   // 
}

// MARK: Presenter -> Interactor
protocol ProfilePresenterInteractorProtocol: PresenterInteractorProtocol {
   // TODO: complete here data.
    func fetchTvShowFavorites(entity: ProfileEntity)
    func fetchUserInfo(entity: ProfileEntity)
}

// MARK: Presenter -> View
protocol ProfilePresenterViewProtocol: PresenterViewProtocol {
    func start()
    func presentMovieDetail(id: Int)
}
