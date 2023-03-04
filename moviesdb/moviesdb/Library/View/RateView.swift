//
//  RateView.swift
//  moviesdb
//
//  Created by Israel Alejandro Dzul León on 03/03/23.
//

import UIKit

struct RateViewConstant {
    static let stackViewSpacing: CGFloat = 8
    static let textColor: UIColor = .main
    static let iconWidth: CGFloat = 30
}

class RateView: UIView {
    
    private lazy var iconImageView: UIImageView =  {
        let imageView = UIImageView.build(.starIcon)
        imageView.contentMode = .scaleAspectFit
        imageView.tintColor = RateViewConstant.textColor
        return imageView
    }()
    
    private lazy var rateLabel: UILabel =  {
        UILabel.build(textColor: RateViewConstant.textColor)
    }()
    
    private lazy var stackView: UIStackView = {
        UIStackView.build(axis: .horizontal, spacing: RateViewConstant.stackViewSpacing)
    }()
    
    func configure(isFavorite: Bool = false, rate: String) {
        setupUI()
        setupConstraints()
        iconImageView.image = isFavorite ? .starFullIcon : .starIcon
        rateLabel.text = rate
    }
    
    func setupUI() {
        subviews.forEach {$0.removeFromSuperview()}
        stackView.addArrangedSubview(iconImageView)
        stackView.addArrangedSubview(rateLabel)
        addSubview(stackView)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: topAnchor),
            stackView.bottomAnchor.constraint(equalTo: bottomAnchor),
            stackView.leadingAnchor.constraint(equalTo: leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: trailingAnchor),
            iconImageView.heightAnchor.constraint(equalToConstant: RateViewConstant.iconWidth),
        ])
    }
}
