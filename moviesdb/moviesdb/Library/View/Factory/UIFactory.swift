//
//  UIFactory.swift
//  moviesdb
//
//  Created by Israel Alejandro Dzul León on 03/03/23.
//

import UIKit

extension UILabel {
    static func build(textColor: UIColor) -> UILabel {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = textColor
        return label
    }
}

extension UIButton {
    static func build() -> UIButton {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }
}


extension UIImageView {
    static func build(_ image: UIImage? = nil) -> UIImageView {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = image
        return imageView
    }
}

extension UIStackView {
    static func build(views: [UIView] = [], axis: NSLayoutConstraint.Axis, spacing: CGFloat) -> UIStackView {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.spacing = spacing
        stackView.axis = axis
        stackView.addArrangedSubviews(views)
        return stackView
    }
    
    func addArrangedSubviews(_ subviews: [UIView]) {
        subviews.forEach { self.addArrangedSubview($0) }
    }
}

extension RateView {
    static func build() -> RateView {
        let rateView = RateView()
        rateView.translatesAutoresizingMaskIntoConstraints = false
        return rateView
    }
}
