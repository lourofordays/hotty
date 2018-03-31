//
//  SettingsVC.swift
//  hotty
//
//  Created by Louis Régis on 30.03.18.
//  Copyright © 2018 Louro. All rights reserved.
//

import UIKit
import FirebaseAuth


class SettingsVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func logoutBtnPressed(sender: Any) {
        do {
            try Auth.auth().signOut()
        }  catch let logoutError {
            print(logoutError)
        }
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let loginVC = storyboard.instantiateViewController(withIdentifier: "LoginVC")
        self.present(loginVC, animated: true, completion: nil)
    }

}
