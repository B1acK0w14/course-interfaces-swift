//
//  LoginViewController.swift
//  FinanceApp
//
//  Created by David Penagos on 7/30/19.
//  Copyright © 2019 BlacKow. All rights reserved.
//

import Foundation
import UIKit
import EventBus

class LoginViewController: UIViewController, UITextFieldDelegate {
    
    //MARK: - Properties
    private lazy var loginView: LoginView = {
        let loginView = LoginView(delegate: self)
        return loginView
    }()
    
    //MARK: - Init
    init() {
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Life Cycle
    override func loadView() {
        super.loadView()
        view = loginView
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        self.loginView.setup()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
        setupNavigationController()
    }
    
    func setupNavigationController() {
        navigationController?.setNavigationBarHidden(true, animated: false)
        navigationItem.title = String()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillChangeFrameNotification, object: nil)
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    @objc func keyboardWillShow(notification: NSNotification) {
        if self.view.frame.origin.y == 0 {
            self.view.frame.origin.y -= 100
        }
    }
    
    @objc func keyboardWillHide(notification: NSNotification) {
        if self.view.frame.origin.y != 0 {
            self.view.frame.origin.y = 0
        }
    }
}

//MARK: - Delegate
extension LoginViewController: LoginViewDelegate {
    
    func didLogin(username: String, psw: String) {
        let event = LoginEvents.didLogin(username, psw)
        EventBus.shared.emit(event: event)
    }
}
