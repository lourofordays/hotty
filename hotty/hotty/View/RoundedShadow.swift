//
//  RoundedShadow.swift
//  hottie
//
//  Created by Louis Régis on 21/03/2018.
//  Copyright © 2018 Louro. All rights reserved.
//

import UIKit

class RoundedShadow: UIView {

    override func awakeFromNib(){
        self.layer.shadowColor = UIColor.darkGray.cgColor
        self.layer.shadowRadius = 15
        self.layer.shadowOpacity = 0.75
        self.layer.cornerRadius = self.frame.height / 2

    
    }
    

}
