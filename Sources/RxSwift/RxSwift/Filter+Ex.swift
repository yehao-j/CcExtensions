//
//  Filter+Ex.swift
//  CandyExtension
//
//  Created by 叶浩 on 2019/2/12.
//

import RxSwift

extension ObservableType {
    public func unwrap<T>() -> Observable<T> where E == T? {
        return filter { $0.isSome }.map { $0! }
    }
}
