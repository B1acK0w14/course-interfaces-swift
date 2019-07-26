//
//  AppCoordinator.swift
//  FinanceApp
//
//  Created by David Penagos on 6/12/19.
//  Copyright © 2019 BlacKow. All rights reserved.
//

import Foundation
import EventBus

protocol Coordinator {
    var rootViewController: UIViewController? {get}
    func start(completion: @escaping () -> Void)
}

enum RouterEvents: Event {
    
}

class AppCoordinator: Listener<RouterEvents> {
    
    //MARK: - Properties
    private let window: UIWindow
    weak var rootViewController: UIViewController?
    
    //MARK: - Init
    init(window: UIWindow) {
        self.window = window
        super.init()
        setupAppCoordinator()
    }
    
    // MARK: - Setup functions
    private func setupAppCoordinator() {
        EventBus.shared.add(listener: self)
    }
    
    private func callLogin() {
        let nav = UINavigationController()
        self.rootViewController = nav
        self.window.rootViewController = self.rootViewController
        let mainTabBarController = MainTabBarController()
        nav.pushViewController(mainTabBarController, animated: true)
    }
}

// MARK: - Protocol Coordinator
extension AppCoordinator: Coordinator {
    func start(completion: @escaping () -> Void = {}) {
        
        callLogin()
        self.window.makeKeyAndVisible()
        completion()
    }
}
