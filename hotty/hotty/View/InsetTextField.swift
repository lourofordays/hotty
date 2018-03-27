//
//  InsetTextField.swift
//  hottie
//
//  Created by Louis Régis on 24.03.18.
//  Copyright © 2018 Louro. All rights reserved.
//

import UIKit

class InsetTextField: UITextField {

   private var padding = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 0)
    
    override func awakeFromNib() {
        setupView()
        super.awakeFromNib()
    }
    
    override func textRect(forBounds bounds: CGRect) -> CGRect {
        return UIEdgeInsetsInsetRect(bounds, padding)
    }

    override func editingRect(forBounds bounds: CGRect) -> CGRect {
        return UIEdgeInsetsInsetRect(bounds, padding)
    }
    
    override func placeholderRect(forBounds bounds: CGRect) -> CGRect {
        return UIEdgeInsetsInsetRect(bounds, padding)
    }
    
    func setupView() {
        let placeholder = NSAttributedString(string: self.placeholder!, attributes: [NSAttributedStringKey.foregroundColor: #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)])
        
        self.attributedPlaceholder = placeholder
    }
    
    
}
