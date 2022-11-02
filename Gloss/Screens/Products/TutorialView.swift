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
            
            
         
            
            
            
            HStack(spacing: 0){
                ForEach(boarding){screen in
                    VStack{
                        ZStack{
                             WebImage(url: URL(string:beautyproduct.steps[index].image))
                                     .resizable()
                                     .aspectRatio(contentMode: .fill)
                                     .frame(width: 400, height: 400)
                                     .cornerRadius(50)
                        }
                        .padding(.top,
                                 -30)
                        
                        HStack{
                            ZStack{
                                NavigationLink(destination:
                                                DashboardView(beauty: Beauty(name: "", surname: "", age: 0, email: "", gender: "", skinconcern: 0, skintone: 0, skintype: 0, username: ""))
                                    .navigationBarBackButtonHidden(true)){
                                        
                                        Image("back")
                                            .resizable()
                                            .aspectRatio(contentMode: .fill)
                                            .frame(width: 35, height: 10, alignment: .center)
                                          
                                        
                                    }
                                
                            }.offset(x: -150, y: 100)
                        }
                        .padding(.top, -370)
               
                        
                        
                        VStack(spacing: 10){
                            Text(beautyproduct.steps[index].title)
                                .font(.custom("DreamAvenue", size: 40))
                                .foregroundColor(Color("Black"))
                                .padding(.top, 50)
                                .multilineTextAlignment(.center)
                                .frame(width: 350, height: 150, alignment: .center)
                        }
                       

                        VStack(spacing: 10){
                            Text(beautyproduct.steps[index].description)
                                .font(.custom("Livvic-Regular", size: 15))
                                .foregroundColor(Color("Black"))
                                .multilineTextAlignment(.center)
                                .padding(.top, -150)
                                .lineSpacing(10)
                                .frame(width: 300, height: 350, alignment: .leading)
                            if index == beautyproduct.steps.count - 1{
                                Button(action: {
                                    index += 1
                                }, label: {
                                    ZStack{
                                        RoundedRectangle(cornerRadius: 30)
                                            .fill(Color("Brown"))
                                            .frame(width: 350, height: 50)
                                            .shadow(color: .gray, radius: 5, x: 0, y: 5)
                                        Text("Next Step")
                                            .font(.custom("Livvic-SemiBoldItalic", size: 15))
                                            .foregroundColor(Color("White"))
                                    }
                                })
                                .padding(.top, -150)
                            
                            
                                
                            }else{
                                Button(action: {
                                    index += 1
                                }, label: {
                                    ZStack{
                                        RoundedRectangle(cornerRadius: 30)
                                            .fill(Color("Brown"))
                                            .frame(width: 350, height: 50)
                                            .shadow(color: .gray, radius: 5, x: 0, y: 5)
                                        Text("Next Step")
                                            .font(.custom("Livvic-SemiBoldItalic", size: 15))
                                            .foregroundColor(Color("White"))
                                    }
                                })
                                .padding(.top, -150)
                            }
                            

                                Button(action: {
                                   index += 1
                                    print(beautyproduct)
                                }, label :{
                                    ZStack{
                                        RoundedRectangle(cornerRadius: 30)
                                            .fill(Color("Brown"))
                                            .frame(width: 350, height: 50)
                                            .shadow(color: .gray, radius: 5, x: 0, y: 5)
                                        Text("Finish")
                                            .font(.custom("Livvic-SemiBoldItalic", size: 15))
                                            .foregroundColor(Color("White"))
                                    }
                                                

                                    
                                })
                                
                            


                    }
                    .ignoresSafeArea(.container, edges: .all)
                    .frame(width: getScreenBounds().width)
                    .frame(maxHeight: .infinity)
                        
                        
                     
                        

                }
            }
            .background(Color("Pink"))
            
            
          
         
            
   
        
                ForEach(0..<beautyproduct.steps.count, id: \.self){step in
                    
                    
                    
                    
                    
                    
                    
                }
                

                    }
            }
        }
    }


struct TutorialView_Previews: PreviewProvider {
    static var previews: some View {
        TutorialView(beautyproduct: Beautyproducts(category: "", description: "", image: "", ingredients: "", name: "", price: 0, shades: 0, size: "", skintone: "", steps: [Steps( title: "Swipe on some sunshine", description: "Start by dusting a deep yellow eyeshadow shade, like the one in the ‘Hi-Rise Sunset’ City Mini Eyeshadow Palette, over your full eyelid. Be sure to apply eyeshadow makeup to your bottom lash line as well!", image: "https://firebasestorage.googleapis.com/v0/b/glossroot.appspot.com/o/eyeshadow__2_beautyproduct_1.jpeg?alt=media&token=0eae3d15-f088-44f0-a951-165a4dfb56a3")], subtitle: "", tutorial: "", wherebuy: ""))
    }
}
