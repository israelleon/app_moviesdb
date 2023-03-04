//
//  ProfileInteractor.swift
//  moviesdb
//
//  Created by Israel Alejandro Dzul León on 04/03/23.
//

import Foundation
class ProfileInteractor: InteractorProtocol  {
   weak var presenter: ProfilePresenterInteractorProtocol!
    init() {
        
    }
}

extension ProfileInteractor:  ProfileInteractorPresenterProtocol{
}
