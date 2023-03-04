//
//  CardMovie.swift
//  moviesdb
//
//  Created by Israel Alejandro Dzul León on 03/03/23.
//

import UIKit

protocol CardMovieModel {
    var title: String { get }
    var content: String { get }
    var isFavorite: Bool { get }
    var date: String { get }
    var rate: String { get }
    var image: URL { get }
}

fileprivate struct CardMovieConstants {
    static let stackViewHorizontalSpacing: CGFloat = 8
    static let stackViewVerticalSpacing: CGFloat = 8
    static let posterHeight: CGFloat = 100
    static let contentHeght: CGFloat = 40
    static let titleHeight: CGFloat = 30
    static let columnHeight: CGFloat = 30
    static let rateWidth: CGFloat = 70
    static let titleColor: UIColor = .main
    static let dateColor: UIColor = .main
    static let contentColor: UIColor = .white
}

class CardMovieView: UIView {
   
    private lazy var posterImageView: UIImageView = {
        UIImageView.build()
    }()
    
    private lazy var titleLabel: UILabel = {
        UILabel.build(textColor: CardMovieConstants.titleColor)
    }()
    
    private lazy var dateLabel: UILabel = {
        UILabel.build(textColor: CardMovieConstants.dateColor)
    }()
    
    private lazy var rateView: RateView = {
        RateView.build()
    }()
    
    private lazy var contentLabel: UILabel = {
        UILabel.build(textColor: CardMovieConstants.contentColor)
    }()
    
    func config(with model: CardMovieModel) {
        setupUI()
        // TODO: fill data.
    }
    
    private func setupUI() {
        subviews.forEach { $0.removeFromSuperview() }
        let horizontalStackView = UIStackView.build(views: [dateLabel, rateView], axis: .horizontal, spacing: CardMovieConstants.stackViewHorizontalSpacing)
        let verticalStackView = UIStackView.build(views: [posterImageView, titleLabel, horizontalStackView, contentLabel], axis: .vertical, spacing: CardMovieConstants.stackViewVerticalSpacing)
        addSubview(verticalStackView)
        
        NSLayoutConstraint.activate([
            verticalStackView.topAnchor.constraint(equalTo: topAnchor),
            verticalStackView.leadingAnchor.constraint(equalTo: leadingAnchor),
            verticalStackView.trailingAnchor.constraint(equalTo: trailingAnchor),
            verticalStackView.bottomAnchor.constraint(equalTo: bottomAnchor),
            horizontalStackView.heightAnchor.constraint(equalToConstant: CardMovieConstants.columnHeight),
            posterImageView.heightAnchor.constraint(equalToConstant: CardMovieConstants.posterHeight),
            titleLabel.heightAnchor.constraint(equalToConstant: CardMovieConstants.titleHeight),
            rateView.widthAnchor.constraint(equalToConstant: CardMovieConstants.rateWidth),
            contentLabel.heightAnchor.constraint(equalToConstant: CardMovieConstants.contentHeght),
        ])
    }
}
