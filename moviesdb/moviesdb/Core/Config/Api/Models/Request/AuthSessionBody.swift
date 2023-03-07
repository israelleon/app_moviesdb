//
//  AuthSessionBody.swift
//  moviesdb
//
//  Created by Israel Alejandro Dzul León on 06/03/23.
//

import Foundation

struct AuthSessionBody: Codable {
    var requestToken: String
    
    enum CodingKeys: String, CodingKey {
        case requestToken = "request_token"
    }
}
