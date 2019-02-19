//
//  StringExtension.swift
//  Extension
//
//  Created by jesse on 2017/5/25.
//  Copyright © 2017年 jesse. All rights reserved.
//

import UIKit

//MARK: - Properties
extension String {
    public var containEmoji: Bool {
        // http://stackoverflow.com/questions/30757193/find-out-if-character-in-string-is-emoji
        for scalar in unicodeScalars {
            switch scalar.value {
            case 0x3030, 0x00AE, 0x00A9, // Special Characters
            0x1D000...0x1F77F, // Emoticons
            0x2100...0x27BF, // Misc symbols and Dingbats
            0xFE00...0xFE0F, // Variation Selectors
            0x1F900...0x1F9FF: // Supplemental Symbols and Pictographs
                return true
            default:
                continue
            }
        }
        return false
    }
    
    public var base64Decoded: String? {
        guard let decodedData = Data(base64Encoded: self) else { return nil }
        return String(data: decodedData, encoding: .utf8)
    }
    
    public var base64Encoded: String? {
        let plainData = data(using: .utf8)
        return plainData?.base64EncodedString()
    }
    
    public var length: Int {
        return count
    }
    
    public var reversed: String {
        return String(reversed())
    }
    
    public var urlEncoded: String? {
        var charSet = CharacterSet.urlQueryAllowed
        charSet.insert(charactersIn: "#")
        return self.addingPercentEncoding(withAllowedCharacters: charSet)
    }

    public var url: URL? {
        return URL(string: self)
    }
    
    public var trimmed: String {
        return String(filter { $0 != " " && $0 != "\n" })
    }
    
    public var bool: Bool? {
        let selfLowercased = trimmed.lowercased()
        if ["true", "1"].contains(selfLowercased) {
            return true
        } else if ["false", "0"].contains(selfLowercased) {
            return false
        }
        return nil
    }
    
    public func float(locale: Locale = .current) -> Float? {
        let formatter = NumberFormatter()
        formatter.locale = locale
        formatter.allowsFloats = true
        return formatter.number(from: self) as? Float
    }
    
    public func double(locale: Locale = .current) -> Double? {
        let formatter = NumberFormatter()
        formatter.locale = locale
        formatter.allowsFloats = true
        return formatter.number(from: self) as? Double
    }
    
    public func cgFloat(locale: Locale = .current) -> CGFloat? {
        let formatter = NumberFormatter()
        formatter.locale = locale
        formatter.allowsFloats = true
        return formatter.number(from: self) as? CGFloat
    }
    
    public var int: Int? {
        return Int(self)
    }
}

//MARK: - Methods
extension String {
    public func firstIndex(of string: String) -> Int? {
        return map({String($0)}).index(of: string)
    }
    
    public func dropEnd(_ length: Int = 1) -> String? {
        if count >= length {
            return self.substring(to: count - length)
        }
        return nil
    }
    
    public func dropStart(_ length: Int = 1) -> String? {
        if count >= length {
            return self.substring(from: length)
        }
        return nil
    }
    
    public func size(with size: CGSize, font: UIFont, attributes: [NSAttributedString.Key : Any]? = nil) -> CGSize {
        var s: CGRect
        if var attributes = attributes {
            attributes[.font] = font
            s = (self as NSString).boundingRect(with: size, options: [.usesLineFragmentOrigin, .usesFontLeading], attributes: attributes, context: nil)
        } else {
            s = (self as NSString).boundingRect(with: size, options: [.usesLineFragmentOrigin, .usesFontLeading], attributes: [.font: font], context: nil)
        }
        return CGSize(width: s.width, height: CGFloat(ceilf(Float(s.height))))
    }
    
    public func start(with prefix: String, caseSensitive: Bool = false) -> Bool {
        if !caseSensitive {
            return lowercased().hasPrefix(prefix.lowercased())
        }
        return hasPrefix(prefix)
    }
    
    public func end(with suffix: String, caseSensitive: Bool = false) -> Bool {
        if !caseSensitive {
            return lowercased().hasSuffix(suffix.lowercased())
        }
        return hasSuffix(suffix)
    }
    
    public func replacing(_ substring: String, with newString: String) -> String {
        return replacingOccurrences(of: substring, with: newString)
    }
    
    mutating public func insert(_ newElement: String, at offset : Int) {
        var index = self.index(self.startIndex, offsetBy: offset)
        var offset = offset
        newElement.forEach {
            self.insert($0, at: index)
            offset += 1
            index = self.index(self.startIndex, offsetBy: offset)
        }
    }

