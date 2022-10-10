//
//  Boarding.swift
//  Gloss
//
//  Created by Jeandré De Villiers on 2022/10/02.
//

import SwiftUI

struct Boarding: Identifiable {
    var id = UUID().uuidString
    var image: String
    var title: String
    var description: String
}

var boarding: [Boarding] = [
    Boarding(image: "welcome", title: "Welcome", description: "We believe in proving the best skin care recommendations for any age, gender, ethnicity"),
    Boarding(image: "search", title: "Search & Discover", description: "We have dedicated set of products and routines hand picked for every skin type."),
    Boarding(image: "face", title: "Face Scan", description: "For better results, use our skin sensor tool to scan your face and detect areas you need to work on.")
]
