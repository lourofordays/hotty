////
////  userApi.swift
////  hotty
////
////  Created by Louis Régis on 06.04.18.
////  Copyright © 2018 Louro. All rights reserved.
////
//
//import Foundation
//import FirebaseDatabase
//import FirebaseAuth
//class UserApi {
//    var REF_USERS = Database.database().reference().child("users")
//    
//    func observeUser(withId uid: String, completion: @escaping (User) -> Void) {
//        REF_USERS.child(uid).observeSingleEvent(of: .value, with: {
//            snapshot in
//            if let dict = snapshot.value as? [String: Any] {
//                let user = User.transformUser(dict: dict)
//                completion(user)
//            }
//        })
//    }
//    
//    func observeCurrentUser(completion: @escaping (User) -> Void) {
//        guard let currentUser = Auth.auth().currentUser else {
//            return
//        }
//        REF_USERS.child(currentUser.uid).observeSingleEvent(of: .value, with: {
//            snapshot in
//            if let dict = snapshot.value as? [String: Any] {
//                let user = User.transformUser(dict: dict)
//                completion(user)
//            }
//        })
//    }
//    
//    var CURRENT_USER: User? {
//        if let currentUser = Auth.auth().currentUser {
//            return currentUser
//        }
//        
//        return nil
//    }
//    
//    var REF_CURRENT_USER: DatabaseReference? {
//        guard let currentUser = Auth.auth().currentUser else {
//            return nil
//        }
//        
//        return REF_USERS.child(currentUser.uid)
//    }
//}
//
