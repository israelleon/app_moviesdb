//
//  AccountMarkFavorite.swift
//  moviesdb
//
//  Created by Israel Alejandro Dzul León on 06/03/23.
//

import Foundation

struct AccountMarkFavorite: Codable {
    var mediaType: String
    var mediaId: Int
    var favorite: Bool
    
    enum CodingKeys: String, CodingKey {
        case mediaType = "media_type"
        case mediaId = "media_id"
        case favorite
    }
}
