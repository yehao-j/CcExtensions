//
//  UIResponder+Ex.swift
//  CandyExtension
//
//  Created by jesse on 2018/11/28.
//

import UIKit

//MARK: - 响应事件链
extension UIResponder {
    @objc open func responderChain(_ route: String, _ params: Dictionary<String, Any>?) {
        self.next?.responderChain(route, params)
    }
}
