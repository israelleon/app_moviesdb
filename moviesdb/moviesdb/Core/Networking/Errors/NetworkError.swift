//
//  NetworkError.swift
//  moviesdb
//
//  Created by Israel Alejandro Dzul León on 05/03/23.
//

import Foundation

enum NetworkError: Error {
    case invalidStatusCode(_ code: Int)
    case invalidResponse
    case decodedError
}
