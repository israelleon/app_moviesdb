//
//  BannerViewCell.swift
//  moviesdb
//
//  Created by Israel Alejandro Dzul León on 05/03/23.
//

import UIKit

class BannerView: UIView, ReusableView {
    
    private lazy var banneImageView: UIImageView = {
        let imageView = UIImageView.build()
        backgroundColor = .cardBackground
        return imageView
    }()
    
    private lazy var titleLabel:  UILabel = {
        let label = UILabel.build(textColor: .white)
        label.backgroundColor = .black.withAlphaComponent(0.3)
        label.numberOfLines = 2
        label.font = UIFont.boldSystemFont(ofSize: 22)
        label.textAlignment = .center
        return label
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
        setupContraints()
    }
    
    private func setupUI() {
        subviews.forEach{ $0.removeFromSuperview() }
        addSubview(banneImageView)
        addSubview(titleLabel)
    }
    
    private func setupContraints() {
        banneImageView.fitTo(self)
        NSLayoutConstraint.activate([
            titleLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            titleLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            titleLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: 0),
            titleLabel.topAnchor.constraint(greaterThanOrEqualTo: self.topAnchor, constant: 8),
            banneImageView.heightAnchor.constraint(equalToConstant: 200)
        ])
    }
    
    func configure(with title: String, bannerURL url: URL?) {
        titleLabel.text = title
        if let url = url {
            banneImageView.downloaded(from: url, contentMode: .scaleToFill)
        }
    }
}

