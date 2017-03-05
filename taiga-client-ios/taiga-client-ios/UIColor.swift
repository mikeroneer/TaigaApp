//
//  UIColor.swift
//  taiga-client-ios
//
//  Created by Dominik on 21.02.17.
//  Copyright © 2017 r31r0c. All rights reserved.
//

import UIKit

extension UIColor {
    static let taiga_green_grey_dark = UIColor(red:0.14, green:0.22, blue:0.18, alpha:1.0)
    static let taiga_green_gray_light = UIColor(red:0.16, green:0.25, blue:0.20, alpha:1.0)
    static let taiga_green_light = UIColor(red:0.62, green:0.81, blue:0.04, alpha:1.0)
    
    convenience init(hexString: String) {
        let hexString: String = hexString.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)
        let scanner = Scanner(string: hexString)
        
        if (hexString.hasPrefix("#")) {
            scanner.scanLocation = 1
        }
        
        var color:UInt32 = 0
        scanner.scanHexInt32(&color)
        
        let mask = 0x000000FF
        let r = Int(color >> 16) & mask
        let g = Int(color >> 8) & mask
        let b = Int(color) & mask
        
        let red   = CGFloat(r) / 255.0
        let green = CGFloat(g) / 255.0
        let blue  = CGFloat(b) / 255.0
        
        self.init(red: red, green: green, blue: blue, alpha: 1)
    }
}
