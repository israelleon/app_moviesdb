//
//  AuthGatewayProtocol.swift
//  moviesdb
//
//  Created by Israel Alejandro Dzul León on 05/03/23.
//

import Foundation

typealias AuthNewTokenCompletionHandler = (_ result: Result<AuthTokenNewResponse, Error>) -> Void
typealias AuthValidateLoginCompletionHandler = (_ result: Result<AuthTokenNewResponse, Error>) -> Void
typealias AuthSessionCompletionHandler = (_ result: Result<AuthSessionResult, Error>) -> Void

protocol AuthGatewayProtocol {
    func fetchAuthNewToken(handler: @escaping AuthNewTokenCompletionHandler )
    func fetchAuthValidateLogin(username: String, password: String, token: String, handler: @escaping AuthValidateLoginCompletionHandler)
    func fetchAuthSession(token: String, handler: @escaping AuthSessionCompletionHandler)
}
