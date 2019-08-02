//
//  LoginViewDelegate.swift
//  FinanceApp
//
//  Created by David Penagos on 8/1/19.
//  Copyright © 2019 BlacKow. All rights reserved.
//

import Foundation

protocol LoginViewDelegate: AnyObject {
    func didLogin(username: String, psw: String)
}
