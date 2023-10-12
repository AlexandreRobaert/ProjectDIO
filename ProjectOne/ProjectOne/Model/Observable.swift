//
//  Observable.swift
//  ProjectOne
//
//  Created by Alexandre Robaert on 12/10/23.
//

import Foundation

final class Observable<T> {
    
    var value: T? {
        didSet {
            callListners()
        }
    }
    
    private var listners: [(T?) -> Void] = []
    
    init(value: T?) {
        self.value = value
        
    }
    
    func bindAndCall(_ listner: @escaping (T?) -> Void) {
        listner(value)
        listners.append(listner)
    }
    
    func bind(_ listner: @escaping (T?) -> Void) {
        listners.append(listner)
    }
    
    private func callListners() {
        listners.forEach { listner in
            listner(value)
        }
    }
}
