//
//  MovieInteractor.swift
//  moviesdb
//
//  Created by Israel Alejandro Dzul León on 03/03/23.
//

import Foundation

typealias TvShowResponse = Result<TVShowResult, Error>

class MoviesInteractor: InteractorProtocol  {
   weak var presenter: MoviesPresenterInteractorProtocol!
    private var apiGateway: TvShowGatewayProtocol
    private var authSession: AuthSessionProtocol
    init(apiGateway: TvShowGatewayProtocol, authSession: AuthSessionProtocol) {
        self.apiGateway = apiGateway
        self.authSession = authSession
    }
}

extension MoviesInteractor:  MoviesInteractorPresenterProtocol{
    func fetchTvShows(type: MovieCategory, page: Int) {
        // TODO: add page to request
        switch type {
        case .popular:
            apiGateway.fetchTvPopular { self.handleResponse(type, result: $0) }
        case .topRated:
            apiGateway.fetchTopRated { self.handleResponse(type, result: $0) }
        case .onTV:
            apiGateway.fetchTvOnTheAir { self.handleResponse(type, result: $0) }
        case .airingToday:
            apiGateway.fetchAirToday { self.handleResponse(type, result: $0) }
        }
    }
    
    private func handleResponse(_ category: MovieCategory, result: TvShowResponse ) {
        switch result {
        case .success(let response):
            let items = response.results.map { MovieItemEntity(with: $0)}
            presenter.responseTvShows(type: category, elements: items, totalPages: response.totalPages)
        case .failure(let error):
            debugPrint(error)
            presenter.responseTvShows(type: category, elements: [], totalPages: 0)
        }
    }
}
