//
//  MovieDetailInteractor.swift
//  moviesdb
//
//  Created by Israel Alejandro Dzul León on 04/03/23.
//

import Foundation
class MovieDetailInteractor: InteractorProtocol  {
   weak var presenter: MovieDetailPresenterInteractorProtocol!
    init() {
        
    }
}

extension MovieDetailInteractor:  MovieDetailInteractorPresenterProtocol{
    
    func demo() {
    }
}
