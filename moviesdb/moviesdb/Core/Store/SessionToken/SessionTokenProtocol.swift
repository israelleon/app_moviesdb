//
//  SessionTokenProtocol.swift
//  moviesdb
//
//  Created by Israel Alejandro Dzul León on 06/03/23.
//

import Foundation

enum SessionTokenKeys: String {
    case requestToken = "request_token"
    case requestTokenExpire = "request_token_expire"
    case sessionId = "session_id"
    case userInfo = "user_info"
    case accountId = "account_id"
    case username = "username"
    case avatar = "avatar"
}

protocol SessionTokenProtocol {
    var requestToken: String? {get set}
    var requestTokenExpire: String? { get set}
    var sessionId: String? { get set}
    var accountId: String? { get set }
    var username: String? { get set}
    var avatar: String? { get set }
    func delete(key: SessionTokenKeys)
}
