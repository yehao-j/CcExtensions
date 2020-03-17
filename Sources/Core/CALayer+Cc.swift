//
//  CALayerExtension.swift
//  Pods
//
//  Created by jesse on 2017/7/15.
//
//

import UIKit

//MARK: - Properties
extension CALayer {
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
    
    public var center: CGPoint {
        get { return CGPoint(x: centerX, y: centerY) }
        set {
            centerX = newValue.x
            centerY = newValue.y
        }
    }
    
}

//MARK: - Edges
extension CALayer {
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
