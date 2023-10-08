//
//  LogoTableViewCell.swift
//  ProjectOne
//
//  Created by Alexandre Robaert on 08/10/23.
//

import UIKit
import Kingfisher

class LogoTableViewCell: UITableViewCell {
    
    @IBOutlet weak var imageLogo: UIImageView!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var ticketValue: UILabel!
    
    func setupCell(imageURL: String, name: String, ticket: String) {
        imageLogo.loadImage(url: imageURL)
        self.name.text = name
        self.ticketValue.text = ticket
    }
}

extension UIImageView {
    
    func loadImage(url: String, placeHolder: UIImage = UIImage(resource: .notfound)) {
        if let url = URL(string: url) {
            self.kf.setImage(with: url, placeholder: placeHolder, options: [.transition(.fade(1))], completionHandler: nil)
        }
    }
}
