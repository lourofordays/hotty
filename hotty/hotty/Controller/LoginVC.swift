//
//  LoginVC.swift
//  hotty
//
//  Created by Louis Régis on 28.03.18.
//  Copyright © 2018 Louro. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth
import FirebaseDatabase
import FirebaseStorage

class LoginVC: UIViewController {
    
    @IBOutlet weak var universityEmailTxtField: UITextField!
    @IBOutlet weak var passwordTxtField: UITextField!
    
    @IBOutlet weak var loginBtn: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.bindToKeyboard()
        let tap = UITapGestureRecognizer(target: self, action: #selector(LoginVC.handleTap))
        view.addGestureRecognizer(tap)
        handleTextFields()
        loginBtn.isEnabled = false
        
        universityEmailTxtField.backgroundColor = UIColor.clear
        universityEmailTxtField.textColor = UIColor.black
        universityEmailTxtField.attributedPlaceholder = NSAttributedString(string: universityEmailTxtField.placeholder!, attributes: [NSAttributedStringKey.foregroundColor: UIColor(white: 0.0, alpha: 0.5)])
        passwordTxtField.backgroundColor = UIColor.clear
        passwordTxtField.textColor = UIColor.black
        passwordTxtField.attributedPlaceholder = NSAttributedString(string: passwordTxtField.placeholder!, attributes: [NSAttributedStringKey.foregroundColor: UIColor(white: 0.0, alpha: 0.5)])
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        if Auth.auth().currentUser != nil {
            self.performSegue(withIdentifier: TO_LOGIN, sender: nil)
        }
    }
    
    func handleTextFields() {
        universityEmailTxtField.addTarget(self, action: #selector(SignUpVC.textFieldDidChange), for: UIControlEvents.editingChanged)
        passwordTxtField.addTarget(self, action: #selector(SignUpVC.textFieldDidChange), for: UIControlEvents.editingChanged)
        
    }
    
    @objc func textFieldDidChange() {
        guard let password = passwordTxtField.text, !password.isEmpty, let universityEmail = universityEmailTxtField.text, !universityEmail.isEmpty else {
            loginBtn.setTitleColor(UIColor.lightText, for: UIControlState.normal)
            loginBtn.isEnabled = false
            return
        }
        
        loginBtn.setTitleColor(UIColor.white, for: UIControlState.normal)
        loginBtn.isEnabled = true
    }
    
    @IBAction func loginBtnPressed(_ sender: Any) {
        ProgressHUD.show("Waiting", interaction: false)
        AuthService.signIn(email: universityEmailTxtField.text!, password: passwordTxtField.text!, onSuccess: {
            ProgressHUD.showSuccess("Welcome Back!")
            self.performSegue(withIdentifier: TO_LOGIN, sender: nil)
        }, onError: { error in
            ProgressHUD.showError("OOPS!")
        })
        
        //        // if text fields are empty
        //        if (passwordTxtField.text?.isEmpty)! || (universityEmailTxtField.text?.isEmpty)! {
        //
        //            //alert message
        //            let alert = UIAlertController(title: "OOPS!", message: "Please fill all fields", preferredStyle: UIAlertControllerStyle.alert)
        //            let ok = UIAlertAction(title: "OK", style: UIAlertActionStyle.cancel, handler: nil)
        //            alert.addAction(ok)
        //            self.present(alert, animated: true, completion: nil)
        //        }
        
    }
    @IBAction func viewSignUpBtn(_ sender: Any) {
        performSegue(withIdentifier: VIEW_SIGN_UP, sender: nil)
    }
    
    @objc func handleTap() {
        view.endEditing(true)
    }
    
}
