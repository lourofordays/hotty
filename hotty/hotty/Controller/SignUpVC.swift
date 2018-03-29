//
//  SignUpVC.swift
//  hotty

//  Created by Louis Régis on 28.03.18.
//  Copyright © 2018 Louro. All rights reserved.
//

import UIKit
import FirebaseAuth

class SignUpVC: UIViewController {
    
    @IBOutlet weak var usernameTxtField: UITextField!
    @IBOutlet weak var passwordTxtField: UITextField!
    @IBOutlet weak var universityTxtField: UITextField!
    @IBOutlet weak var universityEmailTxtfield: UITextField!
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        view.bindToKeyboard()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func signUpBtnPressed(_ sender: Any) {
        
        Auth.auth().createUser(withEmail: "user1@gmail.com", password: "123456") { (user: User?, error: Error?) in
            if error != nil {
                print(error!.localizedDescription)
                return
            }
            print(user!)
        }
        performSegue(withIdentifier: TO_MY_MAP, sender: nil)
    }
    
    @IBAction func viewLoginBtnPressed(_ sender: Any) {
        performSegue(withIdentifier: VIEW_LOGIN, sender: nil)
    }
    
}
