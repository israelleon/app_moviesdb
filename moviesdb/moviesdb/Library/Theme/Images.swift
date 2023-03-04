//
//  Assets.swift
//  moviesdb
//
//  Created by Israel Alejandro Dzul León on 03/03/23.
//

import UIKit

extension UIImage {
    enum Assets: String {
       case logo = "Logo"
    }
    
    convenience init?(assets: Assets) {
        self.init(named: assets.rawValue)
    }
    
    static let logo = UIImage(assets: .logo)
    static let starIcon = UIImage(systemName: "star")?.withRenderingMode(.alwaysTemplate)
    static let starFullIcon = UIImage(systemName: "start.fill")?.withRenderingMode(.alwaysTemplate)
}
