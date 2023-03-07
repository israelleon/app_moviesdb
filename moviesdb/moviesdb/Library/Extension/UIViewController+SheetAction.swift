//
//  UIViewController+SheetAction.swift
//  moviesdb
//
//  Created by Israel Alejandro Dzul León on 05/03/23.
//

import UIKit

typealias ActionSheetHandler = (_ id: String) -> Void


enum ActionSheetType {
    case destructive(title: String, id: String)
    case normal(title: String, id: String)
    case cancel(title: String, id: String)
    
    var style: UIAlertAction.Style {
        switch self {
        case .destructive: return .destructive
        case .normal: return .default
        case .cancel: return .cancel
        }
    }
    
    var title: String {
        switch self {
        case .destructive(title: let title, id: _): return title
        case .normal(title: let title, id: _): return title
        case .cancel(title: let title, id: _): return title
        }
    }
    
    var id: String {
        switch self {
        case .destructive(title: _, id: let id): return id
        case .normal(title: _, id: let id): return id
        case .cancel(title: _, id: let id): return id
        }
    }
}

extension UIViewController {
    func presentActionSheet(title: String? = nil, message: String? = nil, actions: [ActionSheetType], handler: @escaping ActionSheetHandler)  {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .actionSheet)
        actions.forEach {
            let id = $0.id
            alertController.addAction(
                UIAlertAction(title: $0.title, style: $0.style) { _ in handler(id) }
            )
        }
        DispatchQueue.main.async { [weak self] in
            self?.present(alertController, animated: true)
        }
    }
}
