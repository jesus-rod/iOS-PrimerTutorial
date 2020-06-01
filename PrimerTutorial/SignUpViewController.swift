//
//  SignUpViewController.swift
//  PrimerTutorial
//
//  Created by Jesus Rodriguez on 01.06.20.
//  Copyright © 2020 Jesus Rodriguez. All rights reserved.
//

import UIKit

class SignUpViewController: UIViewController {

    private lazy var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 8
        return stackView
    }()

    private let nameLabel: PrimaryLabel = {
        let label = PrimaryLabel()
        label.text = "Nombre"
        return label
    }()
    private let nameTextField: UITextField = {
        let tf = UITextField()
        tf.autocapitalizationType = .none
        tf.placeholder = "Nombre"
        tf.backgroundColor = UIColor(white: 0, alpha: 0.03)
        tf.borderStyle = .roundedRect
        tf.font = UIFont.systemFont(ofSize: 14)
        return tf
    }()
    private let emailLabel: PrimaryLabel = {
        let label = PrimaryLabel()
        label.text = "Correo electronico"
        return label
    }()
    private let emailTextField: UITextField = {
        let tf = UITextField()
        tf.autocapitalizationType = .none
        tf.placeholder = "Correo electronico"
        tf.backgroundColor = UIColor(white: 0, alpha: 0.03)
        tf.borderStyle = .roundedRect
        tf.font = UIFont.systemFont(ofSize: 14)
        return tf
    }()

    private let passwordLabel: PrimaryLabel = {
        let label = PrimaryLabel()
        label.text = "Contraseña"
        return label
    }()

    private let passwordTextField: UITextField = {
        let tf = UITextField()
        tf.placeholder = "Contraseña"
        tf.isSecureTextEntry = true
        tf.backgroundColor = UIColor(white: 0, alpha: 0.03)
        tf.font = .systemFont(ofSize: 14)
        tf.borderStyle = .roundedRect
        return tf
    }()

    private lazy var signUpButton: PrimaryButton = {
        let button = PrimaryButton(type: .system)
        button.setTitle("Registro", for: .normal)
        button.addTarget(self, action: #selector(handleSignUp), for: .touchUpInside)
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupBackButton()
        setup()
        setupStyling()
    }


    private func setupBackButton() {
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Back", style: .plain, target: self, action: #selector(handleBack))
    }

    @objc private func handleBack() {
        navigationController?.dismiss(animated: true, completion: nil)
    }

    private func setupStyling() {
        navigationItem.title = "Registro"
        view.backgroundColor = Colors.secondaryBackgroundColor
    }

    private func setup() {
        stackView.addArrangedSubview(nameLabel)
        stackView.addArrangedSubview(nameTextField)
        stackView.addArrangedSubview(emailLabel)
        stackView.addArrangedSubview(emailTextField)
        stackView.addArrangedSubview(passwordLabel)
        stackView.addArrangedSubview(passwordTextField)

        view.addSubview(stackView)
        stackView.snp.makeConstraints { make in
            make.center.equalToSuperview()
            make.width.equalToSuperview().inset(32)
        }

        view.addSubview(signUpButton)
        signUpButton.snp.makeConstraints { make in
            make.leading.trailing.bottom.equalToSuperview().inset(16)
        }

    }

    @objc private func handleSignUp() {
        print("Do the sign up")
    }


}
