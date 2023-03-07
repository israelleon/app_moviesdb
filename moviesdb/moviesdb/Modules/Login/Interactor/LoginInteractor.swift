//
//  LoginInteractor.swift
//  moviesdb
//
//  Created by Israel Alejandro Dzul León on 03/03/23.
//

import Foundation

fileprivate struct Constants {
    static let invalidCredentials = "login.error.invalid_credentials".localized
}

class LoginInteractor: InteractorProtocol  {
    weak var presenter: LoginPresenterInteractorProtocol!
    private var session: AuthSessionProtocol
    private var gateway: AccountGatewayProtocol?
    private var sessionToken: SessionTokenProtocol?
    init(session: AuthSessionProtocol, gateway: AccountGatewayProtocol, sessionToken: SessionTokenProtocol) {
        self.session = session
        self.gateway = gateway
        self.sessionToken = sessionToken
    }
}

extension LoginInteractor:  LoginInteractorPresenterProtocol{
    func performLogin(username: String, password: String) {
        self.session.login(username: username, password: password) { [weak presenter, fetchUserInfo] status, error in
            guard status else  {
                presenter?.loginFailure(username: username, error: error ?? Constants.invalidCredentials)
                return
            }
            fetchUserInfo(username)
        }
    }
    
    private func fetchUserInfo(username: String) {
        let sessionId = sessionToken?.sessionId ?? ""
        gateway?.fetchAccountDetails(sessionId: sessionId) { [weak presenter] result in
            switch result {
            case .success(let response):
                self.sessionToken?.avatar = response.avatar.tmdb.avatarPath
                self.sessionToken?.username = response.username
                self.sessionToken?.accountId = "\(response.id)"
                presenter?.loginSuccess()
            case .failure(_ ):
                presenter?.loginFailure(username: username, error: Constants.invalidCredentials)
            }
        }
    }
}
