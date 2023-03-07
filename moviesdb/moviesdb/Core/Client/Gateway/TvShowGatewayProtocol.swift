//
//  MoviesGatewayProtocol.swift
//  moviesdb
//
//  Created by Israel Alejandro Dzul León on 05/03/23.
//

import Foundation

typealias TvPopularCompletionHandler = (_ result: Result<TVShowResult, Error>) -> Void
typealias TvOnTheAirCompletionHandler = (_ result: Result<TVShowResult, Error>) -> Void
typealias TvTopRatedCompletionHandler = (_ result: Result<TVShowResult, Error>) -> Void
typealias TvAirTodayCompletionHandler = (_ result: Result<TVShowResult, Error>) -> Void
typealias TvShowDetailCompletionHandler = (_ result: Result<TvShowDetails, Error>) -> Void


protocol TvShowGatewayProtocol {
    
    func fetchTvPopular(handler: @escaping TvPopularCompletionHandler)
    func fetchTvOnTheAir(handler: @escaping TvOnTheAirCompletionHandler)
    func fetchTopRated(handler: @escaping TvTopRatedCompletionHandler)
    func fetchAirToday(handler: @escaping TvAirTodayCompletionHandler)
    func fetchTvShowDetails(id: Int, handler: @escaping TvShowDetailCompletionHandler)
    
}
