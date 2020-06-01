//
//  UINib.swift
//  ExtensionKit
//
//  Created by 叶浩 on 2020/4/15.
//

import UIKit

extension UIView: NibIdentifiable {}

public protocol NibIdentifiable {
    static var nilIdentifier: String { get }
}

public extension NibIdentifiable where Self: UIView {
    static var nilIdentifier: String {
        return String(describing: self)
    }
}

extension UINib {
    public static func view<T>(name: String, index: Int = 0, bundle: Bundle? = nil, owner: Any? = nil, options: [OptionsKey: Any]? = nil) -> T {
        return UINib(nibName: name, bundle: bundle).instantiate(withOwner: owner, options: options)[index] as! T
    }
    
    public static func view<T: NibIdentifiable>(index: Int = 0, bundle: Bundle? = nil, owner: Any? = nil, options: [OptionsKey: Any]? = nil) -> T {
        return UINib(nibName: T.nilIdentifier, bundle: bundle).instantiate(withOwner: owner, options: options)[index] as! T
    }
    
    public static func nib<T: NibIdentifiable>(type: T.Type, bundle: Bundle? = nil) -> UINib {
        return UINib(nibName: T.nilIdentifier, bundle: bundle)
    }
    
    public static func nib(name: String, bundle: Bundle? = nil) -> UINib {
        return UINib(nibName: name, bundle: bundle)
    }
}
