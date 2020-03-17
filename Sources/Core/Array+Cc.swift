//
//  ArrayExtension.swift
//  JSExtensions
//
//  Created by jesse on 2017/7/22.
//

import Foundation

//MARK: - Methods
extension Array {
    public func item(at index: Int) -> Element? {
        guard startIndex..<endIndex ~= index else { return nil }
        return self[index]
    }
}

//MARK: - Methods
extension Array where Element: Equatable {
    /// 移除数组中所有element
    public mutating func remove(element: Element) {
        self = filter { $0 != element }
    }
    
    public mutating func removeAll(_ items: [Element]) {
        guard !items.isEmpty else { return }
        self = filter { !items.contains($0) }
    }
    
    public mutating func removeDuplicates() {
        self = reduce([]){ $0.contains($1) ? $0 : $0 + [$1] }
    }

    @discardableResult
    public mutating func pop() -> Element? {
        return popLast()
    }

    public func firstIndex(of item: Element) -> Int? {
        for (index, value) in lazy.enumerated() where value == item {
            return index
        }
        return nil
    }

    public func lastIndex(of item: Element) -> Int? {
        for (index, value) in lazy.enumerated().reversed() where value == item {
            return index
        }
        return nil
    }

    public func indexes(of item: Element) -> [Int] {
        var indexes: [Int] = []
        for index in startIndex..<endIndex where self[index] == item {
            indexes.append(index)
        }
        return indexes
    }
}
