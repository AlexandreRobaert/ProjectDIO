//
//  LogoTableViewCell.swift
//  ProjectOne
//
//  Created by Alexandre Robaert on 08/10/23.
//

import UIKit
import Kingfisher

extension UITableViewCell {
    static var identifier: String {
        String(describing: self)
    }
}

class LogoTableViewCell: UITableViewCell {
    
    @IBOutlet weak var imageLogo: UIImageView!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var ticketValue: UILabel!
    
    func setupCell(model: LogoModel) {
        self.name.text = model.name
        self.ticketValue.text = model.ticker
        imageLogo.loadImage(url: model.imageURL)
    }
}

extension UIImageView {
    
    func loadImage(url: String, placeHolder: UIImage = UIImage(resource: .notfound)) {
        if let url = URL(string: url) {
            self.kf.setImage(with: url, placeholder: placeHolder, options: [.transition(.fade(1))], completionHandler: nil)
        }
    }
}
