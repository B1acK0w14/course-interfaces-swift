//
//  TargetTabBarEnum.swift
//  FinanceApp
//
//  Created by David Penagos on 7/29/19.
//  Copyright © 2019 BlacKow. All rights reserved.
//

import UIKit
import EventBus

typealias TabBarModel = (icon: UIImage?, iconSelected: UIImage?, title: String, target: TargetTabBarEnum)

enum TargetTabBarEnum: String, Codable {
    
    case transactions
    
    var event: Event {
        switch self {
        case .transactions:
            return TabBarEvents.changeToTransactions
        default:
            fatalError("")
        }
    }
}

