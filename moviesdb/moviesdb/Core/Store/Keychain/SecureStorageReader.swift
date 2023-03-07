//
//  SecureStorageReader.swift
//  moviesdb
//
//  Created by Israel Alejandro Dzul León on 06/03/23.
//

import Foundation

protocol SecureStorageReader {
    func read<T>(service: String, account: String, type: T.Type) -> T? where T : Codable
    func read(service: String, account: String) -> Data?
}
