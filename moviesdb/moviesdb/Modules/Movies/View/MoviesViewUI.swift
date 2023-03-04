//
//  MovieViewUI.swift
//  moviesdb
//
//  Created by Israel Alejandro Dzul León on 03/03/23.
//

import UIKit

class MoviesViewUI: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("MoviesViewUI.\(#function) coder exception")
    }
    
    private func setupUI() {
        backgroundColor = .background
    }
}
