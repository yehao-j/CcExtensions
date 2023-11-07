//
//  Calendar+Ex.swift
//  dev-kit-demo
//
//  Created by niko on 2023/11/6.
//  Copyright © 2023 gerinn. All rights reserved.
//

import UIKit

//MARK: - 农历
extension Calendar {
    /// 天干
    private var celestialStem: [String] {
        return ["甲", "乙", "丙", "丁", "戊", "己", "庚", "辛", "壬", "癸"]
    }
    
    /// 地支
    private var earthlyBranches: [String] {
        return ["子", "丑", "寅", "卯", "辰", "巳", "午", "未", "申", "酉", "戌", "亥"]
    }
    
    /// 当前年份的天干地支名称
    private var celestialStemEarthlyBranches: [String] {
        var array = [String]()
        (0..<60).forEach { i in
            let dc = i % 10
            let de = i % 12
            
            array.append(celestialStem[dc] + earthlyBranches[de])
        }
        return array
    }

    public func lunarYearName(by year: Int) -> String? {
        guard self.identifier == .chinese else {
            return nil
        }
        
        var dis = (year + 2697) % 60
        if dis < 0 {
            dis += 60
        }
        return celestialStemEarthlyBranches[dis - 1]
    }
    
    /// 获取当前年份的农历第一个天
    public func lunarFirsrDay(year: Int) -> Date? {
        guard self.identifier == .chinese else {
            return nil
        }
        
        var component = DateComponents()
        component.calendar = self
        component.era = (year + 2697) / 60
        component.year = (year + 2697) % 60
        component.month = 1
        component.day = 1
        return date(from: component)
    }
    
    /// 判断当前公历年包含的农历月 [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13]
    public func lunarMonths(by year: Int) -> [Int]? {
        guard self.identifier == .chinese else {
            return nil
        }
        
        guard let firstDay = lunarFirsrDay(year: year) else {
            return nil
        }
        
        guard let nextFirstDay = date(byAdding: .year, value: 1, to: firstDay) else {
            return nil
        }
        
        let componenet = dateComponents([.month], from: firstDay, to: nextFirstDay)
        guard let month = componenet.month else {
            return nil
        }
        
        return (1...month).map { $0 }
    }
}
