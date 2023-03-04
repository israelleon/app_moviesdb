//
//  LoginInteractor.swift
//  moviesdb
//
//  Created by Israel Alejandro Dzul León on 03/03/23.
//

import Foundation

class LoginInteractor: InteractorProtocol  {
   weak var presenter: LoginPresenterInteractorProtocol!
    init() {
        
    }
}

extension LoginInteractor:  LoginInteractorPresenterProtocol{
    
    func demo() {
    }
}
