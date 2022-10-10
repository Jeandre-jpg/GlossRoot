//
//  BoardRegister.swift
//  Gloss
//
//  Created by Jeandré De Villiers on 2022/10/09.
//

import SwiftUI

struct BoardRegister: Identifiable{
    var id = UUID().uuidString
    var image: String
    var title: String
    var description: String
}

var boardReg: [BoardRegister] = [
    BoardRegister(image: "Add", title: "Create an Account", description: "Sign up now to get started with an account."),
    BoardRegister(image: "Add", title: "Create an Account", description: "Sign up now to get started with an account."),
    BoardRegister(image: "Add", title: "Create an Account", description: "Sign up now to get started with an account."),
    BoardRegister(image: "Add", title: "Create an Account", description: "Sign up now to get started with an account."),
    BoardRegister(image: "Add", title: "Create an Account", description: "Sign up now to get started with an account.")
]
