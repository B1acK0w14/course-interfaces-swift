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
    
    //MARK: - Init
    init() {
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        let firstViewController = Example1()
        
        firstViewController.tabBarItem = UITabBarItem(tabBarSystemItem: .search, tag: 0)
        
        let secondViewController = Example1()
        
        secondViewController.tabBarItem = UITabBarItem(tabBarSystemItem: .more, tag: 1)
        
        let thirdViewController = Example1()
        
        thirdViewController.tabBarItem = UITabBarItem(tabBarSystemItem: .more, tag: 1)
        
        let fourViewController = Example1()
        
        fourViewController.tabBarItem = UITabBarItem(tabBarSystemItem: .more, tag: 1)
        
        let fiveViewController = Example1()
        
        fiveViewController.tabBarItem = UITabBarItem(tabBarSystemItem: .more, tag: 1)
        
        let tabBarList = [firstViewController, secondViewController, thirdViewController, fourViewController, fiveViewController]
        
        viewControllers = tabBarList
    }
}
