//
//  CGSize+Ex.swift
//  CandyExtension
//
//  Created by 叶浩 on 2019/1/31.
//

import UIKit

//MARK: - Static Properties
extension CGSize {
    static public var max: CGSize {
        return CGSize(width: CGFloat.max, height: CGFloat.max)
    }
}

//MARK: - Static Operators
extension CGSize {
    public static func * (lhs: CGSize, rhs: CGFloat) -> CGSize {
        return CGSize(width: lhs.width * rhs, height: lhs.height * rhs)
    }
    
    public static func * (lhs: CGFloat, rhs: CGSize) -> CGSize {
        return CGSize(width: lhs * rhs.width, height: lhs * rhs.height)
    }
    
    public static func / (lhs: CGSize, rhs: CGFloat) -> CGSize {
        return CGSize(width: lhs.width / rhs, height: lhs.height / rhs)
    }
    
    public static func / (lhs: CGFloat, rhs: CGSize) -> CGSize {
        return CGSize(width: rhs.width / lhs, height: rhs.height / lhs)
    }
    
    public static func + (lhs: CGSize, rhs: CGSize) -> CGSize {
        return CGSize(width: rhs.width + lhs.width, height: rhs.height + lhs.height)
    }
    
    public static func - (lhs: CGSize, rhs: CGSize) -> CGSize {
        return CGSize(width: lhs.width - rhs.width, height: lhs.height - rhs.height)
    }
}
