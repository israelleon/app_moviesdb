//
//  AuthSession.swift
//  moviesdb
//
//  Created by Israel Alejandro Dzul León on 06/03/23.
//

import Foundation

final class AuthSessionManager {
    private var store: SessionTokenProtocol
    private let gateway: AuthGatewayProtocol
    init(store: SessionTokenProtocol, gateway: AuthGatewayProtocol){
        self.store = store
        self.gateway = gateway
    }
    
    // date valid = yyyy-MM-dd HH:mm:ss UTC
    func isValidDate(stringDate: String) -> Bool {
        let now = Date.now
        let stringDateClean: String = stringDate.replacingOccurrences(of: "UTC", with: "")
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T HH:mm:ss"
        dateFormatter.timeZone = TimeZone(identifier: "UTC")
        guard let date = dateFormatter.date(from: stringDateClean) else { return false }
        return now < date
    }
    
    private func isValidToken() -> Bool {
        guard let _ = store.requestToken,
              let expire = store.requestTokenExpire,
              isValidDate(stringDate: expire) else {
            return false
        }
        return true
    }
    
    private func existSessionId() -> Bool {
        guard let _ = store.sessionId else { return false }
        return true
    }
}

extension AuthSessionManager: AuthSessionProtocol {
    func validateSession(handler: @escaping AuthSessionValidSessionHandler) {
        guard let tokenExpire = store.requestTokenExpire,
              isValidDate(stringDate: tokenExpire),
              let _ = store.requestToken,
              let _ = store.sessionId  else { return handler(false) }
        return handler(true)
    }
    
    func login(username: String, password: String, handler: @escaping AuthSessionLoginHandler) {
        refreshToken { [weak self] success in
            if !success { handler(false, nil)}
            self?.executeLogin(username: username, password: password, handler: handler)
        }
    }
    
    func logout(handler: @escaping AuthSessionLogoutHandler) {
        store.delete(key: .requestToken)
        store.delete(key: .requestToken)
        store.delete(key: .sessionId)
        store.delete(key: .userInfo)
        store.delete(key: .accountId)
        handler()
    }
    
    private func executeLogin(username: String, password: String, handler: @escaping AuthSessionLoginHandler) {
        let token = self.store.requestToken ?? ""
        gateway.fetchAuthValidateLogin(username: username, password: password, token: token) { [weak self] result in
            switch result {
            case .success(_ ):
                self?.fetchSession(token: token, handler: handler)
            case .failure(_ ): handler(false, nil)
            }
        }
    }
    
    private func fetchSession(token: String, handler: @escaping AuthSessionLoginHandler) {
        gateway.fetchAuthSession(token: token) { [weak self] result in
            switch result {
            case .success(let response):
                self?.store.sessionId = response.sessionId
                handler(true, nil)
            case .failure(_ ): handler(false, nil)
            }
        }
    }
    
    private func refreshToken(handler: @escaping (_ success: Bool) -> Void) {
        if isValidToken() {
           return handler(true)
        } else {
            gateway.fetchAuthNewToken { result in
                switch result {
                case .success(let token):
                    self.store.requestToken = token.requestToken
                    self.store.requestTokenExpire = token.expiresAt
                    handler(true)
                case .failure(let error):
                    debugPrint(error)
                    handler(false)
                }
            }
        }
    }
}
