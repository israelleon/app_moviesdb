//
//  ViewProtocol.swift
//  moviesdb
//
//  Created by Israel Alejandro Dzul León on 03/03/23.
//

import Foundation

protocol ViewProtocol: ViewPresenterProtocol {
    associatedtype PresenterView
    var presenter: PresenterView! { get set }
}
