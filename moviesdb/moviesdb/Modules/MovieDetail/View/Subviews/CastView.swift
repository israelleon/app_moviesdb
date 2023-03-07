//
//  CastView.swift
//  moviesdb
//
//  Created by Israel Alejandro Dzul León on 05/03/23.
//

import UIKit

class CastView: UIView, ReusableView {
   
    private let contentStackView = UIStackView.build(axis: .horizontal, spacing: 8)
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel.build(textColor: .white)
        label.text = "hola por medio de la presente les comento"
        label.numberOfLines = 0
        return label
    }()
    
    private lazy var actorImageView: UIImageView = {
        let imageView = UIImageView.build()
        imageView.layer.cornerRadius = 20
        imageView.backgroundColor = .white
        return imageView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func didMoveToWindow() {
        super.didMoveToWindow()
        setupConstraints()
    }
    
    private func setupUI() {
        subviews.forEach{ $0.removeFromSuperview() }
        contentStackView.addArrangedSubviews([actorImageView, titleLabel])
        addSubview(contentStackView)
    }
    
    private func setupConstraints() {
        contentStackView.fitTo(self)
        NSLayoutConstraint.activate([
            actorImageView.heightAnchor.constraint(equalToConstant: 40),
            actorImageView.widthAnchor.constraint(equalToConstant: 20)
        ])
    }
    
}
