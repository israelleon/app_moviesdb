//
//  ApiEndpoints.swift
//  moviesdb
//
//  Created by Israel Alejandro Dzul León on 05/03/23.
//

import Foundation

struct ApiEndpoints: ApiEndpointProtocol {
    private var config: ConfigEnvProtocol
    
    init(config: ConfigEnvProtocol) {
        self.config = config
    }
    
    var authTokenNew: ConfigEndpointProtocol? {
        config.getEnpoint(endpoint: "auth", forKey: "token_new")
    }
    
    var authValidateWithLogin: ConfigEndpointProtocol? {
        config.getEnpoint(endpoint: "auth", forKey: "validate_with_login")
    }
    
    var session: ConfigEndpointProtocol? {
        config.getEnpoint(endpoint: "auth", forKey: "session")
    }
    
    var tvPopular: ConfigEndpointProtocol? {
        config.getEnpoint(endpoint: "tv", forKey: "popular")
    }
    
    var tvOnTheAir: ConfigEndpointProtocol? {
        config.getEnpoint(endpoint: "tv", forKey: "on_the_air")
    }
    
    var tvAiringToday: ConfigEndpointProtocol? {
        config.getEnpoint(endpoint: "tv", forKey: "airing_today")
    }
    
    var tvTopRated: ConfigEndpointProtocol? {
        config.getEnpoint(endpoint: "tv", forKey: "top_rated")
    }
    
    var tvDetails: ConfigEndpointProtocol? {
        config.getEnpoint(endpoint: "tv", forKey: "details")
    }
    
    var accountFavorites: ConfigEndpointProtocol? {
        config.getEnpoint(endpoint: "account", forKey: "tv_favorites")
    }
    
    var accountMarkFavorites: ConfigEndpointProtocol? {
        config.getEnpoint(endpoint: "account", forKey: "mark_favorite")
    }
    
    var accountDetails: ConfigEndpointProtocol? {
        config.getEnpoint(endpoint: "account", forKey: "details")
    }
}
