//
//  GenericTableReusableHeaderView.swift
//  moviesdb
//
//  Created by Israel Alejandro Dzul León on 05/03/23.
//

import UIKit

class GenericTableReusableHeaderView<T: UIView>: UITableViewHeaderFooterView  & ReusableView where T: ReusableView {
   
    var uiView: T! {
        didSet {
            uiView.translatesAutoresizingMaskIntoConstraints = false
            subviews.forEach{$0.removeFromSuperview()}
            addSubview(uiView)
            uiView.fitTo(self)
        }
    }
    
    static var reuseIdentifier: String {
        return "\(String(describing: self)).\(String(describing: T.reuseIdentifier))"
    }
    
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI() {
       uiView = T()
    }
}

