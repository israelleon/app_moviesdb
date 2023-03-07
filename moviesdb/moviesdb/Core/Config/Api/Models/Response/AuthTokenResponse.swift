//
//  AuthTokenNew.swift
//  moviesdb
//
//  Created by Israel Alejandro Dzul León on 05/03/23.
//

import Foundation

// MARK: - AuthTokenNew
struct AuthTokenNewResponse: Codable {
    let success: Bool
    let expiresAt, requestToken: String

    enum CodingKeys: String, CodingKey {
        case success
        case expiresAt = "expires_at"
        case requestToken = "request_token"
    }
}
