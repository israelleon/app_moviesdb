//
//  MovieRouter.swift
//  moviesdb
//
//  Created by Israel Alejandro Dzul León on 03/03/23.
//

import UIKit

fileprivate struct Constants {
    static let sheetMessage = "movies.message".localized
    static let profileId = "_profile"
    static let logoutId = "_logout"
    static let cancelId = "_cancel"
    static let actions: [ActionSheetType] = [
        .normal(title: "movies.profile".localized, id: Self.profileId),
        .destructive(title: "movies.logout".localized, id: Self.logoutId),
        .cancel(title: "movies.cancel".localized, id: Self.cancelId)
    ]
}

final class MoviesRouter: RouterProtocol {
    weak var presenter: MoviesPresenterRouterProtocol!
    weak var viewController: UIViewController?
}

extension MoviesRouter: MoviesRouterPresenterProtocol {
    func presentMovieDetails(movieId: Int) {
        let controller = MovieDetailModule(movieId: movieId).build()
        DispatchQueue.main.async { [weak viewController] in
            viewController?.present(controller, animated: true)
        }
    }
    
    func presentLogin() {
        guard let window = viewController?.view.window else { return }
        window.rootViewController = LoginModule().build()
        window.makeKeyAndVisible()
    }
    
    func presentProfile() {
        let controller = ProfileModule().build()
        DispatchQueue.main.async { [weak viewController] in
            viewController?.present(controller, animated: true)
        }
    }
    
    func presentMenu() {
        viewController?.presentActionSheet(title: Constants.sheetMessage, actions: Constants.actions) { [weak presenter] id in
            switch id {
            case Constants.profileId:
                presenter?.menuSelectedProfile()
            case Constants.logoutId:
                presenter?.menuSelectedLogout()
            default: break
            }
        }
    }
}
