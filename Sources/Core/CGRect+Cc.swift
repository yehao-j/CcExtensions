//
//  CGRectExtension.swift
//  Pods
//
//  Created by jesse on 2017/7/15.
//
//

import UIKit

//MARK: - Properties
extension CGRect {
    public var x: CGFloat {
        get { return origin.x }
        set { origin.x = newValue }
    }
    
    public var y: CGFloat {
        get { return origin.y }
        set { origin.y = newValue }
    }
    
    public var centerX: CGFloat {
        get { return origin.x + width / 2 }
        set { x = newValue - width / 2 }
    }
    
    public var centerY: CGFloat {
        get { return origin.y + height / 2 }
        set { y = newValue - height / 2 }
    }
}

//MARK: - Edges
extension CGRect {
    public var left: CGFloat {
        get { return x }
        set { x = newValue }
    }
    
    public var right: CGFloat {
        get { return maxX }
        set { x = newValue - width }
    }
    
    public var top: CGFloat {
        get { return y }
        set { y = newValue }
    }
    
    public var bottom: CGFloat {
        get { return maxY }
        set { y = newValue - height }
    }
}
