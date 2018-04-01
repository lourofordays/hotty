//
//  PreviewCameraViewController.swift
//  hotty
//
//  Created by Louis Régis on 28/03/2018.
//  Copyright © 2018 Louro. All rights reserved.
//

import UIKit
import CoreML
import Vision
import FirebaseStorage
import FirebaseDatabase


class PreviewCameraVC: UIViewController {
    
    @IBOutlet weak var photo: UIImageView!
    var image: UIImage!

    override func viewDidLoad() {
        super.viewDidLoad()
        photo.image = self.image
//        detectPhoto(image: photo.image!)

        // Do any additional setup after loading the view.
    }

    @IBAction func cancelBtn_TouchUpInside(_ sender: Any) {
        dismiss(animated: true, completion: nil)
        
    }
    
    @IBAction func sendBtn_TouchUpInside(_ sender: Any) {
        ProgressHUD.show("Posting", interaction: false)
        let photo: UIImage = self.image
        if self.image == self.image,  let imageData = UIImageJPEGRepresentation(photo, 0.1) {
            let photoIdString = NSUUID().uuidString
            print(photoIdString)
            let storageRef = Storage.storage().reference(forURL: Config.STORAGE_ROOT_REF).child("posts").child(photoIdString)
            storageRef.putData(imageData, metadata: nil, completion: { (metadata, error) in
                if error != nil {
                    return
                }
                let photoUrl = metadata?.downloadURL()?.absoluteString
                self.sendDataToDatabase(photoUrl: photoUrl!)
            })
        } else {
            ProgressHUD.showError("Interest can't be empty")
        }
    }
    
    func sendDataToDatabase(photoUrl: String) {
        let ref = Database.database().reference()
        let postsReference = ref.child("posts")
        let newPostId = postsReference.childByAutoId().key
        let newPostReference = postsReference.child(newPostId)
        newPostReference.setValue(["photoUrl": photoUrl], withCompletionBlock: {
            (error, ref) in
            if error != nil {
                ProgressHUD.showError(error!.localizedDescription)
                return
            }
            ProgressHUD.showSuccess("Posted!")
        }
    )}

//    func detectPhoto(image: UIImage!) {
//        guard let ciImage = CIImage(image: image) else {
//            fatalError("Could not convert UIImage to CIImage")
//        }
//        guard let model = try? VNCoreMLModel(for: Inceptionv3().model)
//            else {
//            fatalError("Cannot identify object")
//        }
//        let request = VNCoreMLRequest(model: model) { (vnRequest, error) in
//            print(vnRequest.results?.first as Any)
//            guard let results = vnRequest.results as? [VNClassificationObservation] else {
//                fatalError("Unexpected Result")
//            }
//            print(results.first!.confidence)
//            print(results.first!.identifier)
//        }
//
//        let handler = VNImageRequestHandler(ciImage: ciImage)
//        DispatchQueue.global(qos: DispatchQoS.QoSClass.userInteractive).async {
//            do {
//                try handler.perform([request])
//            }   catch {
//                print(error)
//            }
//        }
//    }
}


