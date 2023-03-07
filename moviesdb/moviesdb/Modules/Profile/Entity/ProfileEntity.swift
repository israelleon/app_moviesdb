//
//  ProfileEntity.swift
//  moviesdb
//
//  Created by Israel Alejandro Dzul León on 04/03/23.
//

import Foundation

struct ProfileEntity: EntityProtocol {
    var username: String?
    var image: URL?
    
    var category: MovieCategoryEntity?
}


