//
//  ApiEndpointProtocol.swift
//  moviesdb
//
//  Created by Israel Alejandro Dzul León on 05/03/23.
//

import Foundation

protocol ApiEndpointProtocol {
    var authTokenNew: ConfigEndpointProtocol? { get }
    
    var authValidateWithLogin: ConfigEndpointProtocol? { get }
    
    var session: ConfigEndpointProtocol? { get }
    
    var tvPopular: ConfigEndpointProtocol? { get }
    
    var tvOnTheAir: ConfigEndpointProtocol? { get }
    
    var tvAiringToday: ConfigEndpointProtocol? { get }
    
    var tvTopRated: ConfigEndpointProtocol? { get }
    
    var tvDetails: ConfigEndpointProtocol? { get }
    
    var accountFavorites: ConfigEndpointProtocol? { get }
    
    var accountMarkFavorites: ConfigEndpointProtocol? { get }
    
    var accountDetails: ConfigEndpointProtocol? { get }
}
