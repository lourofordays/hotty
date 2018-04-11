//
//  SignUpVC.swift
//  hotty

//  Created by Louis Régis on 28.03.18.
//  Copyright © 2018 Louro. All rights reserved.
//

import UIKit
import FirebaseAuth
import FirebaseDatabase
import FirebaseStorage

class SignUpVC: UIViewController {
    
    @IBOutlet weak var usernameTxtField: UITextField!
    @IBOutlet weak var passwordTxtField: UITextField!
    @IBOutlet weak var universityTxtField: UITextField!
    @IBOutlet weak var universityEmailTxtField: UITextField!
    
    @IBOutlet weak var signUpBtn: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.bindToKeyboard()
        let tap = UITapGestureRecognizer(target: self, action: #selector(SignUpVC.handleTap))
        view.addGestureRecognizer(tap)
        handleTextFields()
        signUpBtn.isEnabled = false
        
        usernameTxtField.backgroundColor = UIColor.clear
        usernameTxtField.textColor = UIColor.black
        usernameTxtField.attributedPlaceholder = NSAttributedString(string: usernameTxtField.placeholder!, attributes: [NSAttributedStringKey.foregroundColor: UIColor(white: 0.0, alpha: 0.5)])
        passwordTxtField.backgroundColor = UIColor.clear
        passwordTxtField.textColor = UIColor.black
        passwordTxtField.attributedPlaceholder = NSAttributedString(string: passwordTxtField.placeholder!, attributes: [NSAttributedStringKey.foregroundColor: UIColor(white: 0.0, alpha: 0.5)])
        universityTxtField.backgroundColor = UIColor.clear
        universityTxtField.textColor = UIColor.black
        universityTxtField.attributedPlaceholder = NSAttributedString(string: universityTxtField.placeholder!, attributes: [NSAttributedStringKey.foregroundColor: UIColor(white: 0.0, alpha: 0.5)])
        universityEmailTxtField.backgroundColor = UIColor.clear
        universityEmailTxtField.textColor = UIColor.black
        universityEmailTxtField.attributedPlaceholder = NSAttributedString(string: universityEmailTxtField.placeholder!, attributes: [NSAttributedStringKey.foregroundColor: UIColor(white: 0.0, alpha: 0.5)])
    }
    
    func handleTextFields() {
        usernameTxtField.addTarget(self, action: #selector(SignUpVC.textFieldDidChange), for: UIControlEvents.editingChanged)
        passwordTxtField.addTarget(self, action: #selector(SignUpVC.textFieldDidChange), for: UIControlEvents.editingChanged)
        universityTxtField.addTarget(self, action: #selector(SignUpVC.textFieldDidChange), for: UIControlEvents.editingChanged)
        universityEmailTxtField.addTarget(self, action: #selector(SignUpVC.textFieldDidChange), for: UIControlEvents.editingChanged)
    }
    
    @objc func textFieldDidChange() {
        guard let username = usernameTxtField.text, username.isEmpty, let password = passwordTxtField.text, password.isEmpty, let university = universityTxtField.text, university.isEmpty, let universityEmail = universityEmailTxtField.text, universityEmail.isEmpty else {
            signUpBtn.setTitleColor(UIColor.lightText, for: UIControlState.normal)
            signUpBtn.isEnabled = false
            return
        }
        
        signUpBtn.setTitleColor(UIColor.white, for: UIControlState.normal)
        signUpBtn.isEnabled = true
    }
    
    @IBAction func signUpBtnPressed(_ sender: Any) {
        ProgressHUD.show("Waiting", interaction: false)
        AuthService.signUp(username: usernameTxtField.text!, email: universityEmailTxtField.text!, password: passwordTxtField.text!, university: universityTxtField.text!, onSuccess: {
            ProgressHUD.showSuccess("Welcome to your map!")
            self.performSegue(withIdentifier: TO_MY_MAP, sender: nil)
        }, onError: { (errorString) in
            ProgressHUD.showError("OOPS!")
        })
        
    }
    
    @IBAction func viewLoginBtnPressed(_ sender: Any) {
        performSegue(withIdentifier: VIEW_LOGIN, sender: nil)
    }
    
    @objc func handleTap() {
        view.endEditing(true)
    }
    
}
