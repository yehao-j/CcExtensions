//
//  UITableViewExtension.swift
//  Extension
//
//  Created by jesse on 2017/6/9.
//  Copyright © 2017年 jesse. All rights reserved.
//

import UIKit

//MARK: - Methods
extension UITableView {
    public func scrollToTop(animated: Bool = true) {
        setContentOffset(CGPoint.zero, animated: animated)
    }
    
    public func scrollToBottom(animated: Bool = true) {
        let bottomOffset = CGPoint(x: 0, y: contentSize.height - bounds.height)
        setContentOffset(bottomOffset, animated: animated)
    }
}
