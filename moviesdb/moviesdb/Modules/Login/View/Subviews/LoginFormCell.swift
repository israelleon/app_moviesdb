//
//  LoginFormCell.swift
//  moviesdb
//
//  Created by Israel Alejandro Dzul León on 03/03/23.
//

import UIKit

fileprivate struct LoginFormConstants {
    static var stackViewfEdgeInset = UIEdgeInsets(top: 200, left: 36, bottom: -8, right: -36)
    static var stackViewSpacing: CGFloat = 24
    
    static var bannerHeight: CGFloat = 100
    static var bannerImage: UIImage? = .logo
    
    static var usernameHeight: CGFloat = 44
    static var usernamePlaceholder = "login.placeholder.username".localized
    
    static var passwordHeight: CGFloat = 44
    static var passwordPlaceholder = "login.placeholder.password".localized
    
    static var buttonHeight: CGFloat = 44
    static var buttonTitle = "login.btn.title".localized
    static var cornerRadius: CGFloat = 4
    
    static var errorNumberOfLine: Int = 0
    static var errorEdgeInset = UIEdgeInsets(top: 16, left: 16, bottom: -8, right: -16)
}

protocol LoginFormDelegate: AnyObject {
    func didPressedLoginButton(username: String, password: String)
}

class LoginFormCell: UITableViewCell, ReusableView {
    
    weak var delegate: LoginFormDelegate?
    private var object: LoginEntity? {
        didSet {
            setupUI()
            setupConstraints()
        }
    }
    
    private lazy var usernameTextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.placeholder = LoginFormConstants.usernamePlaceholder
        textField.borderStyle = .roundedRect
        textField.delegate = self
        textField.keyboardType = .emailAddress
        textField.autocorrectionType = .no
        textField.autocapitalizationType = .none
        return textField
    }()
    
    private lazy var passwordTextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.placeholder = LoginFormConstants.passwordPlaceholder
        textField.borderStyle = .roundedRect
        textField.delegate = self
        textField.keyboardType = .default
        textField.isSecureTextEntry = true
        textField.autocorrectionType = .no
        textField.autocapitalizationType = .none
        return textField
    }()
    
    private lazy var loginButton: UIButton = {
        // TODO: complete logic enable disable.
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle(LoginFormConstants.buttonTitle, for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .buttonActive
        button.addTarget(self, action: #selector(didPressedLoginButton(_:)), for: .touchUpInside)
        return button
    }()
    
    private lazy var errorLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .red
        label.numberOfLines = LoginFormConstants.errorNumberOfLine
        label.textAlignment = .center
        return label
    }()
    
    private lazy var containerStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.alignment = .fill
        stackView.spacing = LoginFormConstants.stackViewSpacing
        return stackView
    }()
    
    private lazy var bannerImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        imageView.image = LoginFormConstants.bannerImage
        return imageView
    }()
    
    func configure(object: LoginEntity?) {
        self.object = object
        usernameTextField.text = object?.username
        errorLabel.text = object?.error
    }
    
    private func setupUI() {
        contentView.subviews.forEach({$0.removeFromSuperview()})
        containerStackView.addArrangedSubview(bannerImageView)
        containerStackView.addArrangedSubview(usernameTextField)
        containerStackView.addArrangedSubview(passwordTextField)
        containerStackView.addArrangedSubview(loginButton)
        contentView.addSubview(containerStackView)
        contentView.addSubview(errorLabel)
        backgroundColor = .clear
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            containerStackView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: LoginFormConstants.stackViewfEdgeInset.top),
            containerStackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: LoginFormConstants.stackViewfEdgeInset.left),
            containerStackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: LoginFormConstants.stackViewfEdgeInset.right),
            errorLabel.topAnchor.constraint(equalTo: containerStackView.bottomAnchor, constant: LoginFormConstants.errorEdgeInset.top),
            errorLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: LoginFormConstants.errorEdgeInset.left),
            errorLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: LoginFormConstants.errorEdgeInset.right),
            errorLabel.bottomAnchor.constraint(lessThanOrEqualTo: contentView.bottomAnchor, constant: LoginFormConstants.errorEdgeInset.bottom),
            bannerImageView.heightAnchor.constraint(equalToConstant: LoginFormConstants.bannerHeight),
            usernameTextField.heightAnchor.constraint(equalToConstant: LoginFormConstants.usernameHeight),
            passwordTextField.heightAnchor.constraint(equalToConstant: LoginFormConstants.passwordHeight),
            loginButton.heightAnchor.constraint(equalToConstant: LoginFormConstants.buttonHeight),
        ])
    }
    
    @objc func didPressedLoginButton(_ sender: UIButton) {
        contentView.endEditing(true)
        delegate?.didPressedLoginButton(
            username: usernameTextField.text ?? "",
            password: passwordTextField.text ?? ""
        )
    }
}


extension LoginFormCell: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        switch textField {
        case usernameTextField:
            passwordTextField.becomeFirstResponder()
        case passwordTextField:
            passwordTextField.resignFirstResponder()
        default: break
        }
        return true
    }
    
}

