//
//  UIButtonExtension.swift
//  Pods
//
//  Created by jesse on 2017/7/17.
//
//

import UIKit

//MARK: - Storyboard
extension UIButton {
    @IBInspectable
    public var backgroundImageForNormal: UIImage? {
        get { return backgroundImage(for: .normal) }
        set { setBackgroundImage(newValue, for: .normal) }
    }

    @IBInspectable
    public var backgroundImageForDisabled: UIImage? {
        get { return backgroundImage(for: .disabled) }
        set { setBackgroundImage(newValue, for: .disabled) }
    }

    @IBInspectable
    public var backgroundImageForHighlighted: UIImage? {
        get { return backgroundImage(for: .highlighted) }
        set { setBackgroundImage(newValue, for: .highlighted) }
    }

    @IBInspectable
    public var backgroundImageForSelected: UIImage? {
        get { return backgroundImage(for: .selected) }
        set { setBackgroundImage(newValue, for: .selected) }
    }

    @IBInspectable
    public var imageForNormal: UIImage? {
        get { return image(for: .normal) }
        set { setImage(newValue, for: .normal) }
    }

    @IBInspectable
    public var imageForDisabled: UIImage? {
        get { return image(for: .disabled) }
        set { setImage(newValue, for: .disabled) }
    }

    @IBInspectable
    public var imageForHighlighted: UIImage? {
        get { return image(for: .highlighted) }
        set { setImage(newValue, for: .highlighted) }
    }

    @IBInspectable
    public var imageForSelected: UIImage? {
        get { return image(for: .selected) }
        set { setImage(newValue, for: .selected) }
    }

    @IBInspectable
    public var titleColorForNormal: UIColor? {
        get { return titleColor(for: .normal) }
        set { setTitleColor(newValue, for: .normal) }
    }

    @IBInspectable
    public var titleColorForDisabled: UIColor? {
        get { return titleColor(for: .disabled) }
        set { setTitleColor(newValue, for: .disabled) }
    }

    @IBInspectable
    public var titleColorForHighlighted: UIColor? {
        get { return titleColor(for: .highlighted) }
        set { setTitleColor(newValue, for: .highlighted) }
    }

    @IBInspectable
    public var titleColorForSelected: UIColor? {
        get { return titleColor(for: .selected) }
        set { setTitleColor(newValue, for: .selected) }
    }

    @IBInspectable
    public var titleForNormal: String? {
        get { return title(for: .normal) }
        set { setTitle(newValue, for: .normal) }
    }

    @IBInspectable
    public var titleForDisabled: String? {
        get { return title(for: .disabled) }
        set { setTitle(newValue, for: .disabled) }
    }

    @IBInspectable
    public var titleForHighlighted: String? {
        get { return title(for: .highlighted) }
        set { setTitle(newValue, for: .highlighted) }
    }


    @IBInspectable
    public var titleForSelected: String? {
        get { return title(for: .selected) }
        set { setTitle(newValue, for: .selected) }
    }

    @IBInspectable
    public var titleForFont: UIFont? {
        get { return titleLabel?.font }
        set { titleLabel?.font = newValue }
    }
}

//MARK: - Methods
extension UIButton {
    private var states: [UIControl.State] {
        return [.normal, .selected, .highlighted, .disabled]
    }

    public func setImageForAllStates(_ image: UIImage) {
        states.forEach { self.setImage(image, for:  $0) }
    }

    public func setTitleColorForAllStates(_ color: UIColor) {
        states.forEach { self.setTitleColor(color, for: $0) }
    }

    public func setTitleForAllStates(_ title: String) {
        states.forEach { self.setTitle(title, for: $0) }
    }
}

//MARK: - EdgeInsets
extension UIButton {
    /// 图片在右侧，并且保证文字和图片水平居中
    public func rightIcon(space: CGFloat = 0) {
        guard self.bounds.size != .zero else {
            print("需要先设置UIButton的size")
            return
        }
        
        let imageWidth = imageView?.image?.size.width ?? 0
        let titleWidth = titleLabel?.bounds.width ?? 0
        
        titleEdgeInsets = UIEdgeInsets(top: 0, left: -(imageWidth + space / 2), bottom: 0, right: imageWidth + space / 2)
        imageEdgeInsets = UIEdgeInsets(top: 0, left: titleWidth + space / 2, bottom: 0, right: -(titleWidth + space / 2))
    }
    
    public func leftIcon(space: CGFloat = 0) {
        guard self.bounds.size != .zero else {
            print("需要先设置UIButton的size")
            return
        }
        
        titleEdgeInsets = UIEdgeInsets(top: 0, left: space / 2, bottom: 0, right: -space / 2)
        imageEdgeInsets = UIEdgeInsets(top: 0, left: -space / 2, bottom: 0, right: space / 2)
    }
    
    public func topIcon(space: CGFloat = 0) {
        guard self.bounds.size != .zero else {
            print("需要先设置UIButton的size")
            return
        }
        
        let imageWidth = imageView?.image?.size.width ?? 0
        let imageHeight = imageView?.image?.size.height ?? 0
        let titleWidth = titleLabel?.bounds.width ?? 0
        let titleHeight = titleLabel?.bounds.height ?? 0
        
        titleEdgeInsets = UIEdgeInsets(top: (imageHeight + space) / 2, left: -imageWidth / 2, bottom: -(imageHeight + space) / 2, right: imageWidth / 2)
        imageEdgeInsets = UIEdgeInsets(top: -(titleHeight + space) / 2, left: titleWidth / 2, bottom: (titleHeight + space) / 2, right: -titleWidth / 2)
    }
    
    public func bottomIcon(space: CGFloat = 0) {
        guard self.bounds.size != .zero else {
            print("需要先设置UIButton的size")
            return
        }
        
        let imageWidth = imageView?.image?.size.width ?? 0
        let imageHeight = imageView?.image?.size.height ?? 0
        let titleWidth = titleLabel?.bounds.width ?? 0
        let titleHeight = titleLabel?.bounds.height ?? 0
        
        titleEdgeInsets = UIEdgeInsets(top: -(imageHeight + space) / 2, left: -imageWidth / 2, bottom: (imageHeight + space) / 2, right: imageWidth / 2)
        imageEdgeInsets = UIEdgeInsets(top: (titleHeight + space) / 2, left: titleWidth / 2, bottom: -(titleHeight + space) / 2, right: -titleWidth / 2)
    }
}
