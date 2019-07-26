//
//  Example1.swift
//  FinanceApp
//
//  Created by David Penagos on 6/13/19.
//  Copyright © 2019 BlacKow. All rights reserved.
//

import Foundation
import UIKit

class Example1: UIViewController {
    
    //MARK: - Properties
    
    //MARK: - Init
    init() {
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Life Cycle
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setupNavigationController()
    }
    
    func setupNavigationController() {
        navigationController?.navigationBar.barTintColor = .green
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.title = L10n.titleNavigationController
    }
}
