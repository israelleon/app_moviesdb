//
//  MovieDetailInteractor.swift
//  moviesdb
//
//  Created by Israel Alejandro Dzul León on 04/03/23.
//

import Foundation
class MovieDetailInteractor: InteractorProtocol  {
   weak var presenter: MovieDetailPresenterInteractorProtocol!
    private var apiGateway: TvShowGatewayProtocol & AccountGatewayProtocol
    private var authSession: AuthSessionProtocol?
    private var sessionToken: SessionTokenProtocol?
    private var movieId: Int
    init(apiGateway: TvShowGatewayProtocol & AccountGatewayProtocol, authSession: AuthSessionProtocol, sessionToken: SessionTokenProtocol, movieId: Int) {
        self.apiGateway = apiGateway
        self.authSession = authSession
        self.sessionToken = sessionToken
        self.movieId = movieId
    }
}

extension MovieDetailInteractor:  MovieDetailInteractorPresenterProtocol {
    func fetchMoviewDetail() {
        apiGateway.fetchTvShowDetails(id: self.movieId) { [weak presenter] result in
            switch result {
            case .success(let response):
                presenter?.successFetchMovieDetail(entity: MovieDetailEntity(response: response))
            case .failure(let error):
                debugPrint(error)
                presenter?.failureFetchMovieDetail()
            }
        }
    }
    
    func markAsFavorite(isFavorite: Bool) {
        let sessionId = sessionToken?.sessionId ?? ""
        let accountId = sessionToken?.accountId ?? ""
        apiGateway.fetchMarkFavorite(sessionId: sessionId, accountId: accountId, movieId: movieId, isFavorite: isFavorite) { [weak self] result in
            if case .success(let response) = result {
                debugPrint(response)
                self?.fetchMoviewDetail()
            }
        }
    }
}
