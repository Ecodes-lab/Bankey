//
//  LoginViewController.swift
//  Bankey
//
//  Created by Eco Dev System on 19/05/2023.
//

import UIKit

class LoginViewController: UIViewController {
    
    
    let logoLabel = UILabel()
    let descLabel = UILabel()
    let loginView = LoginView()
    let signInButton = UIButton(type: .system)
    let errorMessageLabel = UILabel()
    
    var username: String? {
        return loginView.usernameTextField.text
    }
    
    var password: String? {
        return loginView.passwordTextField.text
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        style()
        layout()
    }
}

extension LoginViewController {
    private func style() {
        
        logoLabel.translatesAutoresizingMaskIntoConstraints = false
        logoLabel.textAlignment = .center
        logoLabel.textColor = .label
        logoLabel.text = "Bankey"
        logoLabel.numberOfLines = 0
        logoLabel.font = UIFont.boldSystemFont(ofSize: 30)
        
        descLabel.translatesAutoresizingMaskIntoConstraints = false
        descLabel.textAlignment = .center
        descLabel.textColor = .label
        descLabel.text = "Your premium source for all things banking!"
        descLabel.numberOfLines = 2
        descLabel.font = UIFont.systemFont(ofSize: 17, weight: .medium)
        
        loginView.translatesAutoresizingMaskIntoConstraints = false
        
        signInButton.translatesAutoresizingMaskIntoConstraints = false
        signInButton.configuration = .filled()
        signInButton.configuration?.imagePadding = 8
        signInButton.setTitle("Sign In", for: [])
        signInButton.addTarget(self, action: #selector(signInTapped), for: .primaryActionTriggered)
        
        errorMessageLabel.translatesAutoresizingMaskIntoConstraints = false
        errorMessageLabel.textAlignment = .center
        errorMessageLabel.textColor = .systemRed
        errorMessageLabel.numberOfLines = 0
        errorMessageLabel.isHidden = true
    }
    
    private func layout() {
        view.addSubview(logoLabel)
        view.addSubview(descLabel)
        view.addSubview(loginView)
        view.addSubview(signInButton)
        view.addSubview(errorMessageLabel)
        
        // LogoLabel and DesciptioLabel
        NSLayoutConstraint.activate([
            descLabel.topAnchor.constraint(equalToSystemSpacingBelow: logoLabel.bottomAnchor, multiplier: 3),
            logoLabel.leadingAnchor.constraint(equalToSystemSpacingAfter: view.leadingAnchor, multiplier: 1),
            loginView.trailingAnchor.constraint(equalToSystemSpacingAfter: logoLabel.trailingAnchor, multiplier: 1),
            loginView.topAnchor.constraint(equalToSystemSpacingBelow: descLabel.topAnchor, multiplier: 8),
            descLabel.leadingAnchor.constraint(equalToSystemSpacingAfter: loginView.leadingAnchor, multiplier: 3),
            loginView.trailingAnchor.constraint(equalToSystemSpacingAfter: descLabel.trailingAnchor, multiplier: 3)
        ])
        
        // LoginView
        NSLayoutConstraint.activate([
            loginView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            loginView.leadingAnchor.constraint(equalToSystemSpacingAfter: view.leadingAnchor, multiplier: 1),
            view.trailingAnchor.constraint(equalToSystemSpacingAfter: loginView.trailingAnchor, multiplier: 1)
        ])
        
        // Button
        NSLayoutConstraint.activate([
            signInButton.topAnchor.constraint(equalToSystemSpacingBelow: loginView.bottomAnchor, multiplier: 2),
            signInButton.leadingAnchor.constraint(equalTo: loginView.leadingAnchor),
            signInButton.trailingAnchor.constraint(equalTo: loginView.trailingAnchor)
        ])
        
        // ErrorMessageLabel
        NSLayoutConstraint.activate([
            errorMessageLabel.topAnchor.constraint(equalToSystemSpacingBelow: signInButton.bottomAnchor, multiplier: 2),
            errorMessageLabel.leadingAnchor.constraint(equalTo: loginView.leadingAnchor),
            errorMessageLabel.trailingAnchor.constraint(equalTo: loginView.trailingAnchor)
        ])
    }
}

extension LoginViewController {
    @objc func signInTapped(sender: UIButton) {
        errorMessageLabel.isHidden = true
        login()
    }
    
    private func login() {
        guard let username = username, let password = password else {
            assertionFailure("Username / password should never be nil")
            return
        }
        
        if username.isEmpty || password.isEmpty {
            configureView(withMessage: "Username / password cannot be blank")
            return
        }
        
        if username == "Kevin" && password == "Welcome" {
            signInButton.configuration?.showsActivityIndicator = true
        } else {
            configureView(withMessage: "Incorrect username / password")
        }
    }
    
    private func configureView(withMessage message: String) {
        errorMessageLabel.isHidden = false
        errorMessageLabel.text = message
    }
}
