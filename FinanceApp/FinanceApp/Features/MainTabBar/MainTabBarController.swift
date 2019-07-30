//
//  MainTabBarController.swift
//  FinanceApp
//
//  Created by David Penagos on 6/12/19.
//  Copyright © 2019 BlacKow. All rights reserved.
//

import Foundation
import UIKit

class MainTabBarController: UITabBarController {
    
    //MARK: - Properties
    private let tabBarElements: [TabBarModel]
    
    //MARK: - Init
    init(tabBarElements: [TabBarModel]) {
        self.tabBarElements = tabBarElements
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func setupTabBar() {
        tabBar.isTranslucent = false
        
        adjustSelectedItem(tabBar.items?.first)
        configureTabBarItems()
        self.delegate = self
    }
}

// MARK: - Delegate UITabBarControllerDelegate
extension MainTabBarController: UITabBarControllerDelegate {
    override func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
        adjustSelectedItem(item)
    }
    
    func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController) {
        if let vc = viewController as? UINavigationController {
            vc.popToRootViewController(animated: true)
        }
    }
}

// MARK: - Private functions
private extension MainTabBarController {
    
    func configureTabBarItems() {
        if tabBarElements != nil {
            var itemsToRemove = [Int]()
            if let controllers = viewControllers {
                for (index, viewController) in controllers.enumerated() {
                    if index < tabBarElements.count {
                        let tabBarItem = tabBarElements[index]
                        viewController.tabBarItem.image = tabBarItem.icon
                        viewController.tabBarItem.selectedImage = tabBarItem.iconSelected
                        viewController.tabBarItem.titlePositionAdjustment = UIOffset(horizontal: 0, vertical: -2)
                        viewController.tabBarItem.setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor.white], for: .normal)
                    } else {
                        itemsToRemove.append(index)
                    }
                }
            }
            for index in itemsToRemove.reversed() {
                viewControllers?.remove(at: index)
            }
        }
    }
    
    func adjustSelectedItem(_ selectedItem: UITabBarItem?) {
        if let controllers = viewControllers {
            for (index, viewController) in controllers.enumerated() {
                if viewController.tabBarItem == selectedItem {
                    viewController.tabBarItem.imageInsets = UIEdgeInsets(top: 6, left: 0, bottom: -6, right: 0)
                    viewController.tabBarItem.title = String()
                } else {
                    viewController.tabBarItem.imageInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
                    viewController.tabBarItem.title = tabBarElements[index].title
                }
            }
        }
    }
}
