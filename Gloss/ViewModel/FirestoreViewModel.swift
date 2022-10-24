//
//  FirestoreViewModel.swift
//  Gloss
//
//  Created by Jeandré De Villiers on 2022/10/23.
//

import Foundation
import SwiftUI
import FirebaseFirestore
import Firebase
import FirebaseAuth

class FirestoreViewModel: ObservableObject {
    
    static var db = Firestore.firestore()
    
    static func fetchUser(uid:String,onSuccess:@escaping(_ user:Beauty) -> Void){
        db.collection("beauties").document(uid).getDocument{(doc,err) in
            guard let user = doc else {return}
            
            let name = user.data()?["name"] as? String ?? ""
            let surname = user.data()?["surname"] as? String ?? ""
            let age = user.data()?["age"] as? Int ?? 0
            let email = user.data()?["email"] as? String ?? ""
            let gender = user.data()?["gender"] as? String ?? ""
            let skinconcern = user.data()?["skinconcern"] as? Int ?? 0
            let skintone = user.data()?["skintone"] as? Int ?? 0
            let skintype = user.data()?["skintype"] as? Int ?? 0
            let username = user.data()?["username"] as? String ?? ""
            
            print("beauty fetched")
            onSuccess(Beauty(name: name, surname: surname, age: 0, email: email, gender: gender, skinconcern: 0, skintone: 0, skintype: 0, username: username))
        }
    }
}
