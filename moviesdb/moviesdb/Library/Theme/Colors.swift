//
//  Colors.swift
//  moviesdb
//
//  Created by Israel Alejandro Dzul León on 03/03/23.
//

import UIKit
  

extension UIColor {
    enum Style: String {
        case backgroud = "Background"
        case navPrimary = "NavPrimary"
        case bodyPrimary = "BodyPrimary"
        case bodySecondary = "BodySecondary"
        case titlePrimary = "TitlePrimary"
        case titleSecondary = "TitleSecondary"
        case subtitlePrimary = "SubtitlePrimary"
        case subtitleSecondary = "SubtitleSecondary"
        case contentPrimary = "ContentPrimary"
        case buttonInactive = "ButtonInactive"
        case buttonActive = "ButtonActive"
        case main = "Main"
    }
    
    convenience init(style: Style) {
        self.init(named: style.rawValue)!
    }
    
    static let background = UIColor(style: .backgroud)
    static let navPrimary = UIColor(style: .navPrimary)
    static let bodyPrimary = UIColor(style: .bodyPrimary)
    static let bodySecondary = UIColor(style: .bodySecondary)
    static let titlePrimary = UIColor(style: .titlePrimary)
    static let titleSecondary = UIColor(style: .titleSecondary)
    static let subtitlePrimary = UIColor(style: .subtitlePrimary)
    static let subtitleSecondary = UIColor(style: .subtitleSecondary)
    static let contentPrimary = UIColor(style: .contentPrimary)
    static let buttonInactive = UIColor(style: .buttonInactive)
    static let buttonActive = UIColor(style: .buttonActive)
    static let main = UIColor(style: .main)
}
