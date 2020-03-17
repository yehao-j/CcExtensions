//
//  FloatExtension.swift
//  Extension
//
//  Created by jesse on 2017/5/25.
//  Copyright © 2017年 jesse. All rights reserved.
//

import UIKit

//MARK: - Math Properties
extension Float {
    public var abs: Float {
        return Swift.abs(self)
    }

    /// 向上取整
    public var ceil: Float {
        return Foundation.ceil(self)
    }

    /// 向下取整
    public var floor: Float {
        return Foundation.floor(self)
    }

    /// 四舍五入
    public var round: Float {
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
extension Float {
    public var int: Int {
        return Int(self)
    }
    
    public var double: Double {
        return Double(self)
    }
    
    public var cgFloat: CGFloat {
        return CGFloat(self)
    }
    
    public var string: String {
        return String(self)
    }
}

//MARK: - Methods
extension Float {
    /// 返回小数点后几位
    public func decimalPoint(_ point: Int) -> String {
        return String(format: "%.\(point)f", self)
    }
}

//MARK: - Operators
extension Float {
    static public func + (lhs: Float, rhs: Int) -> Float {
        return lhs + Float(rhs)
    }
    
    static public func + (lhs: Int, rhs: Float) -> Float {
        return Float(lhs) + rhs
    }
    
    static public func - (lhs: Float, rhs: Int) -> Float {
        return lhs - Float(rhs)
    }
    
    static public func - (lhs: Int, rhs: Float) -> Float {
        return Float(lhs) - rhs
    }
    
    static public func * (lhs: Float, rhs: Int) -> Float {
        return lhs * Float(rhs)
    }
    
    static public func * (lhs: Int, rhs: Float) -> Float {
        return Float(lhs) * rhs
    }
    
    static public func / (lhs: Float, rhs: Int) -> Float {
        return lhs / Float(rhs)
    }
    
    static public func / (lhs: Int, rhs: Float) -> Float {
        return Float(lhs) / rhs
    }
}
