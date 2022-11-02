//
//  SkinproductsViewModel.swift
//  Gloss
//
//  Created by Jeandré De Villiers on 2022/10/24.
//

import Foundation
import FirebaseFirestore
import Firebase

class SkinproductsViewModel: ObservableObject{
    @Published var skinproducts = [Skinproducts]()
    private var db = Firestore.firestore()
    
    
    init(){
        fetchSkinproducts()
    }
    
    func fetchSkinproducts(){
        db.collection("skinproducts").addSnapshotListener{(querySnapshot, error) in
            guard let documents = querySnapshot?.documents else{
                print("No skinproducts found")
                return
            }
            
            self.skinproducts = documents.map{(queryDocumentSnapshot) -> Skinproducts in
                let data = queryDocumentSnapshot.data()
                let category = data["category"] as? String ?? ""
                let description = data["description"] as? String ?? ""
                let image = data["image"] as? String ?? ""
                let ingredients = data["ingredients"] as? String ?? ""
                let name = data["name"] as? String ?? ""
                let price = data["price"] as? Int ?? 0
                let size = data["size"] as? String ?? ""
                let skinconcern = data["skinconcern"] as? String ?? ""
                let skintype = data["skintype"] as? String ?? ""
                let subtitle = data["subtitle"] as? String ?? ""
                let tutorial = data["tutorial"] as? String ?? ""
                let wherebuy = data["wherebuy"] as? String ?? ""
                
                return Skinproducts(category: category, description: description, image: image, ingredients: ingredients, name: name, price: 0, size: size, skinconcern: skinconcern, skintype: skintype, subtitle: subtitle, tutorial: tutorial, wherebuy: wherebuy)
            }
            
        }
    }
}
