//
//  IntExtension.swift
//  Extension
//
//  Created by jesse on 2017/5/25.
//  Copyright © 2017年 jesse. All rights reserved.
//

import Foundation

//MARK: - Math Properties
extension Int {
    public var abs: Int {
        return Swift.abs(self)
    }

    public var isPositive: Bool {
        return self > 0
    }

    public var isNegative: Bool {
        return self < 0
    }
}

//MARK: - Change Number Type Properties
extension Int {
    public var cgFloat: CGFloat {
        return CGFloat(self)
    }
    
    public var float: Float {
        return Float(self)
    }
    
    public var double: Double {
        return Double(self)
    }
    
    public var string: String {
        return String(self)
    }
}

//MARK: - Methods
extension Int {
    /// 返回小数点后几位
    public func decimalPoint(_ point: Int) -> String {
        return String(format: "%.\(point)f", self.float)
    }
    
    /// 补零
    public func paddingZero(_ digit: Int) -> String {
        return String(format: "%0\(digit)d", self)
    }
}

//MARK: - Date
extension Int {
    public var year: DateComponents {
        return DateComponents(year: self)
    }
    
    public var years: DateComponents {
        return year
    }
    
    public var month: DateComponents {
        return DateComponents(month: self)
    }
    
    public var months: DateComponents {
        return month
    }
    
    public var week: DateComponents {
        return DateComponents(day: 7 * self)
    }
    
    public var weeks: DateComponents {
        return week
    }
    
    public var day: DateComponents {
        return DateComponents(day: self)
    }
    
    public var days: DateComponents {
        return day
    }
    
    public var hour: DateComponents {
        return DateComponents(hour: self)
    }
    
    public var hours: DateComponents {
        return hour
    }
    
    public var minute: DateComponents {
        return DateComponents(minute: self)
    }
    
    public var minutes: DateComponents {
        return minute
    }
    
    public var second: DateComponents {
        return DateComponents(second: self)
    }
    
    public var seconds: DateComponents {
        return second
    }
    
    public var nanosecond: DateComponents {
        return DateComponents(nanosecond: self)
    }
    
    public var nanoseconds: DateComponents {
        return nanosecond
    }
}
