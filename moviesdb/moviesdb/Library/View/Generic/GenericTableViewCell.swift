//
//  GenericTableViewCell.swift
//  moviesdb
//
//  Created by Israel Alejandro Dzul León on 05/03/23.
//

import UIKit

class GenericTableViewCell<T: UIView>: UITableViewCell & ReusableView where T: ReusableView {
    var uiView: T! {
        didSet {
            backgroundColor = .clear
            uiView.translatesAutoresizingMaskIntoConstraints = false
            subviews.forEach { $0.removeFromSuperview() }
            addSubview(uiView)
            uiView.fitToSafeArea(self)
        }
    }
    
    static var reuseIdentifier: String {
        return "\(String(describing: self)).\(String(describing: T.reuseIdentifier))"
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupUI()
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI() {
        uiView = T()
    }
    
}
