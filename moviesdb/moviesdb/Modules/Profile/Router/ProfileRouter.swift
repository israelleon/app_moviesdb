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
    
}
