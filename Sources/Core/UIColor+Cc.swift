//
//  UIColorExtension.swift
//  Extension
//
//  Created by jesse on 2017/5/25.
//  Copyright © 2017年 jesse. All rights reserved.
//

import UIKit

// MARK: - Properties
extension UIColor {
    public var hexString: String {
        let r = rgbComponents.red
        let g = rgbComponents.green
        let b = rgbComponents.blue
        return String(format: "#%02X%02X%02X", r, g, b)
    }
    
    public var image: UIImage {
        return UIImage(color: self)
    }
}

// MARK: - Satic Properties
extension UIColor {
    public static var random: UIColor {
        let r = CGFloat(Double(arc4random() % 255) / 255.0)
        let g = CGFloat(Double(arc4random() % 255) / 255.0)
        let b = CGFloat(Double(arc4random() % 255) / 255.0)
        return UIColor(red: r, green: g, blue: b, alpha: 1)
    }
}

// MARK: - Methods
extension UIColor {
    public convenience init(hex: Int, transparency: CGFloat = 1) {
        self.init(red: (hex >> 16) & 0xff, green: (hex >> 8) & 0xff, blue: hex & 0xff, transparency: transparency)
    }
    
    public convenience init(hexString: String, transparency: CGFloat = 1) {
        var string = ""
        if hexString.lowercased().hasPrefix("0x") {
            string =  hexString.replacingOccurrences(of: "0x", with: "")
        } else if hexString.hasPrefix("#") {
            string = hexString.replacingOccurrences(of: "#", with: "")
        } else {
            string = hexString
        }
        
        if string.count == 3 {
            var str = ""
            string.forEach { str.append(String($0) + String($0)) }
            string = str
        }
        
        self.init(hex: Int(string, radix: 16)!, transparency: transparency)
    }
    
    public convenience init(red: Int, green: Int, blue: Int, transparency: CGFloat = 1) {
        self.init(red: CGFloat(red) / 255.0, green: CGFloat(green) / 255.0, blue: CGFloat(blue) / 255.0, alpha: transparency)
    }

    public var rgbComponents: (red: Int, green: Int, blue: Int) {
        var components: [CGFloat] {
            let c = cgColor.components!
            if c.count == 4 {
                return c
            }
            return [c[0], c[0], c[0], c[1]]
        }
        let r = components[0]
        let g = components[1]
        let b = components[2]
        return (red: Int(r * 255.0), green: Int(g * 255.0), blue: Int(b * 255.0))
    }
}
