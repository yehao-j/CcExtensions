//
//  CGFloat.swift
//  Pods
//
//  Created by jesse on 2017/7/15.
//
//

import Foundation

//MARK: - Math Properties
extension CGFloat {
    public var abs: CGFloat {
        return Swift.abs(self)
    }

    /// 向上取整
    public var ceil: CGFloat {
        return Foundation.ceil(self)
    }

    /// 向下取整
    public var floor: CGFloat {
        return Foundation.floor(self)
    }

    /// 四舍五入
    public var round: CGFloat {
        return Foundation.round(self)
    }

    public var isPositive: Bool {
        return self > 0
    }

    public var isNegative: Bool {
        return self < 0
    }
}

//MARK: - Change Number Type Properties
extension CGFloat {
    public var int: Int {
        return Int(self)
    }

    public var float: Float {
        return Float(self)
    }

    public var double: Double {
        return Double(self)
    }

    public var string: String {
        return String(describing: self)
    }
}

//MARK: - Methods
extension CGFloat {
    /// 返回小数点后几位
    public func decimalPoint(_ point: Int) -> String {
        return String(format: "%.\(point)f", self)
    }
}

//MARK: - Static Properties
extension CGFloat {
    static public var max: CGFloat {
        return CGFloat.greatestFiniteMagnitude
    }
    
    static public var min: CGFloat {
        return CGFloat.leastNormalMagnitude
    }
}

//MARK: - Static Methods
extension CGFloat {
    public static func randomBetween(min: CGFloat, max: CGFloat) -> CGFloat {
        let delta = max - min
        return min + CGFloat(arc4random_uniform(UInt32(delta)))
    }
}

//MARK: - Operators
extension CGFloat {
    static public func + (lhs: CGFloat, rhs: Int) -> CGFloat {
        return lhs + CGFloat(rhs)
    }
    
    static public func + (lhs: Int, rhs: CGFloat) -> CGFloat {
        return CGFloat(lhs) + rhs
    }
    
    static public func - (lhs: CGFloat, rhs: Int) -> CGFloat {
        return lhs - CGFloat(rhs)
    }
    
    static public func - (lhs: Int, rhs: CGFloat) -> CGFloat {
        return CGFloat(lhs) - rhs
    }
    
    static public func * (lhs: CGFloat, rhs: Int) -> CGFloat {
        return lhs * CGFloat(rhs)
    }
    
    static public func * (lhs: Int, rhs: CGFloat) -> CGFloat {
        return CGFloat(lhs) * rhs
    }
    
    static public func / (lhs: CGFloat, rhs: Int) -> CGFloat {
        return lhs / CGFloat(rhs)
    }
    
    static public func / (lhs: Int, rhs: CGFloat) -> CGFloat {
        return CGFloat(lhs) / rhs
    }
    
    static public func += (lhs: inout CGFloat, rhs: Int) {
        lhs = lhs + CGFloat(rhs)
    }
    
    static public func *= (lhs: inout CGFloat, rhs: Int) {
        lhs = lhs * CGFloat(rhs)
    }
    
    static public func -= (lhs: inout CGFloat, rhs: Int) {
        lhs = lhs - CGFloat(rhs)
    }
    
    static public func /= (lhs: inout CGFloat, rhs: Int) {
        lhs = lhs / CGFloat(rhs)
    }
}

