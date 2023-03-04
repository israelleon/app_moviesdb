//
//  String+Localizable.swift
//  moviesdb
//
//  Created by Israel Alejandro Dzul León on 04/03/23.
//

import Foundation

extension String {
    var localized: String {
        return NSLocalizedString(self, tableName: "Localizable", comment: "**\(self)**")
    }
}
