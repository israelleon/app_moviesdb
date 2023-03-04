//
//  UIView+Keyboard.swift
//  moviesdb
//
//  Created by Israel Alejandro Dzul León on 03/03/23.
//

import UIKit

extension UITableView {
    
    func observeKeyboard() {
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow(_:)), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide(_:)), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    func tapCloseKeyboard() {
        let tapGesture = UITapGestureRecognizer(target: self, action:#selector( didTapView(_:)))
        self.addGestureRecognizer(tapGesture)
    }
    
    @objc private func keyboardWillShow(_ notification: Notification) {
        if let keyboardSize = notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? CGRect {
            self.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: keyboardSize.height, right: 0)
            if let indexPath = indexPathsForVisibleRows?.last {
                self.scrollToRow(at: indexPath, at: .bottom, animated: true)
                self.scrollIndicatorInsets = self.contentInset
            }
        }
    }
    
    @objc private func keyboardWillHide(_ notification: Notification) {
        if let _ = notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? CGRect {
            self.contentInset = .zero
            self.scrollIndicatorInsets = .zero
        }
    }
    
    @objc private func didTapView(_ sender: UITapGestureRecognizer) {
        self.superview?.endEditing(true)
    }
}
