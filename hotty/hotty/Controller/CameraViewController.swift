//
//  CameraViewController.swift
//  hotty
//
//  Created by Louis Régis on 28/03/2018.
//  Copyright © 2018 Louro. All rights reserved.
//

import UIKit

class CameraViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        performSegue(withIdentifier: TO_CAMERA, sender: nil)
    }

}
