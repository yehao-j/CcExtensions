//
//  URLExtensions.swift
//  JSExtensions
//
//  Created by jesse on 2017/10/18.
//

import Foundation

//MARK: - Methods
extension URL {
    public func appending(parameters: [String: String]) -> URL {
        var urlComponents = URLComponents(url: self, resolvingAgainstBaseURL: true)!
        var items = urlComponents.queryItems ?? []
        items += parameters.map({ URLQueryItem(name: $0, value: $1) })
        urlComponents.queryItems = items
        return urlComponents.url!
    }
    
    public mutating func append(parameters: [String: String]) {
        self = appending(parameters: parameters)
    }
}

extension URL {
    public init?(encode: String) {
        var charSet = CharacterSet.urlQueryAllowed
        charSet.insert(charactersIn: "#")
        self.init(string: encode.addingPercentEncoding(withAllowedCharacters: charSet).unwrap())
    }
}
