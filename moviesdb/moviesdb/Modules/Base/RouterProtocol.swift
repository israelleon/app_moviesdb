//
//  RouterProtocol.swift
//  moviesdb
//
//  Created by Israel Alejandro Dzul León on 03/03/23.
//

import Foundation

protocol RouterProtocol: RouterPresenterProtocol {
    associatedtype PresenterRouter
    var presenter: PresenterRouter! { get set}
}
