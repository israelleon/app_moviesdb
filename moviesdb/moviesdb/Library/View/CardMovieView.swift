//
//  CardMovie.swift
//  moviesdb
//
//  Created by Israel Alejandro Dzul León on 03/03/23.
//

import UIKit

fileprivate struct Constants {
    static let stackViewHorizontalSpacing: CGFloat = 8
    static let stackViewVerticalSpacing: CGFloat = 0
    static let posterHeight: CGFloat = 200
    static let contentHeght: CGFloat = 40
    static let titleHeight: CGFloat = 30
    static let columnHeight: CGFloat = 30
    static let rateWidth: CGFloat = 70
    static let titleColor: UIColor = .main
    static let dateColor: UIColor = .main
    static let contentColor: UIColor = .white
    static let cornerRadius: CGFloat = 20
}

protocol CardMovieModel {
    var id: Int {get}
    var title: String { get }
    var content: String { get }
    var isFavorite: Bool { get }
    var date: String { get }
    var rate: String { get }
    var image: URL? { get }
}

class CardMovieView: UIView & ReusableView {
   
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func didMoveToWindow() {
        super.didMoveToWindow()
    }
    
    private lazy var posterImageView: UIImageView = {
        let imageView = UIImageView.build()
        imageView.backgroundColor = .black
        imageView.layer.cornerRadius = Constants.cornerRadius
        imageView.clipsToBounds = true
        return imageView
    }()
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel.build(textColor: Constants.titleColor)
        label.text = "--"
        label.font = UIFont.boldSystemFont(ofSize: 14)
        return label
    }()
    
    private lazy var dateLabel: UILabel = {
        let label = UILabel.build(textColor: Constants.dateColor)
        label.text = "---"
        label.font = UIFont.boldSystemFont(ofSize: 12)
        return label
    }()
    
    private lazy var rateView: RateView = {
        let view =  RateView.build()
        view.configure(rate: "-")
        return view
    }()
    
    private lazy var contentLabel: UILabel = {
        let label = UILabel.build(textColor: Constants.contentColor)
        label.text = "---"
        label.font = UIFont.italicSystemFont(ofSize: 12)
        label.numberOfLines = 0
        return label
    }()
    
    func config(with model: CardMovieModel) {
        contentLabel.text = model.content
        rateView.configure(rate: model.rate)
        dateLabel.text = model.date
        titleLabel.text = model.title
        if let url = model.image {
            posterImageView.downloaded(from: url)
        }
    }
    
    private func setupUI() {
        backgroundColor = .cardBackground
        layer.cornerRadius = Constants.cornerRadius
        subviews.forEach { $0.removeFromSuperview() }
        let horizontalStackView = UIStackView.build(views: [dateLabel, rateView], axis: .horizontal, spacing: Constants.stackViewHorizontalSpacing)
        let verticalStackView = UIStackView.build(views: [titleLabel, horizontalStackView, contentLabel], axis: .vertical, spacing: Constants.stackViewVerticalSpacing)
        
        addSubview(posterImageView)
        addSubview(verticalStackView)
        
        NSLayoutConstraint.activate([
            posterImageView.topAnchor.constraint(equalTo: topAnchor),
            posterImageView.leadingAnchor.constraint(equalTo: leadingAnchor),
            posterImageView.trailingAnchor.constraint(equalTo: trailingAnchor),
            verticalStackView.topAnchor.constraint(equalTo: posterImageView.bottomAnchor, constant: 8),
            
            verticalStackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 8),
            verticalStackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -8),
            verticalStackView.bottomAnchor.constraint(lessThanOrEqualTo: bottomAnchor, constant: -8),
            
            horizontalStackView.heightAnchor.constraint(equalToConstant: Constants.columnHeight),
            posterImageView.heightAnchor.constraint(equalToConstant: Constants.posterHeight),
        ])
    }
}
