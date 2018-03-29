//
//  RegisterVC.swift
//
//  Created by Louis Régis on 28.03.18.
//  Copyright © 2018 Louro. All rights reserved.
//

import UIKit
import FirebaseAuth

class SignUpVC: UIViewController {
    


    override func viewDidLoad() {
        super.viewDidLoad()
        view.bindToKeyboard()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
