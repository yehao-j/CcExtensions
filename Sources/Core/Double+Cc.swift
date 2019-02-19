//
//  DoubleExtension.swift
//  JSExtensions
//
//  Created by jesse on 2017/10/18.
//

import Foundation

//MARK: - Math Properties
extension Double {
    public var abs: Double {
        return Swift.abs(self)
    }

    /// 向上取整
    public var ceil: Double {
        return Foundation.ceil(self)
    }

    /// 向下取整
    public var floor: Double {
        return Foundation.floor(self)
    }

    /// 四舍五入
    public var round: Double {
        return Foundation.round(self)
    }

    public var isPositive: Bool {
        return self > 0
    }

    public var isNegative: Bool {
        return self < 0
    }
}

//MARK: - Methods
extension Double {
    /// 返回小数点后几位
    public func decimalPoint(_ point: Int) -> String {
        return String(format: "%.\(point)f", self)
    }
}

//MARK: - Change Number Type Properties
extension Double {
    public var int: Int {
        return Int(self)
    }

    public var float: Float {
        return Float(self)
    }

    public var cgFloat: CGFloat {
        return CGFloat(self)
    }

    public var string: String {
        return String(self)
    }
}
