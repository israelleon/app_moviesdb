//
//  AuthTokenRequest.swift
//  moviesdb
//
//  Created by Israel Alejandro Dzul León on 05/03/23.
//

import Foundation


import Foundation

// MARK: - AuthTokenValidateWithLoginRequest
struct AuthTokenValidateWithLogin: Codable {
    let username, password, requestToken: String

    enum CodingKeys: String, CodingKey {
        case username, password
        case requestToken = "request_token"
    }
}
