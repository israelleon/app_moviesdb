//
//  MovieInteractor.swift
//  moviesdb
//
//  Created by Israel Alejandro Dzul León on 03/03/23.
//

import Foundation

class MoviesInteractor: InteractorProtocol  {
   weak var presenter: MoviesPresenterInteractorProtocol!
    init() {
        
    }
}

extension MoviesInteractor:  MoviesInteractorPresenterProtocol{
    
    func demo() {
    }
}
