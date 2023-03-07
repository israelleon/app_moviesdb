//
//  SessionToken.swift
//  moviesdb
//
//  Created by Israel Alejandro Dzul León on 06/03/23.
//

import Foundation

struct SessionToken: SessionTokenProtocol {
    private static let service = "session.token.service"
    private let storage: SecureStorageReader & SecureStorageWriter
    
    init(storage: SecureStorageWriter & SecureStorageReader) {
        self.storage = storage
    }
    
    var requestToken: String? {
        get {
            let key = SessionTokenKeys.requestToken.rawValue
            return storage.read(service: Self.service, account: key, type: String.self)
        }
        set {
            let key = SessionTokenKeys.requestToken.rawValue
            storage.save(newValue, service: Self.service, account: key)
        }
    }
    
    var requestTokenExpire: String? {
        get {
            let key = SessionTokenKeys.requestTokenExpire.rawValue
            return storage.read(service: Self.service, account: key, type: String.self)
        }
        set {
            let key = SessionTokenKeys.requestTokenExpire.rawValue
            storage.save(newValue, service: Self.service, account: key)
        }
    }
    
    var sessionId: String? {
        get {
            let key = SessionTokenKeys.sessionId.rawValue
            return storage.read(service: Self.service, account: key, type: String.self)
        }
        set {
            let key = SessionTokenKeys.sessionId.rawValue
            storage.save(newValue, service: Self.service, account: key)
        }
    }
    
    var accountId: String? {
        get {
            let key = SessionTokenKeys.accountId.rawValue
            return storage.read(service: Self.service, account: key, type: String.self)
        }
        set {
            let key = SessionTokenKeys.accountId.rawValue
            storage.save(newValue, service: Self.service, account: key)
        }
    }
    
    var username: String? {
        get {
            let key = SessionTokenKeys.username.rawValue
            return storage.read(service: Self.service, account: key, type: String.self)
        }
        set {
            let key = SessionTokenKeys.username.rawValue
            storage.save(newValue, service: Self.service, account: key)
        }
    }
    
    var avatar: String? {
        get {
            let key = SessionTokenKeys.avatar.rawValue
            return storage.read(service: Self.service, account: key, type: String.self)
        }
        set {
            let key = SessionTokenKeys.avatar.rawValue
            storage.save(newValue, service: Self.service, account: key)
        }
    }
    
    func delete(key: SessionTokenKeys) {
        storage.delete(service: Self.service, account: key.rawValue)
    }
}
