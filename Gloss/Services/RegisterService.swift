//
//  RegisterService.swift
//  Gloss
//
//  Created by Jeandré De Villiers on 2022/10/11.
//

import Foundation
import SwiftUI
import Combine
import Firebase
import FirebaseDatabase

enum RegisterKeys:String{
    case name
    case surname
    case age
    case gender
    case username
    case skintype
    case skintone
    case skinconcern
}

protocol RegisterService{
    
    func register(with details: RegisterDetails) -> AnyPublisher<Void, Error>
}

final class RegisterServiceImpl: RegisterService{
    func register(with details: RegisterDetails) -> AnyPublisher<Void, Error> {
        
        
        Deferred{
            Future{promise in
                
                Auth.auth()
                    .createUser(withEmail: details.email, password: details.password){res, error in
                        
                        if let err = error{
                            promise(.failure(err))
                        }else{
                            
                            if let uid = res?.user.uid{
                                let values = [
                                    RegisterKeys.surname.rawValue:details.surname,
                                    RegisterKeys.age.rawValue:details.age,
                                    RegisterKeys.gender.rawValue:details.gender,
                                    RegisterKeys.username.rawValue:details.username,
                                    RegisterKeys.skintype.rawValue:details.skintype,
                                    RegisterKeys.skintone.rawValue:details.skintone,
                                    RegisterKeys.skinconcern.rawValue:details.skinconcern
                                ] as [String : Any]
                                
                                Database.database()
                                    .reference()
                                    .child("beauties")
                                    .child(uid)
                                    .updateChildValues(values){error, ref in
                                        if let err = error{
                                            promise(.failure(err))
                                        }else{
                                            promise(.success(()))
                                        }
                                    }
                                
                            }else{
                                promise(.failure(NSError(domain: "Invalid User ID", code:0, userInfo: nil)))
                            }
                        }
                    }
                
            }
        }
        .receive(on: RunLoop.main)
        .eraseToAnyPublisher()
        
        
    }
    
}

