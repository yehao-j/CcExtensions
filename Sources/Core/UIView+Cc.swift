//
//  UIViewExtension.swift
//  Extension
//
//  Created by jesse on 2017/5/24.
//  Copyright © 2017年 jesse. All rights reserved.
//

import UIKit

//MARK: - Storyboard
extension UIView {
    @IBInspectable
    public var borderColor: UIColor? {
        get { return layer.borderColor?.uiColor }
        set {
            guard let color = newValue else {
                layer.borderColor = nil
                return
            }
            layer.borderColor = color.cgColor
        }
    }
    
    @IBInspectable
    public var borderWidth: CGFloat {
        get { return layer.borderWidth }
        set { layer.borderWidth = newValue }
    }
    
    @IBInspectable
    public var cornerRadius: CGFloat {
        get { return layer.cornerRadius }
        set {
            layer.masksToBounds = true
            layer.cornerRadius = abs(CGFloat(Int(newValue * 100)) / 100)
        }
    }
}

//MARK: - Properties
extension UIView {
    public var x: CGFloat {
        get { return frame.x }
        set { frame.x = newValue }
    }
    
    public var y: CGFloat {
        get { return frame.y }
        set { frame.y = newValue }
    }
    
    public var maxX: CGFloat {
        get { return frame.maxX }
        set { x = newValue - frame.width }
    }
    
    public var maxY: CGFloat {
        get { return frame.maxY }
        set { y = newValue - frame.height }
    }
    
    public var width: CGFloat {
        get { return frame.width }
        set { frame.size.width = newValue }
    }
    
    public var height: CGFloat {
        get { return frame.height }
        set { frame.size.height = newValue }
    }
    
    public var size: CGSize {
        get { return frame.size }
        set { frame.size = newValue }
    }
    
    public var origin: CGPoint {
        get { return frame.origin }
        set { frame.origin = newValue }
    }
    
    public var centerX: CGFloat {
        get { return frame.centerX }
        set { frame.centerX = newValue }
    }
    
    public var centerY: CGFloat {
        get { return frame.centerY }
        set { frame.centerY = newValue }
    }
    
    /// 获取当前视图的截图
    public var screenshot: UIImage? {
        UIGraphicsBeginImageContextWithOptions(layer.frame.size, false, 0.0);
        defer {
            UIGraphicsEndImageContext()
        }
        guard let context = UIGraphicsGetCurrentContext() else {
            return nil
        }
        layer.render(in: context)
        return UIGraphicsGetImageFromCurrentImageContext()
    }
}

//MARK: - Edges
extension UIView {
    public var top: CGFloat {
        get { return y }
        set { y = newValue }
    }
    
    public var bottom: CGFloat {
        get { return maxY }
        set { maxY = newValue }
    }
    
    public var left: CGFloat {
        get { return x }
        set { x = newValue }
    }
    
    public var right: CGFloat {
        get { return maxX }
        set { maxX = newValue }
    }
}

//MARK: - Methods
extension UIView {
    /// View生成圆角
    ///
    /// - Parameters:
    ///   - corners: 类似[.topLeft, .topRight]，左上角和右上角带有圆角
    ///   - radius: 圆角的半径
    public func roundCorners(corners: UIRectCorner, withRadius radius: CGFloat) {
        let path = UIBezierPath(roundedRect: self.bounds, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        let mask = CAShapeLayer()
        mask.path = path.cgPath
        self.layer.mask = mask
    }
    
    /// 移除所有的子视图
    public func removeSubviews() {
        subviews.forEach { $0.removeFromSuperview() }
    }
    
    public func removeGestures() {
        gestureRecognizers?.forEach { removeGestureRecognizer($0) }
    }
    
    public static func load<T>(nibName: String, bundle: Bundle? = nil) -> T? {
        return UINib(nibName: nibName, bundle: bundle).instantiate(withOwner: nil, options: nil).first as? T
    }
    
    public static func load<T>(nibClass: T.Type, bundle: Bundle? = nil) -> T? {
        return UINib(nibName: String(describing: nibClass), bundle: bundle).instantiate(withOwner: nil, options: nil).first as? T
    }
}
