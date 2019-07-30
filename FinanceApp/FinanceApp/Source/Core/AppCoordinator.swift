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
    
    private func callHome() {
        let mainTabBarController = MainTabBarController(tabBarElements: setTabBarElements())
        self.rootViewController = mainTabBarController
        self.window.rootViewController = self.rootViewController
        let tabBarCoordinator = TabBarCoordinator(rootViewController: mainTabBarController)
        tabBarCoordinator.start()
    }
    
    private func setTabBarElements() -> [TabBarModel] {
        //ANNOTATION: - Add TabBarElements with icon, title and target for each one.
        var arrayTabBarModel: [TabBarModel] = []
        let homeTabBarModel = TabBarModel(icon: nil, iconSelected: nil, title: L10n.tabbarTitleTransactions, target: .transactions)
        arrayTabBarModel.append(homeTabBarModel)
        return arrayTabBarModel
    }
}

// MARK: - Protocol Coordinator
extension AppCoordinator: Coordinator {
    func start(completion: @escaping () -> Void = {}) {
        
        callHome()
        self.window.makeKeyAndVisible()
        completion()
    }
}
