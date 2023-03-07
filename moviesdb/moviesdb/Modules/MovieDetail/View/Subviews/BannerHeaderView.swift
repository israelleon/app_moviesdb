//
//  MovieDetailHeaderView.swift
//  moviesdb
//
//  Created by Israel Alejandro Dzul León on 05/03/23.
//

import UIKit

class BannerHeaderView: UIView {
    private let contentStackView = UIStackView.build(axis: .vertical, spacing: 8)
    private let actionStackview = UIStackView.build(axis: .horizontal, spacing: 8)

    private lazy var bannerView: BannerView = {
        let view = BannerView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var dateLabel: UILabel = {
        let label = UILabel.build(textColor: .main)
        label.text = "Jun 24, merida yuc."
       return label
    }()
    
    private lazy var rateView: RateView = {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(didTapRateView(_:)))
        let view = RateView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.addGestureRecognizer(tapGesture)
        return view
    }()
    
    private lazy var generesLabel: UILabel = {
        let label = UILabel.build(textColor: .main)
        label.text = "terror, action, etc"
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
        setupConstraints()
    }
    
    private func setupUI() {
        subviews.forEach { $0.removeFromSuperview() }
        actionStackview.addArrangedSubviews([dateLabel, rateView])
        contentStackView.addArrangedSubviews([actionStackview, generesLabel])
        addSubview(bannerView)
        addSubview(contentStackView)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            bannerView.topAnchor.constraint(equalTo: self.topAnchor),
            bannerView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            bannerView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            bannerView.heightAnchor.constraint(equalToConstant: 200),
            
            contentStackView.topAnchor.constraint(equalTo: bannerView.bottomAnchor),
            contentStackView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            contentStackView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            contentStackView.bottomAnchor.constraint(lessThanOrEqualTo: self.bottomAnchor),
            
            dateLabel.heightAnchor.constraint(equalToConstant: 30),
        ])
    }
    
    @objc private func didTapRateView(_ gestureReconizer: UITapGestureRecognizer) {
       // TODO: compelte this logic.
    }
}
