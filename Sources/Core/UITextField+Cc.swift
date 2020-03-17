//
//  UITextFieldExtension.swift
//  JSExtensions
//
//  Created by jesse on 2017/7/6.
//

import UIKit

//MARK: - Properties
extension UITextField {
    /// 该方法需要保证先设置了placeholder才行
    public var placeholderColor: UIColor? {
        get {
            let label = value(forKey: "placeholderLabel") as? UILabel
            return label?.textColor
        }
        set {
            let label = value(forKey: "placeholderLabel") as? UILabel
            label?.textColor = newValue
        }
    }
}
