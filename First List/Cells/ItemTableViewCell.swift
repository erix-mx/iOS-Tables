//
//  ItemTableViewCell.swift
//  First List
//
//  Created by Erix on 27/07/23.
//

import UIKit
import Kingfisher

class ItemTableViewCell: UITableViewCell {

    @IBOutlet weak var userImage: UIImageView!
    @IBOutlet weak var username: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        userImage.clipsToBounds = true
        userImage.layer.cornerRadius = userImage.frame.width / 2
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setupCell(
        username: String,
        urlImage: String
    ) {
        self.username.text = username
        let url = URL(string: urlImage)
        userImage.kf.setImage(with: url)
    }
}


