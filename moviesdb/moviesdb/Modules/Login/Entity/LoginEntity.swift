//
//  LoginEntity.swift
//  moviesdb
//
//  Created by Israel Alejandro Dzul León on 03/03/23.
//

import Foundation

struct LoginEntity: EntityProtocol {
    var error: String?
    var loading: Bool?
    var isValid: Bool?
    var finishi: Bool
}
