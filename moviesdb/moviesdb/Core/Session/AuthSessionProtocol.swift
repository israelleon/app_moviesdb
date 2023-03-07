//
//  AuthSessionProtocol.swift
//  moviesdb
//
//  Created by Israel Alejandro Dzul León on 06/03/23.
//

import Foundation

typealias AuthSessionValidSessionHandler = (_ status: Bool) -> Void
typealias AuthSessionLoginHandler = (_ status: Bool, _ error: String?) -> Void
typealias AuthSessionLogoutHandler = () -> Void

protocol AuthSessionProtocol {
    func validateSession(handler: @escaping AuthSessionValidSessionHandler)
    func login(username: String, password: String, handler: @escaping AuthSessionLoginHandler)
    func logout(handler: @escaping AuthSessionLogoutHandler)
}
