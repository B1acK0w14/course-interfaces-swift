//
//  LoginView.swift
//  FinanceApp
//
//  Created by David Penagos on 7/30/19.
//  Copyright © 2019 BlacKow. All rights reserved.
//

import Foundation
import UIKit

class LoginView: UIView {
    
    //MARK: - Properties
    private lazy var viewContainer: UIView = {
        let view = UIView()
        return view
    }()
    
    private lazy var userNameTextField: UITextField = {
        let textField = UITextField()
        textField.font = UIFont(name: "Helvetica", size: 16)
        textField.layer.cornerRadius = 4.0
        textField.layer.borderWidth = 0.5
        textField.layer.borderColor = UIColor.gray.cgColor
        textField.textAlignment = .center
        textField.addDoneButtonOnKeyboard()
        return textField
    }()
    
    private lazy var pswTextField: UITextField = {
        let textField = UITextField()
        textField.font = UIFont(name: "Helvetica", size: 16)
        textField.layer.cornerRadius = 4.0
        textField.layer.borderWidth = 0.5
        textField.layer.borderColor = UIColor.gray.cgColor
        textField.textAlignment = .center
        textField.isSecureTextEntry = true
        textField.addDoneButtonOnKeyboard()
        return textField
    }()
    
    private lazy var forgotPswLabel: UILabel = {
        let label = UILabel()
        label.isUserInteractionEnabled = true
        label.font = UIFont(name: "Helvetica-Light", size: 16)
        label.attributedText = NSAttributedString(string: L10n.Login.forgotPsw,
                                                  attributes: [.underlineStyle: NSUnderlineStyle.single.rawValue])
        label.textColor = .lightRed
        let gesture = UITapGestureRecognizer(target: self, action: #selector(didTapForgotUser))
        label.addGestureRecognizer(gesture)
        return label
    }()
    
    private lazy var loginButton: UIButton = {
        let button = UIButton()
        button.layer.cornerRadius = 4.0
        button.layer.borderWidth = 0.5
        button.layer.borderColor = UIColor.gray.cgColor
        button.setTitleColor(.black, for: .normal)
        button.addTarget(self, action: #selector(didLogin), for: .touchUpInside)
        return button
    }()
    
    private weak var delegate: LoginViewDelegate?
    
    //MARK: - Init
    init(delegate: LoginViewDelegate) {
        self.delegate = delegate
        super.init(frame: .zero)
        setupViewConfiguration()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Setup
    func setup() {
        userNameTextField.placeholder = L10n.Login.userName
        pswTextField.placeholder = L10n.Login.psw
        loginButton.setTitle("Login", for: .normal)
    }
    
    //MARK: - Functions
    @objc func didTapForgotUser() {
        print("WORK!")
    }
    
    @objc func didLogin() {
        guard let userName = userNameTextField.text, let psw = pswTextField.text else {return}
        self.delegate?.didLogin(username: userName, psw: psw)
    }
}

extension LoginView: ViewConfiguration {
    
    func configureViews() {
        backgroundColor = .white
    }
    
    func buildViewHierarchy() {
        self.addSubview(viewContainer)
        viewContainer.addSubview(userNameTextField)
        viewContainer.addSubview(pswTextField)
        viewContainer.addSubview(forgotPswLabel)
        viewContainer.addSubview(loginButton)
    }
    
    func setupConstraints() {
        
        viewContainer.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
        }
        
        userNameTextField.snp.makeConstraints { (make) in
            make.height.equalTo(32)
            make.topMargin.equalToSuperview().offset(188)
            make.leading.equalToSuperview().offset(32)
            make.trailing.equalToSuperview().offset(-32)
        }
        
        pswTextField.snp.makeConstraints { (make) in
            make.height.equalTo(32)
            make.top.equalTo(userNameTextField.snp.bottom).offset(16)
            make.leading.equalToSuperview().offset(32)
            make.trailing.equalToSuperview().offset(-32)
        }
        
        forgotPswLabel.snp.makeConstraints { (make) in
            make.height.equalTo(16)
            make.top.equalTo(pswTextField.snp.bottom).offset(16)
            make.leading.equalToSuperview().offset(95)
            make.trailing.equalToSuperview().offset(-95)
        }
        
        loginButton.snp.makeConstraints { (make) in
            make.height.equalTo(40)
            make.top.equalTo(forgotPswLabel.snp.bottom).offset(32)
            make.leading.equalToSuperview().offset(32)
            make.trailing.equalToSuperview().offset(-32)
        }
    }
}
