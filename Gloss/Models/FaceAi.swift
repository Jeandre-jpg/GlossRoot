//
//  FaceAi.swift
//  Gloss
//
//  Created by Jeandré De Villiers on 2022/10/17.
//

import SwiftUI

struct Face: Identifiable {
    var id = UUID().uuidString
    var image: String
    var title: String
    var description: String
}

var face: [Face] = [
    Face(image: "faceai", title: "Let's get you set up!", description: "Please scan your face within our borders"),
    Face(image: "loader", title: "Discover your skinconcerns", description: "We are dedicated to reach your skin goals!"),
    Face(image: "faceai", title: "Complete!", description: "Here is your diagnostics from Gloss.")
]

