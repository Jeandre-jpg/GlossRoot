//
//  RegisterLoginViewModel.swift
//  Gloss
//
//  Created by Jeandré De Villiers on 2022/10/15.
//

import Foundation
import Firebase
import FirebaseAuth

class AuthManage: ObservableObject{
    // INSTANCE OF FIREBASE
    @Published var auth = Auth.auth()
    @Published var message: String = ""
    
    // FUNCTION TO HOLD SIGN UP USER
    func registerBeauty(email: String, password: String, name: String, surname: String, age: Int, gender: String, username: String, skintype: Int, skintone: Int, skinconcern: Int){
        auth.createUser(withEmail: email, password: password){ authResult, error in
            
            if(authResult != nil){
                print("\(authResult?.user.email ?? "")")
                Firestore.firestore().collection("beauties").document(authResult?.user.uid ?? "").setData([
                    "name": name,
                    "email": email,
                    "surname": surname,
                    "age": age,
                    "gender": gender,
                    "username": username,
                    "skintype": skintype == 1 ? "Dry" : skintype == 2 ? "Normal" : skintype == 3 ? "Combination" :  skintype == 4 ? "Oily" : "None",
                    "skintone": skintone == 1 ? "Light" : skintone == 2 ? "Medium" : skintone == 3 ? "Dark" : skintone == 4 ? "Medium Light" : skintone == 5 ? "Medium Dark" : "None",
                    "skinconcern": skinconcern == 1 ? "Acne": skinconcern == 2 ? "Dryness": skinconcern == 3 ? "Oily Skin": skinconcern == 4 ? "Eczema": skinconcern == 5 ? "Wrinkles": skinconcern == 6 ? "Dark Undereyes": skinconcern == 7 ? "Hyper-Pigmentation": skinconcern == 8 ? "Sensitivity": skinconcern == 9 ? "Scars" : "None"
                    //not password, because we don't want to see the user's password
                ]){err in
                    if let err = err {
                        print("Error writing user:\(err)")
                    }else{
                        print("User added")
                    }
                }
            }
           
            if(error != nil){
                print(error.debugDescription)
                self.message = error?.localizedDescription ?? ""
            }
        }
    }
    
    func signIn(email: String, password: String){
        auth.signIn(withEmail: email, password: password){ [weak self] authResult, error in
            
            guard self != nil else {return}
            
            if(authResult != nil){
                print("Signed In\(authResult?.user.email ?? "")")
            }
            if(error != nil){
                print(error.debugDescription)
                self?.message = error?.localizedDescription ?? ""
            }
        }
    }
    
    
   func signOut() {
        try? auth.signOut()
        UserDefaults.standard.removeObject(forKey: "beauties")
    }
    
}
