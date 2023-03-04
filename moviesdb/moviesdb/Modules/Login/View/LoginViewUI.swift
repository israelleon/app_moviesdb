//
//  LoginView_UI.swift
//  moviesdb
//
//  Created by Israel Alejandro Dzul León on 03/03/23.
//

import UIKit

protocol LoginViewUIDelegate: AnyObject {
    
}

protocol LoginViewUIDataSource: AnyObject {
    func objectFor(view: LoginViewUI ) -> LoginEntity?
}

// UI view.

class LoginViewUI: UIView {
    
    weak var delegate: LoginViewUIDelegate?
    weak var dataSource: LoginViewUIDataSource?
    private var object: LoginEntity?
   
    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.backgroundColor = .clear
        tableView.register(LoginFormCell.self, forCellReuseIdentifier: LoginFormCell.reuseIdentifier)
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
        addSubview(tableView)
    }
    
    private func setupContraints() {
       // add constraints to subviews.
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: topAnchor),
            tableView.leadingAnchor.constraint(equalTo: leadingAnchor),
            tableView.rightAnchor.constraint(equalTo: rightAnchor),
            tableView.bottomAnchor.constraint(equalTo: bottomAnchor),
        ])
    }
    
    func realodData() {
        // realod the data and update the ui according to the new data.
        // should update ui.
        self.object = dataSource?.objectFor(view: self)
    }
}


extension LoginViewUI: UITableViewDelegate {
    
}

extension LoginViewUI: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int { 1 }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: LoginFormCell.reuseIdentifier, for: indexPath) as? LoginFormCell else {
            return UITableViewCell()
        }
        cell.configure(object: nil)
        return cell
    }
}
