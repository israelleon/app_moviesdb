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
    static let iconWidth: CGFloat = 12
}

class RateView: UIView {
    
    private lazy var rateLabel: UILabel =  {
        let label = UILabel.build(textColor: RateViewConstant.textColor)
        label.font = UIFont.systemFont(ofSize: 12)
        return label
    }()
    
    private lazy var stackView: UIStackView = {
        UIStackView.build(axis: .horizontal, spacing: RateViewConstant.stackViewSpacing)
    }()
    
    func configure(isFavorite: Bool = false, rate: String) {
        setupUI()
        setupConstraints()
        rateLabel.text = rate.isEmpty ? rate : "★ \(rate)"
    }
    
    func setupUI() {
        subviews.forEach {$0.removeFromSuperview()}
        stackView.addArrangedSubview(rateLabel)
        addSubview(stackView)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: topAnchor),
            stackView.bottomAnchor.constraint(equalTo: bottomAnchor),
            stackView.leadingAnchor.constraint(equalTo: leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: trailingAnchor),
        ])
    }
}
