//
//  RegisterVC.swift
//
//  Created by Louis Régis on 28.03.18.
//  Copyright © 2018 Louro. All rights reserved.
//

import UIKit

class SignUpVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func signUpBtnPressed(_ sender: Any) {
        performSegue(withIdentifier: TO_MY_MAP, sender: nil)
    }
    
    @IBAction func viewLoginBtnPressed(_ sender: Any) {
        performSegue(withIdentifier: VIEW_LOGIN, sender: nil)
    }
    
}
