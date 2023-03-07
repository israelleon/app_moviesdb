//
//  SimpleHeaderView.swift
//  moviesdb
//
//  Created by Israel Alejandro Dzul León on 05/03/23.
//

import UIKit

class CastHeaderView: UIView {
    private lazy var titleLabel: UILabel = {
        let label = UILabel.build(textColor: .main)
        label.text = "Cast"
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func didMoveToWindow() {
        super.didMoveToWindow()
    }
    
    private func setupUI() {
        subviews.forEach{$0.removeFromSuperview()}
        addSubview(titleLabel)
    }
    
    private func setupConstraints() {
        titleLabel.fitTo(self)
    }
}


