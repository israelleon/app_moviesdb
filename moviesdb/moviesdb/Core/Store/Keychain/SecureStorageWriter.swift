//
//  SecureStorageProtocol.swift
//  moviesdb
//
//  Created by Israel Alejandro Dzul León on 06/03/23.
//

import Foundation

protocol SecureStorageWriter {
    func save<T>(_ item: T, service: String, account: String) where T: Codable
    func save(_ data: Data, service: String, account: String)
    func delete(service: String, account: String)
}
