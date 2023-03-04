//
//  UIView+Gradient.swift
//  moviesdb
//
//  Created by Israel Alejandro Dzul León on 03/03/23.
//

import UIKit

extension UIView {
    func setVerticalGradient(topColor: UIColor?, bottomColor: UIColor?) {
        guard let topColor = topColor, let bottomColor = bottomColor else { return }
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = [topColor.cgColor, bottomColor.cgColor]
        gradientLayer.locations = [0.0, 0.3]
        gradientLayer.frame = self.bounds
        self.layer.insertSublayer(gradientLayer, at: 0)
    }
}
