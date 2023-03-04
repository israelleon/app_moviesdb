//
//  InteractorProtocol.swift
//  moviesdb
//
//  Created by Israel Alejandro Dzul León on 03/03/23.
//

import Foundation

protocol InteractorProtocol: InteractorPresenterProtocol {
    associatedtype PresenterInteractor
    var presenter: PresenterInteractor! { get set }
}
