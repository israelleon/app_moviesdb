//
//  GenericCollectionCell.swift
//  moviesdb
//
//  Created by Israel Alejandro Dzul León on 04/03/23.
//

import UIKit

class GenericCollectionViewCell<T: UIView>: UICollectionViewCell & ReusableView where T: ReusableView {
    var uiView: T! {
        didSet {
            uiView.translatesAutoresizingMaskIntoConstraints = false
            subviews.forEach { $0.removeFromSuperview() }
            addSubview(uiView)
            uiView.fitTo(self)
        }
    }
    
    static var reuseIdentifier: String {
        return "\(String(describing: self)).\(String(describing: T.reuseIdentifier))"
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("GenericCollectionViewCell.\(#function) no implemented")
    }
    
    private func setupUI() {
        uiView = T()
    }
}
