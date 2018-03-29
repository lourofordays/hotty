//
//  PreviewCameraViewController.swift
//  hotty
//
//  Created by Louis Régis on 28/03/2018.
//  Copyright © 2018 Louro. All rights reserved.
//

import UIKit
import FirebaseStorage
import FirebaseDatabase


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
        
        if case let self.image = self.image,  let imageData = UIImageJPEGRepresentation(photo, 0.1) {
            let photoIdString = NSUUID().uuidString
            print(photoIdString)
            let storageRef = FIRStorage.storage().reference(forURL: Config.STORAGE_ROOF_REF).child("posts").child(photoIdString)
            storageRef.put(imageData, metadata: nil, completion: { (metadata, error) in
                if error != nil {
                    ProgressHUD.showError(error!.localizedDescription)
                    return
                }
                let photoUrl = metadata?.downloadURL()?.absoluteString
                self.sendDataToDatabase(photoUrl: photoUrl!)
            })
        } else {
            ProgressHUD.showError("Profile Image can't be empty")
        }
    }
    
    func sendDataToDatabase(photoUrl: String) {
        let ref = FIRDatabase.database().reference()
        let postsReference = ref.child("posts")
        let newPostId = postsReference.childByAutoId().key
        let newPostReference = postsReference.child(newPostId)
        newPostReference.setValue(["photoUrl": photoUrl], withCompletionBlock: {
            (error, ref) in
            if error != nil {
                ProgressHUD.showError(error!.localizedDescription)
                return
            }
            ProgressHUD.showSuccess("Success")
        
    
    
    }



)
}

}
