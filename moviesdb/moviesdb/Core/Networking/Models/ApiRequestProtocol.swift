//
//  RequesProtocol.swift
//  moviesdb
//
//  Created by Israel Alejandro Dzul León on 05/03/23.
//

import Foundation

protocol ApiRequestProtocol {
    var pathUrl: URL { get }
    var method: HttpMethod { get }
    var body: Data? { get }
    var needResponse: Bool { get }
}
