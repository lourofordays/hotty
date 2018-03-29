//
//  PreviewCameraViewController.swift
//  hotty
//
//  Created by Louis Régis on 28/03/2018.
//  Copyright © 2018 Louro. All rights reserved.
//

import UIKit

class PreviewCameraViewController: UIViewController {
    
    @IBOutlet weak var photo: UIImageView!
    var image: UIImage!

    override func viewDidLoad() {
        super.viewDidLoad()
        photo.image = self.image

        // Do any additional setup after loading the view.
    }

    @IBAction func cancelBtn_TouchUpInside(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func sendBtn_TouchUpInside(_ sender: Any) {
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
