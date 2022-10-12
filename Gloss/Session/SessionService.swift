//
//  SessionService.swift
//  Gloss
//
//  Created by Jeandré De Villiers on 2022/10/11.
//

import Foundation
import Combine
import FirebaseAuth
import FirebaseDatabase

enum SessionState{
    case LoggedIn
    case LoggedOut
}

protocol SessionService {
    var state: SessionState {get}
    var userDetails: SessionUserDetails? {get}
    func logout()
}

final class SessionServiceImpl: ObservableObject, SessionService{
    @Published var state: SessionState = .LoggedOut
    @Published var userDetails: SessionUserDetails?
    
    private var handler: AuthStateDidChangeListenerHandle?
    
    init(){
        setupFirebaseAuthHandler()
    }
    
    func logout() {
        try? Auth.auth().signOut()
        
    }
}
    
private extension SessionServiceImpl{
    func setupFirebaseAuthHandler(){
        handler = Auth
            .auth()
            .addStateDidChangeListener{ [weak self] res, user in
                guard let self = self else {return}
                self.state = user == nil ? .LoggedOut : .LoggedIn
                if let uid = user?.uid{
                    self.handleUserRefresh(with: uid)
                }
            }
    }
    
    
    func handleUserRefresh(with uid: String){
        Database
            .database()
            .reference()
            .child("beauties")
            .child(uid)
            .observe(.value) { [weak self] snapshot,_ in
                
                guard let self = self,
                      let value = snapshot.value as? NSDictionary,
                      let name = value[RegisterKeys.name.rawValue] as? String,
                      let surname = value[RegisterKeys.surname.rawValue] as? String,
                      let age = value[RegisterKeys.age.rawValue] as? Int,
                      let gender = value[RegisterKeys.gender.rawValue] as? String,
                      let username = value[RegisterKeys.username.rawValue] as? String,
                      let skintype = value[RegisterKeys.skintype.rawValue] as? Int,
                      let skintone = value[RegisterKeys.skintone.rawValue] as? Int,
                      let skinconcern = value[RegisterKeys.skinconcern.rawValue] as? String else{
                    return
                }
                DispatchQueue.main.async{
                    self.userDetails = SessionUserDetails(name: name, surname: surname, age: Int(age) , gender: gender, username: username, skintype: Int(skintype) , skintone: Int(skintone) , skinconcern: skinconcern)
                }
            }
    }
}

