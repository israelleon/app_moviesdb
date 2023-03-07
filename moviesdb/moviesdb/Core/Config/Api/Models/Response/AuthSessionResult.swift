//
//  AuthSessionResult.swift
//  moviesdb
//
//  Created by Israel Alejandro Dzul León on 06/03/23.
//

import Foundation

struct AuthSessionResult: Codable {
    var success: Bool
    var sessionId: String
    
    enum CodingKeys: String, CodingKey {
        case success
        case sessionId = "session_id"
    }
}
