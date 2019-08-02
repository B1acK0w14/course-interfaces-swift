//
//  UIColor.swift
//  FinanceApp
//
//  Created by David Penagos on 7/31/19.
//  Copyright © 2019 BlacKow. All rights reserved.
//

import Foundation
import UIKit

public extension UIColor {
    
    //ANNOTATION - Create an extension that recive hexadecimal colour
    
    fileprivate convenience init(red: Int, green: Int, blue: Int, alpha: CGFloat) {
        assert(red >= 0 && red <= 255, "Invalid red component")
        assert(green >= 0 && green <= 255, "Invalid green component")
        assert(blue >= 0 && blue <= 255, "Invalid blue component")
        self.init(red: CGFloat(red) / 255.0, green: CGFloat(green) / 255.0, blue: CGFloat(blue) / 255.0, alpha: alpha)
    }
    
    fileprivate convenience init(hexadecimal: Int, alpha: CGFloat) {
        self.init(red: (hexadecimal >> 16) & 0xff,
                  green: (hexadecimal >> 8) & 0xff,
                  blue: hexadecimal & 0xff,
                  alpha: alpha)
    }
    
    //MARK: - Colour's App
    
    @objc public static var lightRed: UIColor {
        return UIColor(hexadecimal: 0xFF6459, alpha: 1.0)
    }
}
