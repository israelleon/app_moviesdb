//
//  ProfileRouter.swift
//  moviesdb
//
//  Created by Israel Alejandro Dzul León on 04/03/23.
//

import UIKit

final class ProfileRouter: RouterProtocol {
    weak var presenter: ProfilePresenterRouterProtocol!
    weak var viewController: UIViewController?
}

extension ProfileRouter: ProfileRouterPresenterProtocol {
    func presentMovieDetails(movieId: Int) {
        let controller = MovieDetailModule(movieId: movieId).build()
        DispatchQueue.main.async { [weak viewController] in
            viewController?.present(controller, animated: true)
        }
    }
}
