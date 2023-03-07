//
//  ProfileView.swift
//  moviesdb
//
//  Created by Israel Alejandro Dzul León on 05/03/23.
//

import UIKit

fileprivate struct Constants {
    static let width: CGFloat = 100
    static let height: CGFloat = 100
    static let cornerRadius = Self.width / 2.0
    static let spacing: CGFloat = 8
}

class CircleProfileView: UIView {
    
    lazy var profileImageView: UIImageView = {
        let imageView = UIImageView.build()
        imageView.layer.cornerRadius = Constants.cornerRadius
        imageView.image = .avatar
        imageView.clipsToBounds = true
        imageView.backgroundColor = .white
        return imageView
    }()
    
    lazy var usernameLabel: UILabel = {
        let label = UILabel.build(textColor: .main)
        return label
    }()
    
    private let contentStackView = UIStackView.build(axis: .horizontal, spacing: Constants.spacing)
    
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
        contentStackView.addArrangedSubviews([profileImageView, usernameLabel])
        addSubview(contentStackView)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            contentStackView.topAnchor.constraint(equalTo: self.topAnchor),
            contentStackView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            contentStackView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            contentStackView.bottomAnchor.constraint(lessThanOrEqualTo: self.bottomAnchor),
            profileImageView.widthAnchor.constraint(equalToConstant: Constants.width),
            profileImageView.heightAnchor.constraint(equalToConstant: Constants.height),
        ])
    }
    
    
    func configure(with username: String?, and imageUrl: URL?) {
        usernameLabel.text = username
        if let avatarImage = imageUrl {
            profileImageView.downloaded(from: avatarImage, contentMode: .scaleToFill)
        }
    }
}
