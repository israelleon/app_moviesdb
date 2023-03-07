//
//  AccountGatewayProtocol.swift
//  moviesdb
//
//  Created by Israel Alejandro Dzul León on 05/03/23.
//

import Foundation

typealias AccountInfoCompletionHandler = (_ result: Result<AccountInfo, Error>) -> Void
typealias AccountTvShowFavConpletionHandler = (_ result: Result<TVShowResult, Error>) -> Void
typealias AccountMarkFavoriteCompletionHandler = (_ result: Result<MarkFavorite, Error>) -> Void

protocol AccountGatewayProtocol {
    func fetchAccountTvFavorites(sessionId: String, accountId: String, handler: @escaping AccountTvShowFavConpletionHandler)
    func fetchAccountDetails(sessionId: String, handler: @escaping AccountInfoCompletionHandler)
    func fetchMarkFavorite(sessionId: String, accountId: String, movieId: Int, isFavorite: Bool, handler: @escaping AccountMarkFavoriteCompletionHandler)
}
