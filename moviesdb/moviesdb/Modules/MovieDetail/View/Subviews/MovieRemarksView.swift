//
//  MovieDetailRemarksView.swift
//  moviesdb
//
//  Created by Israel Alejandro Dzul León on 05/03/23.
//

import UIKit

fileprivate struct Constants {
    static let stackViewEdgeInset = UIEdgeInsets(top: 16, left: 16, bottom: -16, right: -16)
}

class MovieRemarksView: UIView, ReusableView {
    private lazy var bodyLabel: UILabel = {
        let label = UILabel.build(textColor: .white)
        label.numberOfLines = 0
        label.font = UIFont.italicSystemFont(ofSize: 14)
        return label
    }()
    
    private let contentStackView = UIStackView.build(axis: .vertical, spacing: 10)
    
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
        subviews.forEach{ $0.removeFromSuperview()}
        contentStackView.addArrangedSubviews([bodyLabel])
        addSubview(contentStackView)
    }
    
    private func setupConstraints() {
        contentStackView.fitToSafeArea(self, edgeInset: Constants.stackViewEdgeInset)
    }
    
    func setTitle(title: String, color: UIColor = .white) {
        bodyLabel.text = title
        bodyLabel.textColor = color
    }
}

