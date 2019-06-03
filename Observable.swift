//
//  Observable.swift
//
//  Created by Arthur Chambriard.
//  Copyright © 2019 Arthur Chambriard. All rights reserved.
//

import Foundation

class Observable<T> {
    var value: T {
        didSet {
            self.valueChanged?(self.value)
        }
    }
    
    private var valueChanged: ((T) -> Void)?
    
    init(value: T) {
        self.value = value
    }
    
    deinit {
        removeObserver()
    }
    
    // Add closure as an observer and trigger the closure immediately if fireNow = true
    func addObserver(fireNow: Bool = true, _ onChange: ((T) -> Void)?) {
        valueChanged = onChange
        if fireNow {
            onChange?(value)
        }
    }
    
    func removeObserver() {
        valueChanged = nil
    }
}
