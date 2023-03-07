//
//  UIView+Constraints.swift
//  moviesdb
//
//  Created by Israel Alejandro Dzul León on 04/03/23.
//

import UIKit

extension UIView {
    
    func fitTo(_ view: UIView, edgeInset: UIEdgeInsets = .zero) {
        NSLayoutConstraint.activate([
            self.topAnchor.constraint(equalTo: view.topAnchor, constant: edgeInset.top),
            self.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: edgeInset.bottom),
            self.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: edgeInset.right),
            self.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: edgeInset.left)
        ])
    }
    
    func fitToSafeArea(_ view: UIView, edgeInset: UIEdgeInsets = .zero) {
         NSLayoutConstraint.activate([
            self.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: edgeInset.top),
            self.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: edgeInset.bottom),
            self.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: edgeInset.right),
            self.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: edgeInset.left)
        ])
    }
}
