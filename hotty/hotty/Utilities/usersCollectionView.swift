//
//  usersCollectionView.swift
//  hotty
//
//  Created by Louis Régis on 06.04.18.
//  Copyright © 2018 Louro. All rights reserved.
//

import UIKit

class usersCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var userNameLbl: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        self.userNameLbl.textAlignment = .center
        self.imageView.layer.cornerRadius = self.imageView.frame.size.height / 2;
        self.imageView.layer.borderColor = UIColor.red.cgColor
        self.imageView.layer.borderWidth = 3
        self.imageView.clipsToBounds = true
    }
}

