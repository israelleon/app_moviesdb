//
//  UINavigationController+Theme.swift
//  moviesdb
//
//  Created by Israel Alejandro Dzul León on 05/03/23.
//

import UIKit

extension UINavigationController {
    
    func addBarTintColor(_ color: UIColor) -> Self {
        if #available(iOS 15, *) {
            let appearance = navigationBar.standardAppearance.copy()
            appearance.configureWithOpaqueBackground()
            appearance.backgroundColor = color
            navigationBar.standardAppearance = appearance
            navigationBar.scrollEdgeAppearance = appearance
            return self
        }
        navigationBar.barTintColor = color
        return self
    }
    
    func addTintColor(_ color: UIColor) -> Self {
        if #available(iOS 15, *) {
            let appearance = navigationBar.standardAppearance.copy()
            let titleAttribute = [
                NSAttributedString.Key.font: UIFont.systemFont(ofSize: 25, weight: .bold),
                NSAttributedString.Key.foregroundColor: color
            ]
            appearance.titleTextAttributes = titleAttribute
            navigationBar.standardAppearance = appearance
            navigationBar.scrollEdgeAppearance = appearance
            return self
        }
        navigationBar.tintColor = color
        return self
    }
    
    
}
