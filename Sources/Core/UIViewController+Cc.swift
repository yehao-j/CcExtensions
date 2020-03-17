//
//  UIViewControllerExtension.swift
//  Extension
//
//  Created by jesse on 2017/5/25.
//  Copyright © 2017年 jesse. All rights reserved.
//

import UIKit

//MARK: - Properties
extension UIViewController {
    /// 当前controller可见
    public var isVisible: Bool {
        return self.isViewLoaded && view.window != nil
    }
}
