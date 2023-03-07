//
//  NetworkManagerProtocol.swift
//  moviesdb
//
//  Created by Israel Alejandro Dzul León on 05/03/23.
//

import Foundation

typealias NetworkReponseHandler<T: Decodable> = (_ result: Result<T, Error>) -> Void

protocol NetworkManagerProtocol {
    func request<T: Decodable>(_ request: ApiRequestProtocol, handler: @escaping NetworkReponseHandler<T>)
}
