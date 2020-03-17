//
//  BoolExtension.swift
//  Pods
//
//  Created by jesse on 2017/7/22.
//
//

import Foundation

//MARK: - Properties
extension Bool {
    public func int() -> Int {
        return self ? 1 : 0
    }
}
