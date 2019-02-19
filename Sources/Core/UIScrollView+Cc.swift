//
//  UIScrollViewExtension.swift
//  Pods
//
//  Created by jesse on 2017/7/15.
//
//

import UIKit

//MARK: - Properties
extension UIScrollView {
    public var contentWidth: CGFloat {
        get { return contentSize.width }
        set { contentSize.width = newValue }
    }
    
    public var contentHeight: CGFloat {
        get { return contentSize.height }
        set { contentSize.height = newValue }
    }
    
    public var contentOffsetX: CGFloat {
        get { return contentOffset.x }
        set { contentOffset.x = newValue }
    }
    
    public var contentOffsetY: CGFloat {
        get {return contentOffset.y }
        set {contentOffset.y = newValue }
    }
}
