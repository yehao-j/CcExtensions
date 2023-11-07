//
//  DateExtension.swift
//  Pods
//
//  Created by jesse on 2017/6/16.
//
//

import Foundation

//MARK: - Properties
extension Date {
    public var year: Int {
        return dateComponents.year!
    }
    
    public var month: Int {
        return dateComponents.month!
    }
    
    public var day: Int {
        return dateComponents.day!
    }
    
    public var hour: Int {
        return dateComponents.hour!
    }
    
    public var minute: Int {
        return dateComponents.minute!
    }
    
    public var second: Int {
        return dateComponents.second!
    }
    
    public var nanosecond: Int {
        return dateComponents.nanosecond!
    }
    
    public var weekday: Int {
        return dateComponents.weekday!
    }
    
    fileprivate var calendar: Calendar {
        return .current
    }
    
    fileprivate var dateComponents: DateComponents {
        return calendar.dateComponents([.era, .year, .month, .day, .hour, .minute, .second, .nanosecond, .weekday], from: self)
    }
    
    public static var today: Date {
        let now = Date()
        return Date(year: now.year, month: now.month, day: now.day)
    }
    
    public static var yesterday: Date {
        return (today - 1.day)!
    }
    
    public static var tomorrow: Date {
        return (today + 1.day)!
    }
}

//MARK: - Methods
extension Date {
    public init(era: Int?, year: Int, month: Int, day: Int, hour: Int, minute: Int, second: Int, nanosecond: Int, on calendar: Calendar) {
        let now = Date()
        var dateComponents = calendar.dateComponents([.era, .year, .month, .day, .hour, .minute, .second, .nanosecond], from: now)
        dateComponents.era = era
        dateComponents.year = year
        dateComponents.month = month
        dateComponents.day = day
        dateComponents.hour = hour
        dateComponents.minute = minute
        dateComponents.second = second
        dateComponents.nanosecond = nanosecond
        
        let date = calendar.date(from: dateComponents)
        self.init(timeInterval: 0, since: date!)
    }
    
    public init(year: Int, month: Int, day: Int, hour: Int, minute: Int, second: Int, nanosecond: Int = 0) {
        self.init(era: nil, year: year, month: month, day: day, hour: hour, minute: minute, second: second, nanosecond: nanosecond, on: .current)
    }
    
    public init(year: Int, month: Int, day: Int) {
        self.init(year: year, month: month, day: day, hour: 0, minute: 0, second: 0)
    }
    
    public func changed(year: Int? = nil, month: Int? = nil, day: Int? = nil, hour: Int? = nil, minute: Int? = nil, second: Int? = nil, nanosecond: Int? = nil) -> Date? {
        var dateComponents = self.dateComponents
        dateComponents.year = year ?? self.year
        dateComponents.month = month ?? self.month
        dateComponents.day = day ?? self.day
        dateComponents.hour = hour ?? self.hour
        dateComponents.minute = minute ?? self.minute
        dateComponents.second = second ?? self.second
        dateComponents.nanosecond = nanosecond ?? self.nanosecond
        
        return calendar.date(from: dateComponents)
    }
    
    public func changed(year: Int) -> Date? {
        return changed(year: year, month: nil, day: nil, hour: nil, minute: nil, second: nil, nanosecond: nil)
    }
    
    public func changed(month: Int) -> Date? {
        return changed(year: nil, month: month, day: nil, hour: nil, minute: nil, second: nil, nanosecond: nil)
    }
    
    public func changed(day: Int) -> Date? {
        return changed(year: nil, month: nil, day: day, hour: nil, minute: nil, second: nil, nanosecond: nil)
    }
    
    public func changed(hour: Int) -> Date? {
        return changed(year: nil, month: nil, day: nil, hour: hour, minute: nil, second: nil, nanosecond: nil)
    }
    
