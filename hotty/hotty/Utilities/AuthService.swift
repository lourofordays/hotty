//
//  AuthService.swift
//  hotty
//
//  Created by Louis Régis on 30.03.18.
//  Copyright © 2018 Louro. All rights reserved.
//

import Foundation
import FirebaseAuth
import FirebaseDatabase
import FirebaseStorage
class AuthService {
    
    static func signIn(email: String, password: String, onSuccess: @escaping () -> Void, onError: @escaping (_ errorMessage: String?) -> Void) {
        Auth.auth().signIn(withEmail: email, password: password) { (user, error) in
            if error != nil {
                onError(error!.localizedDescription)
                
                return
            }
            onSuccess()
            print("success")
        }
    }
    static func signUp(username: String, email: String, password: String, university: String, onSuccess: @escaping () -> Void, onError: @escaping (_ errorMessage: String?) -> Void) {
        Auth.auth().createUser(withEmail: email, password: password, completion: { (user: User?, error: Error?) in
            if error != nil {
                onError(error!.localizedDescription)
                return
            }
            let uid = user?.uid
            setUserInfo(username: username, email: email, university: university, uid: uid!, onSuccess: onSuccess)
        })
    }
    
    static func setUserInfo(username:String, email: String, university: String, uid: String, onSuccess: @escaping () -> Void) {
        let ref = Database.database().reference()
        let userReferences = ref.child("users")
        let newUserReference = userReferences.child(uid)
        newUserReference.setValue(["username": username, "university": university, "universityEmail": email])
        onSuccess()
    }
}
