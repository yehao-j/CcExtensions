//
//  UIImageViewExtension.swift
//  Extension
//
//  Created by jesse on 2017/6/9.
//  Copyright © 2017年 jesse. All rights reserved.
//

import UIKit

//MARK: - Methods
extension UIImageView {
    /// 初始化添加模糊层
    public convenience init(frame: CGRect, blurEffectStyle: UIBlurEffect.Style) {
        self.init(frame: frame)
        
        let blurView = UIVisualEffectView(frame: self.bounds)
        blurView.translatesAutoresizingMaskIntoConstraints = false
        blurView.effect = UIBlurEffect(style: blurEffectStyle)
        self.addSubview(blurView)
        self.addConstraint(NSLayoutConstraint(item: blurView, attribute: .top, relatedBy: .equal, toItem: self, attribute: .top, multiplier: 1, constant: 0))
        self.addConstraint(NSLayoutConstraint(item: blurView, attribute: .bottom, relatedBy: .equal, toItem: self, attribute: .bottom, multiplier: 1, constant: 0))
        self.addConstraint(NSLayoutConstraint(item: blurView, attribute: .left, relatedBy: .equal, toItem: self, attribute: .left, multiplier: 1, constant: 0))
        self.addConstraint(NSLayoutConstraint(item: blurView, attribute: .right, relatedBy: .equal, toItem: self, attribute: .right, multiplier: 1, constant: 0))
    }
}
