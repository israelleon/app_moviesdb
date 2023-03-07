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
        case avatar = "Avatar"
    }
    
    convenience init?(assets: Assets) {
        self.init(named: assets.rawValue)
    }
    
    static let logo = UIImage(assets: .logo)
    static let avatar = UIImage(assets: .avatar)
    static let starIcon = UIImage(systemName: "star", withConfiguration: UIImage.SymbolConfiguration(weight: .regular))?.withRenderingMode(.alwaysTemplate)
    static let starFullIcon = UIImage(systemName: "start.fill", withConfiguration: UIImage.SymbolConfiguration(weight: .regular))?.withRenderingMode(.alwaysTemplate)
    static let listBullet = UIImage(systemName: "list.bullet")?.withRenderingMode(.alwaysTemplate)
}
