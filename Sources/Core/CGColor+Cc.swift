//
//  CGColorExtension.swift
//  Extension
//
//  Created by jesse on 2017/5/25.
//  Copyright © 2017年 jesse. All rights reserved.
//

//MARK: - Properties
extension CGColor {
    public var uiColor: UIColor? {
        return UIColor(cgColor: self)
    }
}


