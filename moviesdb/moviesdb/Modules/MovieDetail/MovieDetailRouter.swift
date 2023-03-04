//
//  MovieDetailRouter.swift
//  moviesdb
//
//  Created by Israel Alejandro Dzul León on 04/03/23.
//

import UIKit

final class MovieDetailRouter: RouterProtocol {
    weak var presenter: MovieDetailPresenterRouterProtocol!
    weak var viewController: UIViewController?
}

extension MovieDetailRouter: MovieDetailRouterPresenterProtocol {
    
}
