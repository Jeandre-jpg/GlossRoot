//
//  BeautyproductsViewModel.swift
//  Gloss
//
//  Created by Jeandré De Villiers on 2022/10/24.
//
import Foundation
import FirebaseFirestore
import Firebase

class BeautyproductsViewModel: ObservableObject{
    @Published var beautyproducts = [Beautyproducts]()
    @Published public var steps = [Steps]()
    private var db = Firestore.firestore()
    
    func fetchBeautyproducts(){
        db.collection("beautyproducts").addSnapshotListener{(querySnapshot, error) in
            guard let documents = querySnapshot?.documents else{
                print("No beautyproducts found")
                return
            }
            
            self.beautyproducts = documents.map{(queryDocumentSnapshot) -> Beautyproducts in
                let data = queryDocumentSnapshot.data()
                let category = data["category"] as? String ?? ""
                let description = data["description"] as? String ?? ""
                let image = data["image"] as? String ?? ""
                let ingredients = data["ingredients"] as? String ?? ""
                let name = data["name"] as? String ?? ""
                let price = data["price"] as? Int ?? 0
                let shades = data["shades"] as? Int ?? 0
                let size = data["size"] as? String ?? ""
                let skintone = data["skintone"] as? String ?? ""
                let steps = data["steps"] as? [String : [String : Any]]
                let subtitle = data["subtitle"] as? String ?? ""
                let tutorial = data["tutorial"] as? String ?? ""
                let wherebuy = data["wherebuy"] as? String ?? ""
                
                var stepsArray = [Steps]()
                if let steps = steps{
                    for step in steps{
                        let title = data["title"] as? String ?? ""
                        let description = data["description"] as? String ?? ""
                        let image = data["image"] as? String ?? ""
                        stepsArray.append(Steps(title: title, description: description, image: image))
                    }
                }
                
                return Beautyproducts(category: category, description: description, image: image, ingredients: ingredients, name: name, price: 0, shades: 0, size: size, skintone: skintone, steps: stepsArray, subtitle: subtitle, tutorial: tutorial, wherebuy: wherebuy)
            }
            
        }
    }
}
