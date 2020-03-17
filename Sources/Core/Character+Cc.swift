//
//  CharacterExtension.swift
//  Extension
//
//  Created by jesse on 2017/5/25.
//  Copyright © 2017年 jesse. All rights reserved.
//

import Foundation

//MARK: - Operator
extension Character {
    static public func * (lhs: Character, rhs: Int) -> String {
        guard rhs > 0 else { return "" }
        var newString = ""
        for _ in 0 ..< rhs {
            newString += String(lhs)
        }
        return newString
    }
    
    static public func * (lhs: Int, rhs: Character) -> String {
        guard lhs > 0 else {return "" }
        var newString = ""
        for _ in 0 ..< lhs {
            newString += String(rhs)
        }
        return newString
    }
}
