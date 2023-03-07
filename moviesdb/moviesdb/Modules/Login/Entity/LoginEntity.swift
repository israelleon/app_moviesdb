//
//  LoginEntity.swift
//  moviesdb
//
//  Created by Israel Alejandro Dzul León on 03/03/23.
//

import Foundation

struct LoginEntity: EntityProtocol {
    var username: String?
    var error: String?
    var loading: Bool?
    static let passwordLength: Int = 2
    static let usernameLength: Int = 2
}
