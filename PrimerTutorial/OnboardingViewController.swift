//
//  OnboardingViewController.swift
//  PrimerTutorial
//
//  Created by Jesus Rodriguez on 01.06.20.
//  Copyright © 2020 Jesus Rodriguez. All rights reserved.
//

import Foundation


import UIKit
import SnapKit

class OnboardingViewController: UIViewController {

    private let titleAndSubtitleStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 8
        return stackView
    }()

    private let titleLabel: PrimaryHeader = {
        let label = PrimaryHeader()
        label.textAlignment = .center
        label.text = "Mi app"
        return label
    }()

    private let subtitleLabel: PrimaryLabel = {
        let label = PrimaryLabel()
        label.numberOfLines = 0
        label.text = "Tienes que estar registrado para continuar"
        label.textAlignment = .center
        return label
    }()

    private lazy var loginButton: PrimaryButton = {
        let button = PrimaryButton(type: .system)
        button.setTitle("Login", for: .normal)
        button.addTarget(self, action: #selector(showLoginVC), for: .touchUpInside)
        return button
    }()

    private lazy var signUpButton: PrimaryButton = {
        let button = PrimaryButton(type: .system)
        button.setTitle("Registrate", for: .normal)
        button.addTarget(self, action: #selector(showSignUpVC), for: .touchUpInside)
        return button
    }()

    private let stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 8
        return stackView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupStyling()
        setupLoginOrSignUp()
    }

    private func setupStyling() {
        view.backgroundColor = Colors.backgroundColor
    }

    private func setupLoginOrSignUp() {
        view.addSubview(titleAndSubtitleStackView)
        titleAndSubtitleStackView.snp.makeConstraints { make in
            make.center.equalToSuperview()
            make.width.equalToSuperview().inset(16)
        }
        titleAndSubtitleStackView.addArrangedSubview(titleLabel)
        titleAndSubtitleStackView.addArrangedSubview(subtitleLabel)

        view.addSubview(stackView)
        stackView.snp.makeConstraints { make in
            make.bottom.left.right.equalToSuperview().inset(16)
        }
        stackView.addArrangedSubview(loginButton)
        stackView.addArrangedSubview(signUpButton)
    }

    @objc private func showLoginVC() {
//        let navigationController = UINavigationController(rootViewController: LoginViewcontroller())
//        present(navigationController, animated: true, completion: nil)
    }

    @objc private func showSignUpVC() {
        let navigationController = UINavigationController(rootViewController: SignUpViewController())
        present(navigationController, animated: true, completion: nil)
    }
}
