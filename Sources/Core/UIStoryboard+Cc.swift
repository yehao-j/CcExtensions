//
//  UIStoryboardExtension.swift
//  Extension
//
//  Created by jesse on 2017/5/25.
//  Copyright © 2017年 jesse. All rights reserved.
//

import UIKit

public protocol Storyboard {
    /// 文件中storyboard的文件名
    var value: String { get }
}

extension UIViewController : StoryboardIdentifiable {}

public protocol StoryboardIdentifiable {
    static var storyboardIdentifier: String { get }
}

public extension StoryboardIdentifiable where Self: UIViewController {
    static var storyboardIdentifier: String {
        return String(describing: self)
    }
}

//MARK: - Methods
extension UIStoryboard {
    public convenience init(storyboard: Storyboard, bundle: Bundle? = nil) {
        self.init(name: storyboard.value, bundle: bundle)
    }
    
    public static func storyboard(_ storyboard: Storyboard, bundle: Bundle? = nil) -> UIStoryboard {
        return UIStoryboard(name: storyboard.value, bundle: bundle)
    }
    
    public func instantiateViewController<T: UIViewController>(withClass name: T.Type) -> T? {
        guard let control = instantiateViewController(withIdentifier: String(describing: name)) as? T else {
            return nil
        }
        return control
    }
    
    public func instantiateViewController<T: StoryboardIdentifiable>() -> T? {
        guard let control = self.instantiateViewController(withIdentifier: T.storyboardIdentifier) as? T else {
            return nil
        }
        return control
    }
}
