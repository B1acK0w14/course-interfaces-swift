//
//  TabBarCoordinator.swift
//  FinanceApp
//
//  Created by David Penagos on 7/29/19.
//  Copyright © 2019 BlacKow. All rights reserved.
//

import UIKit
import EventBus

enum TabBarEvents: Event {
    case changeToTransactions
}

class TabBarCoordinator: Listener<TabBarEvents> {
    
    //MARK: - Properties
    weak var rootViewController: UIViewController?
    private var mainTabBar: MainTabBarController
    var homeCoordinator: HomeCoordinator?
    
    init(rootViewController: MainTabBarController) {
        self.mainTabBar = rootViewController
        self.rootViewController = mainTabBar
        super.init()
        EventBus.shared.add(listener: self)
    }
    
    override func handle(event: TabBarEvents) {
        switch event {
        case .changeToTransactions:
            print("work!")
        default:
            break
        }
    }
}

extension TabBarCoordinator: Coordinator {
    func start(completion: @escaping () -> Void = {}) {
        
        //ANNOTATION: - Add HomeCoordinator to MainTabBar
        let navigationHomeController = UINavigationController()
        let homeCoordinator = HomeCoordinator(rootViewController: navigationHomeController)
        self.homeCoordinator = homeCoordinator
        homeCoordinator.start()
        
        mainTabBar.viewControllers = [homeCoordinator.rootViewController!]
        mainTabBar.setupTabBar()
    }
}
