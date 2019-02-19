//
//  OptionalExtension.swift
//  JSExtensions
//
//  Created by jesse on 2017/10/18.
//

import Foundation

//MARK: - Properties
extension Optional where Wrapped == Int {
    public func unwrap() -> Wrapped {
        return self ?? 0
    }
}

extension Optional where Wrapped == CGFloat {
    public func unwrap() -> Wrapped {
        return self ?? 0.0
    }
}

extension Optional where Wrapped == Float {
    public func unwrap() -> Wrapped {
        return self ?? 0.0
    }
}

extension Optional where Wrapped == Double {
    public func unwrap() -> Wrapped {
        return self ?? 0.0
    }
}

extension Optional where Wrapped == String {
    public func unwrap() -> Wrapped {
        return self ?? ""
    }
}

//MARK: - Math Properties
extension Optional {
    public var isNone: Bool {
        switch self {
        case .none: return true
        default: return false
        }
    }

    public var isSome: Bool {
        return !isNone
    }
}

//MARK: - Methods
extension Optional {
    public func or(_ default: Wrapped) -> Wrapped {
        return self ?? `default`
    }

    public func or(else: @autoclosure () -> Wrapped) -> Wrapped {
        return self ?? `else`()
    }

    public func or(else: () -> Wrapped) -> Wrapped {
        return self ?? `else`()
    }
}


