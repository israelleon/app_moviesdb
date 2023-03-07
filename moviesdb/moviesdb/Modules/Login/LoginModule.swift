//
//  LoginModule.swift
//  moviesdb
//
//  Created by Israel Alejandro Dzul León on 03/03/23.
//

import UIKit

final class LoginModule: ModuleProtocol, ModuleBuilderProtocol {
    
    typealias View = LoginView
    typealias Presenter = LoginPresenter
    typealias Router = LoginRouter
    typealias Interactor = LoginInteractor
    
    func build() -> UIViewController {
        let store = SecureStorage.standard
        let storeSessionToken = SessionToken(storage: store)
        let appConfig = AppConfig()
        let networkManager = NetworkManager()
        let apiEndpoint = ApiEndpoints(config: appConfig)
        let gateway = ApiClient(manager: networkManager, apiEndpoint: apiEndpoint)
        let session = AuthSessionManager(store: storeSessionToken, gateway: gateway)
        
        let view = View()
        let interactor = Interactor(session: session, gateway: gateway, sessionToken: storeSessionToken)
        let presenter = Presenter()
        let router = Router()
        self.embed(view: view, presenter: presenter, router: router, interactor: interactor)
        router.viewController = view
        return view
    }
}
