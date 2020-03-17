//
//  DictionaryExtension.swift
//  Pods
//
//  Created by jesse on 2017/7/22.
//
//

import Foundation

//MARK: - Methods
extension Dictionary {
    /// 是否包含了key
    public func has(key: Key) -> Bool {
        return index(forKey: key) != nil
    }
    
    /// 移除所有keys中的value
    public mutating func removeAll(keys: [Key]) {
        keys.forEach { removeValue(forKey: $0) }
    }
    
    public func filter(where condition: (Key, Value) -> Bool) -> [Key: Value] {
        var result = [Key: Value]()
        forEach {
            if condition($0, $1) {
                result[$0] = $1
            }
        }
        return result
    }
    
    public func map<T, U>(condition: (Key, Value) -> [T: U]) -> [T: U] {
        var result = [T: U]()
        forEach { result += condition($0, $1) }
        return result
    }
}

//MARK: - Operators
extension Dictionary {
    public static func + (lhs: [Key: Value], rhs: [Key: Value]) -> [Key: Value] {
        var result = lhs
        rhs.forEach{ result[$0] = $1 }
        return result
    }

    public static func + (lhs: [Key: Value], rhs: [Key: Value]?) -> [Key: Value] {
        var result = lhs
        if let rhs = rhs {
            rhs.forEach{ result[$0] = $1 }
        }
        return result
    }
    
    public static func - (lhs: [Key: Value], keys: [Key]) -> [Key: Value]{
        var result = lhs
        result.removeAll(keys: keys)
        return result
    }
    
    public static func += (lhs: inout [Key: Value], rhs: [Key: Value]) {
        rhs.forEach({ lhs[$0] = $1})
    }
    
    public static func -= (lhs: inout [Key: Value], keys: [Key]) {
        lhs.removeAll(keys: keys)
    }
}

//MARK: - 利用KeyPath取字典里面的数据
extension Dictionary where Key == String {
    public subscript(keyPath keyPath: KeyPath) -> Value? {
        get {
            switch keyPath.headAndTail() {
            case nil:
                return nil
            case let (head, tail)? where tail.isEmpty:
                return self[head]
            case let (head, tail)?:
                switch self[head] {
                case let nestedDict as [Key: Value]:
                    return nestedDict[keyPath: tail]
                default:
                    return nil
                }
            }
        }
        set {
            guard let newValue = newValue else { return }
            switch keyPath.headAndTail() {
            case nil:
                return
            case let (head, tail)? where tail.isEmpty:
                self[head] = newValue
            case let (head, tail)?:
                switch self[head] {
                case var nestedDict as [Key: Value]:
                    nestedDict[keyPath: tail] = newValue
                    self[head] = nestedDict as? Value
                default:
                    return
                }
            }
        }
    }
}

public struct KeyPath {
    var segments: [String]
    var isEmpty: Bool { return segments.isEmpty }
    var path: String {
        return segments.joined(separator: ".")
    }

    fileprivate func headAndTail() -> (head: String, tail: KeyPath)? {
        guard !isEmpty else { return nil }
        var tail = segments
        let head = tail.removeFirst()
        return (head, KeyPath(segments: tail))
    }
}

extension KeyPath {
    init(_ string: String) {
        segments = string.components(separatedBy: ".")
    }
}

extension KeyPath: ExpressibleByStringLiteral {
    public init(stringLiteral value: String) {
        self.init(value)
    }

    public init(unicodeScalarLiteral value: String) {
        self.init(value)
    }

    public init(extendedGraphemeClusterLiteral value: String) {
        self.init(value)
    }
}
