//
//  UIViewController+Navigation.swift
//  moviesdb
//
//  Created by Israel Alejandro Dzul León on 05/03/23.
//

import UIKit

extension UIViewController {
    func addRightButonIcon(_ icon: UIImage?, onTap selector: Selector) {
        guard let icon = icon else { return }
        let button = UIButton(frame: CGRect(origin: .zero, size: CGSize(width: 44, height: 44)))
        button.setImage(icon, for: .normal)
        button.tintColor = .white
        button.addTarget(self, action: selector, for: .touchUpInside)
        let barButtonItem = UIBarButtonItem(customView: button)
        if var rightButtons = navigationItem.rightBarButtonItems {
            rightButtons.append(barButtonItem)
        } else {
            navigationItem.rightBarButtonItems = [barButtonItem]
        }
    }
}
