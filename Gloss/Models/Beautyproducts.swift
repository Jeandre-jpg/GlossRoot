//
//  Beautyproducts.swift
//  Gloss
//
//  Created by Jeandré De Villiers on 2022/10/24.
//

import Foundation

struct Beautyproducts: Identifiable{
    var id: String = UUID().uuidString
    var category: String
    var description: String
    var image: String
    var ingredients: String
    var name: String
    var price: Int
    var shades: Int
    var size: String
    var skintone: String
    var steps: [Steps]
    var subtitle: String
    var tutorial: String
    var wherebuy: String
}

struct Steps: Identifiable{
    var id = UUID()
    var title: String
    var description: String
    var image: String
}
