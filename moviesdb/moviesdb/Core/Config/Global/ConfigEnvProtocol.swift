//
//  ConfigEnvProtocol.swift
//  moviesdb
//
//  Created by Israel Alejandro Dzul León on 05/03/23.
//

import Foundation

protocol ConfigEndpointProtocol {
    var uri: String {get}
    var method: String { get }
}

protocol ConfigEnvProtocol {
    var env: String? { get }
    func getEnpoint(endpoint: String, forKey key: String) -> ConfigEndpointProtocol?
}
