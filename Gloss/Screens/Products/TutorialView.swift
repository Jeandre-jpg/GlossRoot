//
//  TutorialView.swift
//  Gloss
//
//  Created by Jeandré De Villiers on 2022/10/25.
//

import SwiftUI
import SDWebImageSwiftUI

struct TutorialView: View {
    var beautyproduct : Beautyproducts
    var i = 0
    
    var body: some View {
        VStack{
            
          
                ForEach(0..<beautyproduct.steps.count, id: \.self){step in
                   
                        
                        
                        HStack(spacing: 0){
                            ForEach(boarding){screen in
                                VStack{
                                    ZStack{
                                        RoundedRectangle(cornerRadius: 20, style: .continuous)
                                            .fill(Color("White"))
                                            .frame(width: 400, height: 300)
                                            .opacity(1)
                                        
                                        
                                        WebImage(url: URL(string:beautyproduct.steps[step].image))
                                            .resizable()
                                            .aspectRatio(contentMode: .fit)
                                            .frame(width: 300, height: 200)
                                    }
                                    .padding(.top,
                                             -370)
                                    
                                    
                                    
                                    VStack(spacing: 10){
                                        Text(beautyproduct.steps[step].title)
                                            .font(.custom("DreamAvenue", size: 40))
                                            .foregroundColor(Color("Black"))
                                            .padding(.leading, -170)
                                            .padding(.top, 5)
                                    }
                                    
                                    VStack(spacing: 10){
                                        Text(beautyproduct.steps[step].description)
                                            .font(.custom("Livvic-Regular", size: 15))
                                            .foregroundColor(Color("Black"))
                                            .multilineTextAlignment(.center)
                                            .padding(.top, -130)
                                        
                                        
                                        Button{
                                            
                                        }label: {
                                            
                                            Text("Next Step")
                                               .font(.custom("Livvic-Regular", size: 15))
                                               .foregroundColor(Color("Black"))
                                               .padding(10)
                                               .multilineTextAlignment(.trailing)
                                               .underline()
                                       
                                        }
                                    }
                                    .frame(width: 270, height: 100, alignment: .center)
                                    
                                   
                                    
                                }
                                .ignoresSafeArea(.container, edges: .all)
                                .frame(width: getScreenBounds().width)
                                .frame(maxHeight: .infinity)
                                
                            }
                        }
                        .background(Color("Pink"))
                    }
            }
        }
    }


struct TutorialView_Previews: PreviewProvider {
    static var previews: some View {
        TutorialView(beautyproduct: Beautyproducts(id: "", category: "", description: "", image: "", ingredients: "", name: "", price: 0, shades: 0, size: "", skintone: "", steps: [Steps( title: "", description: "", image: "")], subtitle: "", tutorial: "", wherebuy: ""))
    }
}
