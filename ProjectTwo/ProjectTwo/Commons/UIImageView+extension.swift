//
//  UIImageView+extension.swift
//  ProjectTwo
//
//  Created by Alexandre Robaert on 14/10/23.
//

import UIKit
import Kingfisher
import Foundation

extension UIImageView {
    
    func loadImage(url: String, placeHolder: UIImage = UIImage(resource: .notfound)) {
        if let url = URL(string: url) {
            self.kf.setImage(with: url, placeholder: placeHolder, options: [.transition(.fade(1))], completionHandler: nil)
        }
    }
}