    public func changed(minute: Int) -> Date? {
        return changed(year: nil, month: nil, day: nil, hour: nil, minute: minute, second: nil, nanosecond: nil)
    }
    
    public func changed(second: Int) -> Date? {
        return changed(year: nil, month: nil, day: nil, hour: nil, minute: nil, second: second, nanosecond: nil)
    }
    
    public func changed(nanosecond: Int) -> Date? {
        return changed(year: nil, month: nil, day: nil, hour: nil, minute: nil, second: nil, nanosecond: nanosecond)
    }
    
    public func changed(weekday: Int) -> Date? {
        return self - (self.weekday - weekday).days
    }
    
    public func stringIn(dateStyle: DateFormatter.Style, timeStyle: DateFormatter.Style) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = dateStyle
        dateFormatter.timeStyle = timeStyle
        return dateFormatter.string(from: self)
    }

    public func stringIn(format: String) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = format
        return dateFormatter.string(from: self)
    }
    
    public func dateString(in dateStyle: DateFormatter.Style) -> String {
        return stringIn(dateStyle: dateStyle, timeStyle: .none)
    }
    
    public func timeString(in timeStyle: DateFormatter.Style) -> String {
        return stringIn(dateStyle: .none, timeStyle: timeStyle)
    }
}

//MARK: - Operators
extension Date {
    public static func + (left: Date, right: DateComponents) -> Date? {
        return Calendar.current.date(byAdding: right, to: left)
    }
    
    public static func - (left: Date, right: DateComponents) -> Date? {
        return Calendar.current.date(byAdding: -right, to: left)
    }
}

//MARK: - 农历
extension Date {
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
    
    private var monthNameList: [String] {
        return ["正月", "二月", "三月", "四月", "五月", "六月", "七月", "八月", "九月", "十月", "冬月", "腊月"]
    }
    
    private var dayNameList: [String] {
        return ["初一",  "初二",  "初三",  "初四",  "初五",  "初六",  "初七",  "初八",  "初九",  "初十",  "十一",  "十二",  "十三",  "十四",  "十五",  "十六",  "十七",  "十八",  "十九",  "二十",  "廿一",  "廿二",  "廿三",  "廿四",  "廿五",  "廿六",  "廿七",  "廿八",  "廿九", "三十"]
    }
    
    var lunarCalendar: Calendar {
        return Calendar(identifier: .chinese)
    }
    
    /// 农历月份
    var lunarMonth: Int {
        return lunarCalendar.component(.month, from: self)
    }
    
    /// 农历月份中文
    var lunarMonthName: String {
        let lunarMonth = self.lunarMonth
        if lunarMonth > 0 && lunarMonth < 13 {
            if isLeapMonth {
                return "闰" + monthNameList[lunarMonth - 1]
            }
            return monthNameList[lunarMonth - 1]
        }
        return ""
    }
    
    // 农历天
    var lunarDay: Int {
        return lunarCalendar.component(.day, from: self)
    }
    
    /// 农历天中文
    var lunarDayName: String {
        let lunarDay = self.lunarDay
        if lunarDay > 0 && lunarDay < 31 {
            return dayNameList[lunarDay - 1]
        }
        return ""
    }
    
    // 农历年
    var lunarYear: Int {
        return lunarCalendar.component(.year, from: self)
    }
    
    /// 农历年中文
    var lunarYearName: String {
        let lunarYear = self.lunarYear
        if lunarYear > 0 && lunarYear < 61 {
            return celestialStemEarthlyBranches[lunarYear - 1]
        }
        return ""
    }
    
    /// 上一个月同一天
    func lastMonthSameDay(calendar: Calendar) -> Date? {
        return calendar.date(byAdding: .month, value: -1, to: self)
    }
    
    /// 是否是闰月
    var isLeapMonth: Bool {
        if let date = lastMonthSameDay(calendar: lunarCalendar) {
            return date.lunarMonth == self.lunarMonth
        }
        return false
    }
}
