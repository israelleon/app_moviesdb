//
//  ProfileInteractor.swift
//  moviesdb
//
//  Created by Israel Alejandro Dzul León on 04/03/23.
//

import Foundation
class ProfileInteractor: InteractorProtocol  {
    weak var presenter: ProfilePresenterInteractorProtocol!
    private var session: AuthSessionProtocol
    private var gateway: AccountGatewayProtocol?
    private var sessionToken: SessionTokenProtocol?
    init(session: AuthSessionProtocol, gateway: AccountGatewayProtocol, sessionToken: SessionTokenProtocol) {
        self.session = session
        self.gateway = gateway
        self.sessionToken = sessionToken
    }
}

extension ProfileInteractor:  ProfileInteractorPresenterProtocol{
    
    var avatarURL: URL? {
        var avatarURL: URL?
        if let avatarUser = sessionToken?.avatar {
            let finalPath = GlobalConstants.imagePosterSmall + avatarUser
            avatarURL = URL(string: finalPath)
        }
        return avatarURL
    }
    
    var username: String {
        return sessionToken?.username ?? "---"
    }
    
    func fetchUserInfo() {
        let entity = ProfileEntity(username: username, image: avatarURL, category: MovieCategoryEntity(isLoading: true))
        presenter.fetchUserInfo(entity: entity)
    }
    
    func fetchFavoriteTvShow() {
        let sessionId = sessionToken?.sessionId ?? ""
        let accountId = sessionToken?.accountId ?? ""
        let username = username
        let avatarURL = avatarURL
        self.gateway?.fetchAccountTvFavorites(sessionId: sessionId, accountId: accountId) {[weak presenter] result in
            switch result {
            case .success(let result):
                let items = result.results.map { MovieItemEntity(with: $0)}
                let entity = ProfileEntity(username: username, image: avatarURL, category: MovieCategoryEntity(isLoading: false, tvShows: items))
                presenter?.fetchTvShowFavorites(entity: entity)
            case .failure(_ ):
                let entity = ProfileEntity(username: username, image: avatarURL, category: MovieCategoryEntity(isLoading: false))
                presenter?.fetchTvShowFavorites(entity: entity)
            }
        }
    }
}
