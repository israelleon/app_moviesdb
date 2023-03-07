//
//  ServerErrorResponse.swift
//  moviesdb
//
//  Created by Israel Alejandro Dzul León on 05/03/23.
//

import Foundation

// MARK: - ServerErrorResponse
struct ServerFailure: Codable {
    let success, failure: Bool
    let statusCode: Int
    let statusMessage: String

    enum CodingKeys: String, CodingKey {
        case success, failure
        case statusCode = "status_code"
        case statusMessage = "status_message"
    }
}
