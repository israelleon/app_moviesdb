//
//  ApiClient.swift
//  moviesdb
//
//  Created by Israel Alejandro Dzul León on 05/03/23.
//

import Foundation

class ApiClient {
    private var manager: NetworkManagerProtocol
    private var apiEndpoint: ApiEndpointProtocol
    init(manager: NetworkManagerProtocol, apiEndpoint: ApiEndpointProtocol) {
        self.manager = manager
        self.apiEndpoint = apiEndpoint
    }
}

extension ApiClient: AuthGatewayProtocol {
    func fetchAuthSession(token: String, handler: @escaping AuthSessionCompletionHandler) {
        // TODO: complete validation endpoint
        guard let endpoint = apiEndpoint.session else { return }
        let body = AuthSessionBody(requestToken: token)
        let request = JsonBodyRequest(endpoint: endpoint, body: body)
        manager.request(request, handler: handler)
    }
    
    func fetchAuthNewToken(handler: @escaping AuthNewTokenCompletionHandler) {
        // TODO: complete validation endpoint
        guard let endpoint = apiEndpoint.authTokenNew else { return }
        let request = NoBodyRequest(endpoint: endpoint)
        manager.request(request, handler: handler)
    }
    
    func fetchAuthValidateLogin(username: String, password: String, token: String, handler: @escaping AuthValidateLoginCompletionHandler) {
        // TODO: complete validation endpoint
        guard let endpoint = apiEndpoint.authValidateWithLogin else { return }
        let model = AuthTokenValidateWithLogin(username: username, password: password, requestToken: token)
        let request = JsonBodyRequest(endpoint: endpoint, body: model)
        manager.request(request, handler: handler)
    }
}

extension ApiClient: TvShowGatewayProtocol {
    func fetchTvPopular(handler: @escaping TvPopularCompletionHandler) {
        // TODO: complete validation endpoint
        guard let endpoint = apiEndpoint.tvPopular else { return }
        let request = NoBodyRequest(endpoint: endpoint)
        manager.request(request, handler: handler)
    }
    
    func fetchTvOnTheAir(handler: @escaping TvOnTheAirCompletionHandler) {
        // TODO: complete validation endpoint
        guard let endpoint = apiEndpoint.tvOnTheAir else { return }
        let request = NoBodyRequest(endpoint: endpoint)
        manager.request(request, handler: handler)
    }
    
    func fetchTopRated(handler: @escaping TvTopRatedCompletionHandler) {
        // TODO: complete validation endpoint
        guard let endpoint = apiEndpoint.tvTopRated else { return }
        let request = NoBodyRequest(endpoint: endpoint)
        manager.request(request, handler: handler)
    }
    
    func fetchAirToday(handler: @escaping TvAirTodayCompletionHandler) {
        // TODO: complete validation endpoint
        guard let endpoint = apiEndpoint.tvAiringToday else { return }
        let request = NoBodyRequest(endpoint: endpoint)
        manager.request(request, handler: handler)
    }
    
    func fetchTvShowDetails(id: Int, handler: @escaping TvShowDetailCompletionHandler) {
        // TODO: complete validation endpoint {account_id}
        guard let endpoint = apiEndpoint.tvDetails else { return }
        let uriId = ["{tv_id}": "\(id)"]
        let request = NoBodyRequest(endpoint: endpoint, replaceUriId: uriId)
        manager.request(request, handler: handler)
    }
}

extension ApiClient: AccountGatewayProtocol {
    func fetchAccountTvFavorites(sessionId: String, accountId: String, handler: @escaping AccountTvShowFavConpletionHandler) {
        // TODO: complete validation endpoint {movie_id}
        guard let endpoint = apiEndpoint.accountFavorites else { return }
        let uriId = ["{account_id}": accountId]
        let request = NoBodyRequest(endpoint: endpoint, uriParams: "&session_id=\(sessionId)", replaceUriId: uriId)
        manager.request(request, handler: handler)
    }
    
    func fetchMarkFavorite(sessionId: String, accountId: String, movieId: Int, isFavorite: Bool, handler: @escaping AccountMarkFavoriteCompletionHandler) {
        // TODO: complete validation endpoint {account_id}
        guard let endpoint = apiEndpoint.accountMarkFavorites else { return }
        let uriId = ["{account_id}": accountId]
        let body = AccountMarkFavorite(mediaType: "tv", mediaId: movieId, favorite: isFavorite)
        let request = JsonBodyRequest(endpoint: endpoint, body: body, uriParams: "&session_id=\(sessionId)", replaceUriId: uriId)
        manager.request(request, handler: handler)
    }
    
    func fetchAccountDetails(sessionId: String, handler: @escaping AccountInfoCompletionHandler) {
        // TODO: complete validation endpoint
        guard let endpoint = apiEndpoint.accountDetails else { return }
        let request = NoBodyRequest(endpoint: endpoint, uriParams: "&session_id=\(sessionId)")
        manager.request(request, handler: handler)
    }
}
