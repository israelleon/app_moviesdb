//
//  MovieDetailModule.swift
//  moviesdb
//
//  Created by Israel Alejandro Dzul León on 04/03/23.
//

import UIKit

final class MovieDetailModule: ModuleProtocol, ModuleBuilderProtocol {
    
    typealias View = MovieDetailView
    typealias Presenter = MovieDetailPresenter
    typealias Router = MovieDetailRouter
    typealias Interactor = MovieDetailInteractor
    
    private var movieId: Int
    
    init(movieId: Int) {
        self.movieId = movieId
    }
    
    func build() -> UIViewController {
        let store = SecureStorage.standard
        let storeSessionToken = SessionToken(storage: store)
        let appConfig = AppConfig()
        let networkManager = NetworkManager()
        let apiEndpoint = ApiEndpoints(config: appConfig)
        let gateway = ApiClient(manager: networkManager, apiEndpoint: apiEndpoint)
        let session = AuthSessionManager(store: storeSessionToken, gateway: gateway)
        
        let view = View()
        let interactor = Interactor(apiGateway: gateway, authSession: session, sessionToken: storeSessionToken, movieId: movieId)
        let presenter = Presenter()
        let router = Router()
        self.embed(view: view, presenter: presenter, router: router, interactor: interactor)
        router.viewController = view
        return view
    }
}