    public func insert(_ newElement: String, with offset : Int) -> String {
        var temp = self
        var index = self.index(self.startIndex, offsetBy: offset)
        var offset = offset
        newElement.forEach {
            temp.insert($0, at: index)
            offset += 1
            index = self.index(self.startIndex, offsetBy: offset)
        }
        return temp
    }
    
    public subscript(i: Int) -> String? {
        guard i >= 0 && i < count else { return nil }
        return String(self[index(startIndex, offsetBy: i)])
    }
    
    public subscript(range: CountableRange<Int>) -> String? {
        guard let lowerIndex = index(startIndex, offsetBy: max(0,range.lowerBound), limitedBy: endIndex) else { return nil }
        guard let upperIndex = index(lowerIndex, offsetBy: range.upperBound - range.lowerBound, limitedBy: endIndex) else { return nil }
        return String(self[lowerIndex..<upperIndex])
    }
    
    public subscript(range: ClosedRange<Int>) -> String? {
        guard let lowerIndex = index(startIndex, offsetBy: max(0,range.lowerBound), limitedBy: endIndex) else { return nil }
        guard let upperIndex = index(lowerIndex, offsetBy: range.upperBound - range.lowerBound + 1, limitedBy: endIndex) else { return nil }
        return String(self[lowerIndex..<upperIndex])
    }
    
    public func substring(from i: Int, length: Int) -> String? {
        guard length >= 0, i >= 0, i < count  else { return nil }
        guard i.advanced(by: length) <= count else { return substring(from: i) }
        guard length > 0 else { return "" }
        return self[i..<i.advanced(by: length)]
    }
    
    public func substring(range: NSRange) -> String? {
        guard let lowerIndex = index(startIndex, offsetBy: range.location, limitedBy: endIndex) else { return nil }
        guard let upperIndex = index(lowerIndex, offsetBy: range.length, limitedBy: endIndex) else { return nil }
        return String(self[lowerIndex..<upperIndex])
    }
    
    public func substring(from start: Int, to end: Int) -> String? {
        guard end >= start else { return nil }
        return self[start..<end]
    }
    
    public func  substring(from i: Int) -> String? {
        guard i >= 0, i <= count else { return nil }
        return self[i..<count]
    }
    
    public func substring(to i: Int) -> String? {
        guard i >= 0, i <= count else { return nil }
        return self[0..<i]
    }
    
    public mutating func replaceSubrange(range: NSRange, with newElements: String) {
        guard let lowerIndex = index(startIndex, offsetBy: range.location, limitedBy: endIndex) else { return }
        guard let upperIndex = index(lowerIndex, offsetBy: range.length, limitedBy: endIndex) else { return }
        self.replaceSubrange(lowerIndex..<upperIndex, with: newElements)
    }
    
    #if os(iOS) || os(macOS)
    public func copyToPasteboard() {
        #if os(iOS)
            UIPasteboard.general.string = self
        #elseif os(macOS)
            NSPasteboard.general().clearContents()
            NSPasteboard.general().setString(self, forType: NSPasteboardTypeString)
        #endif
    }
    #endif
    
    public func date(inFormat format: String) -> Date? {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = format
        dateFormatter.locale = Locale(identifier: "en_US_POSIX")
        dateFormatter.timeZone = TimeZone(secondsFromGMT: 0)
        
        return dateFormatter.date(from: self)
    }
}

//MARK: - Operators
extension String {
    static public func * (lhs: String, rhs: Int) -> String {
        guard rhs > 0 else { return "" }
        var newString = ""
        for _ in 0 ..< rhs {
            newString += lhs
        }
        return newString
    }
    
    static public func * (lhs: Int, rhs: String) -> String {
        guard lhs > 0 else { return "" }
        var newString = ""
        for _ in 0 ..< lhs {
            newString += rhs
        }
        return newString
    }
    
    static public func + (lhs: String?, rhs: String) -> String? {
        if let lhs = lhs {
            return String(Array(lhs) + Array(rhs))
        }
        return rhs
    }
    
    static public func + (lhs: String, rhs: String?) -> String? {
        if let rhs = rhs {
            return String(Array(lhs) + Array(rhs))
        }
        return lhs
    }
    
    static public func += (lhs: inout String, rhs: String?) {
        if let rhs = rhs {
            lhs = lhs + rhs
        }
    }
    
    static public func += (lhs: inout String?, rhs: String) {
        if lhs.isSome {
            lhs = lhs! + rhs
        } else {
            lhs = rhs
        }
    }
}
