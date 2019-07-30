//
//  HomeCoordinator.swift
//  FinanceApp
//
//  Created by David Penagos on 7/29/19.
//  Copyright © 2019 BlacKow. All rights reserved.
//

import UIKit
import EventBus

enum HomeEvents: Event {
    
}

class HomeCoordinator: Listener<HomeEvents> {
    weak var rootViewController: UIViewController?
    private let navigationController: UINavigationController
    
    init(rootViewController: UINavigationController) {
        self.navigationController = rootViewController
        self.rootViewController = navigationController
        super.init()
        EventBus.shared.add(listener: self)
    }
    
    override func handle(event: HomeEvents) {
        switch event {
        default:
            break
        }
    }
}

extension HomeCoordinator: Coordinator {
    func start(completion: @escaping () -> Void = {}) {
        //ANNOTATION: - Add HomeCoordinator to MainTabBar
        let transactionViewController = TransactionViewController()
        navigationController.pushViewController(transactionViewController, animated: true)
    }
}
