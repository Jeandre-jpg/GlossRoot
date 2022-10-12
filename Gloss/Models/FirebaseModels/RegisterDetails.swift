//
//  RegisterDetails.swift
//  Gloss
//
//  Created by Jeandré De Villiers on 2022/10/11.
//

import Foundation
import SwiftUI

struct RegisterDetails{
    var name: String
    var surname: String
    var email: String
    var age: Int
    var gender: String
    var password: String
    var username: String
    var skintype: Int
    var skintone: Int
    var skinconcern: String
}


extension RegisterDetails{
    
static var new: RegisterDetails{
    RegisterDetails(name: "", surname: "", email: "", age: 0, gender: "", password: "", username: "", skintype: 0, skintone: 0, skinconcern: "")
    }
    
}
