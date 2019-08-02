//
//  LoginCoordinator.swift
//  FinanceApp
//
//  Created by David Penagos on 7/30/19.
//  Copyright © 2019 BlacKow. All rights reserved.
//

import Foundation
import EventBus

enum LoginEvents: Event {
    case didLogin(String, String)
}

class LoginCoordinator: Listener<LoginEvents> {
    
    //MARK: - Properties
    weak var rootViewController: UIViewController?
    private let navigationController: UINavigationController
    
    //MARK: - Init
    init(rootViewController: UINavigationController) {
        self.navigationController = rootViewController
        self.rootViewController = navigationController
        super.init()
        EventBus.shared.add(listener: self)
    }
    
    override func handle(event: LoginEvents) {
        switch event {
        case let .didLogin(userName, psw):
            if (userName == "1" && psw == "1") {
                let event = RouterEvents.goToHome
                EventBus.shared.emit(event: event)
            }
        }
    }
}

// MARK: - Protocol Coordinator
extension LoginCoordinator: Coordinator {
    func start(completion: @escaping () -> Void = {}) {
        let loginViewController = LoginViewController()
        navigationController.pushViewController(loginViewController, animated: true)
    }
}
