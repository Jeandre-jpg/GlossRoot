//
//  Skinproducts.swift
//  Gloss
//
//  Created by Jeandré De Villiers on 2022/10/24.
//

import Foundation

struct Skinproducts: Identifiable{
    var id: String = UUID().uuidString
    var category: String
    var description: String
    var image: String
    var ingredients: String
    var name: String
    var price: Int
    var size: String
    var skinconcern: String
    var skintype: String
    var subtitle: String
    var tutorial: String
    var wherebuy: String
}
