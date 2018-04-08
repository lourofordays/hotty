////
////  HeaderProfileCollectionReusableView.swift
////  hotty
////
////  Created by Louis Régis on 04/04/2018.
////  Copyright © 2018 Louro. All rights reserved.
////
//
//import UIKit
//
//class HeaderProfileCollectionReusableView: UICollectionReusableView {
//    
//    @IBOutlet weak var profileImage: UIImageView!
//    @IBOutlet weak var nameLabel: UILabel!
//    @IBOutlet weak var myPostsCountLabel: UILabel!
//    @IBOutlet weak var followingCountLabel: UILabel!
//    @IBOutlet weak var followersCountLabel: UILabel!
//    func updateView() {
//        UserApi.User.REF_CURRENT_USER?.observeSingleEvent(of: .value, with: {
//            snapshot in
//            if let dict = snapshot.value as? [String: Any] {
//                let user = User.transformUser(dict: dict)
//                self.nameLabel.text = user.username
//                if let photoUrlString = user.profileImageUrl {
//                    let photoUrl = URL(string: photoUrlString)
//                    self.profileImage.sd_setImage(with: photoUrl)
//                }
//            }
//        })
//    }
//}
// 

