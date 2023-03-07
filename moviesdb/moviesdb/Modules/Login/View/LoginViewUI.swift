//
//  LoginView_UI.swift
//  moviesdb
//
//  Created by Israel Alejandro Dzul León on 03/03/23.
//

import UIKit

protocol LoginViewUIDelegate: AnyObject {
    func didChangeFormValue(username: String, password: String)
}

protocol LoginViewUIDataSource: AnyObject {
    func objectFor(view: LoginViewUI ) -> LoginEntity?
}

// UI view.

class LoginViewUI: UIView {
    
    weak var delegate: LoginViewUIDelegate?
    weak var dataSource: LoginViewUIDataSource?
    private var object: LoginEntity? {
        didSet {
            DispatchQueue.main.async { [weak tableView] in
                tableView?.reloadData()
            }
        }
    }
   
    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.backgroundColor = .clear
        tableView.registerCell(LoginFormCell.self)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.allowsSelection = false
        tableView.observeKeyboard()
        tableView.tapCloseKeyboard()
        return tableView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("LoginViewUI.\(#function) coder exception")
    }
    
    override func didMoveToWindow() {
        super.didMoveToWindow()
        setupContraints()
    }
    
    private func setupUI() {
        subviews.forEach{ $0.removeFromSuperview() }
        addSubview(tableView)
    }
    
    private func setupContraints() {
        tableView.fitTo(self)
    }
    
    func realodData() {
        object = dataSource?.objectFor(view: self)
    }
}


extension LoginViewUI: UITableViewDelegate {
    
}

extension LoginViewUI: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int { 1 }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: LoginFormCell = tableView.dequeueCell(at: indexPath)
        cell.configure(object: object)
        cell.delegate = self
        return cell
    }
}

extension LoginViewUI: LoginFormDelegate {
    func didPressedLoginButton(username: String, password: String) {
        delegate?.didChangeFormValue(username: username, password: password)
    }
}
