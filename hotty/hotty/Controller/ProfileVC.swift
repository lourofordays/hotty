////
////  ProfileVC.swift
////  hotty
////
////  Created by Louis Régis on 28.03.18.
////  Copyright © 2018 Louro. All rights reserved.
////
//
//import UIKit
//import FirebaseDatabase
//import FirebaseStorage
//
//
//class ProfileVC: UIViewController {
//    @IBOutlet weak var collectionView: UICollectionView!
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        collectionView.dataSource = self
//    }
//}
//
//extension ProfileVC: UICollectionViewDataSource {
//    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        return 1
//    }
//    
//    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PhotoCell", for: indexPath)
//        return cell
//    }
//    
//    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
//        let headerViewCell = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionElementKindSectionHeader, withReuseIdentifier: "HeaderProfileCollectionReusableView", for: indexPath) as! HeaderProfileCollectionReusableView
//        headerViewCell.updateView()
//        return headerViewCell
//    }
//}
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
////class ProfileVC: UIViewController {
////
////    @IBOutlet weak var profileImage: UIImageView!
////    
////    var selectedImage: UIImage?
////    
////    override func viewDidLoad() {
////        super.viewDidLoad()
////        
////        view.backgroundColor = .white
////
////        profileImage.layer.cornerRadius = 40
////        profileImage.clipsToBounds = true
////     
////        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(ProfileVC.handleSelectProfileImage))
////        profileImage.addGestureRecognizer(tapGesture)
////        profileImage.isUserInteractionEnabled = true
////    }
////
////    let storageRef = Storage.storage().reference(forURL: Config.STORAGE_ROOT_REF).child("profile_image").child(uid!)
////    if let profileImage = selectedImage
////    let imageData = UIImageJPEGRepresentation(profileImage, 0.1) {
////        storageRef.put(imageData, metadata: nil, completion { (metadata,Error)
////            if Error != nil {
////                return
////            }
////            
////            let profileImageUrl = metadata?.downloadURL()?.absoluteString
////    })
////   
////    
////    @objc func handleSelectProfileImage() {
////        let pickerController = UIImagePickerController()
////        pickerController.delegate = self
////        present(pickerController, animated: true, completion: nil)
////    }
////}
////
////extension ProfileVC: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
////    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
////        let image = info["UIImagePickerControllerOriginalImage"] as? UIImage {
////            selectedImage = image
////            profileImage.image = image
////        }
////        dismiss(animated: true, completion: nil)
////    }
////}
//
