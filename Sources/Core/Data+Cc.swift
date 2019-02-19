//
//  DataExtensions.swift
//  JSExtensions
//
//  Created by jesse on 2017/10/18.
//

import Foundation

//MARK: - Properties
extension Data {
    public var bytes: [UInt8] {
        /// http://stackoverflow.com/questions/38097710/swift-3-changes-for-getbytes-method
        return [UInt8](self)
    }
}

//MARK: - Methods
extension Data {
    public func string(encoding: String.Encoding = String.Encoding.utf8) -> String? {
        return String(data: self, encoding: encoding)
    }
}
