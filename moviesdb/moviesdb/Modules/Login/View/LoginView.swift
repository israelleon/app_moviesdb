//
//  LoginView.swift
//  moviesdb
//
//  Created by Israel Alejandro Dzul León on 03/03/23.
//

import UIKit

class LoginView: UIViewController, ViewProtocol {
    var presenter: LoginPresenterViewProtocol!
    private let uiView = LoginViewUI()
    private var object: LoginEntity?
    
    override func loadView() {
        uiView.delegate = self
        uiView.dataSource = self
        view = uiView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.start()
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.view.setVerticalGradient(topColor: .main.withAlphaComponent(0.01), bottomColor: .background)
    }
}

// MARK: Protocols

extension LoginView: LoginViewPresenterProtocol {
    // handle response of presenter.
}


extension LoginView: LoginViewUIDelegate {
   // view events.
}

extension LoginView: LoginViewUIDataSource {
    func objectFor(view: LoginViewUI) -> LoginEntity? {
        return object
    }
}
