//
//  UIViewController+extension.swift
//  ProjectOne
//
//  Created by Alexandre Robaert on 14/10/23.
//

import Foundation
import UIKit

extension UIViewController {
    static func instantiateNIB() -> Self {
        func instantiateFromNib<T: UIViewController>() -> T {
            return T.init(nibName: String(describing: T.self), bundle: nil)
        }
        return instantiateFromNib()
    }
}
