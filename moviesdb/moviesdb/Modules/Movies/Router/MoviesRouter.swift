//
//  MovieRouter.swift
//  moviesdb
//
//  Created by Israel Alejandro Dzul León on 03/03/23.
//

import UIKit

final class MoviesRouter: RouterProtocol {
    weak var presenter: MoviesPresenterRouterProtocol!
    weak var viewController: UIViewController?
}

extension MoviesRouter: MoviesRouterPresenterProtocol {
    
}
