//
//  UIViewController+Loading.swift
//  moviesdb
//
//  Created by Israel Alejandro Dzul León on 06/03/23.
//

import UIKit

extension UIViewController {
    func presentLoader() {
          let alert = UIAlertController(title: nil, message: "", preferredStyle: .alert)
          let activityIndicator = UIActivityIndicatorView(style: .large)
          activityIndicator.translatesAutoresizingMaskIntoConstraints = false
          activityIndicator.isUserInteractionEnabled = false
          activityIndicator.color = .main
          activityIndicator.startAnimating()
                  
          alert.view.addSubview(activityIndicator)
          
          NSLayoutConstraint.activate([
              alert.view.heightAnchor.constraint(equalToConstant: 95),
              alert.view.widthAnchor.constraint(equalToConstant: 95),
              activityIndicator.centerXAnchor.constraint(equalTo: alert.view.centerXAnchor),
              activityIndicator.centerYAnchor.constraint(equalTo: alert.view.centerYAnchor)
          ])
          present(alert, animated: true)
      }
}
