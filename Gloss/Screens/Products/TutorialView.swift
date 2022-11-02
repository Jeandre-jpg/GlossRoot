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
 
    @State var index: Int = 0
    
    var body: some View {
        VStack{
            
            
                if index == beautyproduct.steps.count - 1{
                    //nav link
                }else{
                    Button(action: {
                       index += 1
                        print(beautyproduct)
                    }, label :{
                        Text("Next")
                    })
                }
                
            
            
            Text(beautyproduct.steps[index].title)
            Text(beautyproduct.steps[index].description)
            WebImage(url: URL(string:beautyproduct.steps[index].image))
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 300, height: 200)
            
   
        
            ForEach(0..<beautyproduct.steps.count, id: \.self){step in
                
                
                   
                
        
               
                
               
                
//
//                        HStack(spacing: 0){
//                            ForEach(boarding){screen in
//                                VStack{
//                                    ZStack{
//                                        RoundedRectangle(cornerRadius: 20, style: .continuous)
//                                            .fill(Color("White"))
//                                            .frame(width: 400, height: 300)
//                                            .opacity(1)
//
//
//                                        WebImage(url: URL(string:beautyproduct.steps[step].image))
//                                            .resizable()
//                                            .aspectRatio(contentMode: .fit)
//                                            .frame(width: 300, height: 200)
//                                    }
//                                    .padding(.top,
//                                             -370)
//
//
//
//                                    VStack(spacing: 10){
//                                        Text(beautyproduct.steps[step].title)
//                                            .font(.custom("DreamAvenue", size: 40))
//                                            .foregroundColor(Color("Black"))
//                                            .padding(.leading, -170)
//                                            .padding(.top, 5)
//                                    }
//
//                                    VStack(spacing: 10){
//                                        Text(beautyproduct.steps[step].description)
//                                            .font(.custom("Livvic-Regular", size: 15))
//                                            .foregroundColor(Color("Black"))
//                                            .multilineTextAlignment(.center)
//                                            .padding(.top, -130)
//
//
//                                        Button{
//
//                                        }label: {
//
//                                            Text("Next Step")
//                                               .font(.custom("Livvic-Regular", size: 15))
//                                               .foregroundColor(Color("Black"))
//                                               .padding(10)
//                                               .multilineTextAlignment(.trailing)
//                                               .underline()
//
//                                        }
//                                    }
//                                    .frame(width: 270, height: 100, alignment: .center)
//
//
//
//                                }
//                                .ignoresSafeArea(.container, edges: .all)
//                                .frame(width: getScreenBounds().width)
//                                .frame(maxHeight: .infinity)
//
//                            }
//                        }
//                        .background(Color("Pink"))
                    }
            }
        }
    }


struct TutorialView_Previews: PreviewProvider {
    static var previews: some View {
        TutorialView(beautyproduct: Beautyproducts(category: "", description: "", image: "", ingredients: "", name: "", price: 0, shades: 0, size: "", skintone: "", steps: [Steps( title: "Swipe on some sunshine", description: "Start by dusting a deep yellow eyeshadow shade, like the one in the ‘Hi-Rise Sunset’ City Mini Eyeshadow Palette, over your full eyelid. Be sure to apply eyeshadow makeup to your bottom lash line as well!", image: "https://firebasestorage.googleapis.com/v0/b/glossroot.appspot.com/o/eyeshadow__2_beautyproduct_1.jpeg?alt=media&token=0eae3d15-f088-44f0-a951-165a4dfb56a3")], subtitle: "", tutorial: "", wherebuy: ""))
    }
}
