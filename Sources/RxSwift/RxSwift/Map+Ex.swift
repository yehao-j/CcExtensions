//
//  Map+Ex.swift
//  CandyExtension
//
//  Created by 叶浩 on 2019/2/12.
//

import RxSwift
import RxCocoa

extension ObservableType {
    public func mapVoid() -> Observable<Void> {
        return map { _ in }
    }
}

extension ControlEvent {
    func mapVoid() -> Observable<Void> {
        return map { _ in }
    }
}
