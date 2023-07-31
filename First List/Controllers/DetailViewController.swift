//
//  DetailViewController.swift
//  First List
//
//  Created by Erix on 29/07/23.
//

import UIKit
import Kingfisher

class DetailViewController: UIViewController {

    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var image: UIImageView!
        
    
    var imageUrl: String = "https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_1280.png"
    var itemName: String = "Unknown"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let url = URL(string: imageUrl) {
            image.layer.cornerRadius = image.frame.width / 2
            image.kf.setImage(with: url)
            name.text = itemName
        }
        
    }
}
